import json
import os
import requests
from dataclasses import dataclass
from typing import Dict, Optional, List, Set
from urllib.parse import urljoin

RESOURCE_NAME_MAPPING = {
    'lmdi-bundle': 'LegemiddelregisterBundle',
    'lmdi-condition': 'Diagnose',
    'lmdi-encounter': 'Episode',
    'lmdi-episodeofcare': 'Institusjonsopphold',
    'lmdi-medication': 'Legemiddel',
    'lmdi-medicationadministration': 'Legemiddeladministrering',
    'lmdi-medicationrequest': 'Legemiddelrekvirering',
    'lmdi-organization': 'Organisasjon',
    'lmdi-patient': 'Pasient',
    'lmdi-practitioner': 'Helsepersonell',
    'lmdi-practitionerrole': 'Helsepersonellrolle',
    'lmdi-adresse': 'Adresse',
    'lmdi-diagnose': 'Diagnose',
    'lmdi-institusjonsopphold': 'Institusjonsopphold',
    'lmdi-legemiddel': 'Legemiddel',
    'lmdiLegemiddelrekvirering': 'Legemiddelrekvirering',
    'lmdLegemiddeladministrering': 'Legemiddeladministrering',
    'episode': 'Episode'  # Lagt til denne mappingen
}

STANDARD_ELEMENTS = {
    'id', 'meta', 'implicitRules', 'language', 'text', 'contained',
    'extension', 'modifierExtension', 'resourceType'
}

LMDI_DOCS_BASE_URL = "https://folkehelseinstituttet.github.io/LMDI/StructureDefinition-"
FHIR_DOCS_BASE_URL = "https://hl7.org/fhir/R4/"
FHIR_R4_BASE_URL = "http://hl7.org/fhir/R4/"

RESOURCE_DEFINITION_CACHE = {}

def get_resource_name(resource_id: str) -> str:
    if resource_id.startswith('StructureDefinition-'):
        resource_id = resource_id[len('StructureDefinition-'):]
    return RESOURCE_NAME_MAPPING.get(resource_id, resource_id)

@dataclass
class FHIRReference:
    source: str
    target: str
    name: str
    cardinality: str

@dataclass
class ElementCardinality:
    min: int
    max: str  # Kan være et tall eller "*"

@dataclass
class FHIRAttribute:
    name: str
    type: str
    cardinality: str
    path: str
    slice_name: Optional[str] = None

class FHIRStructure:
    def __init__(self, name: str):
        self.name = name
        self.references: Dict[str, FHIRReference] = {}
        self.zero_cardinality_paths: Set[str] = set()
        self.base_type: str = ""
        self.element_cardinalities: Dict[str, ElementCardinality] = {}
        self.attributes: List[FHIRAttribute] = []
        self.id: str = ""
        self.is_local_profile: bool = True

def combine_cardinality(parent: ElementCardinality, child: ElementCardinality) -> ElementCardinality:
    combined_min = 0 if parent.min == 0 else parent.min * child.min
    if parent.min == 0 and parent.max == "0":
        combined_max = "0"
    elif parent.max == "*" and child.max == "*":
        combined_max = "*"
    elif parent.max == "*":
        combined_max = "*"
    elif child.max == "*":
        combined_max = "*"
    else:
        try:
            p_max = int(parent.max)
            c_max = int(child.max)
            combined_max = str(p_max * c_max)
        except ValueError:
            combined_max = "*"
    return ElementCardinality(min=combined_min, max=combined_max)

def calculate_path_cardinality(path: str, element_cardinalities: Dict[str, ElementCardinality]) -> ElementCardinality:
    result = ElementCardinality(min=1, max="1")
    parts = path.split('.')
    current_path = ""
    for i, part in enumerate(parts):
        if i == 0:
            current_path = part
            continue
        if current_path:
            current_path = f"{current_path}.{part}"
        else:
            current_path = part
        if current_path in element_cardinalities:
            result = combine_cardinality(result, element_cardinalities[current_path])
    return result

def should_include_as_attribute(path: str, type_info: List[dict], element_by_path: Dict[str, dict]) -> bool:
    parts = path.split('.')
    # Direkte barn (dybde 2, f.eks. "Diagnose.code")
    if len(parts) == 2:
        element_name = parts[-1]
        if element_name in STANDARD_ELEMENTS:
            return False
        for t in type_info:
            if t.get('code') == 'Reference':
                return False
        return True
    # Under-elementer av et BackboneElement (dybde 3, f.eks. "Diagnose.stage.summary")
    elif len(parts) == 3:
        child_name = parts[-1]
        # Ikke vis STANDARD_ELEMENTS for BackboneElement's
        if child_name in STANDARD_ELEMENTS:
            return False
        parent_path = '.'.join(parts[:2])
        parent_element = element_by_path.get(parent_path)
        if parent_element:
            parent_type_info = parent_element.get('type', [])
            for pt in parent_type_info:
                if pt.get('code') == 'BackboneElement':
                    return True
        return False
    else:
        return False

def parse_element_definition(elements: List[dict], structure: FHIRStructure) -> None:
    # Bygg en ordbok for å slå opp elementdefinisjoner via path
    element_by_path = {}
    for element in elements:
        path = element.get('path', '')
        if path:
            element_by_path[path] = element

    # Første gjennomgang: samle alle kardinaliteter
    for element in elements:
        path = element.get('path', '')
        if not path or path.count('.') < 0:
            continue
        min_value = element.get('min', 0)
        max_value = element.get('max', '*')
        structure.element_cardinalities[path] = ElementCardinality(
            min=int(min_value),
            max=max_value
        )
        if max_value == '0':
            structure.zero_cardinality_paths.add(path)
            print(f"Identified zero cardinality path: {path}")

    # Andre gjennomgang: prosesser referanser og attributter
    for element in elements:
        path = element.get('path', '')
        if not path or path.count('.') < 1:
            continue
        skip_element = False
        for zero_path in structure.zero_cardinality_paths:
            if path == zero_path or path.startswith(zero_path + '.'):
                skip_element = True
                print(f"Skipping {path} - path or parent has zero cardinality")
                break
        if skip_element:
            continue
        type_info = element.get('type', [])
        effective_cardinality = calculate_path_cardinality(path, structure.element_cardinalities)
        cardinality_str = f"{effective_cardinality.min}..{effective_cardinality.max}"
        if should_include_as_attribute(path, type_info, element_by_path):
            # Fjern klassenavnet (første del) fra elementnavnet
            short_name = path
            if '.' in path:
                short_name = path.split('.', 1)[1]
            type_name = "unknown"
            if type_info:
                if short_name.endswith('[x]'):
                    types = [t.get('code', 'unknown') for t in type_info]
                    type_name = ' | '.join(types)
                else:
                    type_name = type_info[0].get('code', 'unknown')
            slice_name = None
            slicing_info = element.get('sliceName')
            if slicing_info:
                slice_name = slicing_info
            if not slice_name and 'slicing' in element:
                slice_name = "sliced"
            attribute = FHIRAttribute(
                name=short_name,  # Kun elementnavnet uten klassenavn
                type=type_name,
                cardinality=cardinality_str,
                path=path,
                slice_name=slice_name
            )
            structure.attributes.append(attribute)
            print(f"Added attribute: {short_name}: {type_name} [{cardinality_str}]{' slice: ' + slice_name if slice_name else ''}")
        for type_def in type_info:
            code = type_def.get('code')
            if code == 'Reference':
                target_profiles = type_def.get('targetProfile', [])
                if not target_profiles:
                    continue
                for target_profile in target_profiles:
                    if 'Extension' in target_profile:
                        print(f"Skipping {path} - references Extension")
                        continue
                    target_type = target_profile.split('/')[-1]
                    if target_type.startswith('StructureDefinition-'):
                        target_type = target_type[len('StructureDefinition-'):]
                    source_part = path.split('.')[0]
                    if '.' in path:
                        friendly_name = path[len(source_part)+1:]
                        friendly_name = friendly_name.replace('[x]', '')
                    else:
                        friendly_name = path.replace('[x]', '')
                    ref_key = f"{friendly_name}_to_{target_type}" if len(target_profiles) > 1 else friendly_name
                    reference = FHIRReference(
                        source=source_part,
                        target=target_type,
                        name=friendly_name,
                        cardinality=cardinality_str
                    )
                    structure.references[ref_key] = reference
                    print(f"Found reference: {source_part} -- {friendly_name} --> {target_type} [{cardinality_str}]")

def parse_structure_definition(profile_json: dict, filename: str) -> Optional[FHIRStructure]:
    print(f"Parsing file: {filename}")
    print(f"Resource kind: {profile_json.get('kind')}")
    print(f"Resource type: {profile_json.get('type')}")
    print(f"Resource id: {profile_json.get('id')}")
    print(f"Resource name: {profile_json.get('name')}")
    if profile_json.get('kind') not in ['resource', 'complex-type']:
        print(f"Skipping {filename} - not a resource or complex-type")
        return None
    resource_id = profile_json.get('id', '')
    resource_name = None
    for field in ['name', 'id', 'type']:
        if profile_json.get(field):
            value = profile_json.get(field)
            if value in RESOURCE_NAME_MAPPING:
                resource_name = RESOURCE_NAME_MAPPING[value]
                break
            else:
                resource_name = value
                break
    if not resource_name:
        resource_name = os.path.splitext(os.path.basename(filename))[0]
        if resource_name.startswith('StructureDefinition-'):
            resource_name = resource_name[len('StructureDefinition-'):]
    print(f"Using structure name: {resource_name}")
    structure = FHIRStructure(resource_name)
    structure.id = resource_id
    structure.is_local_profile = not filename.startswith("fetched-")
    structure.base_type = profile_json.get('baseDefinition', '').split('/')[-1]
    if structure.base_type.startswith('StructureDefinition-'):
        structure.base_type = structure.base_type[len('StructureDefinition-'):]
    print(f"Base type: {structure.base_type}")
    elements = (profile_json.get('snapshot', {}).get('element', []) or 
                profile_json.get('differential', {}).get('element', []))
    parse_element_definition(elements, structure)
    return structure

def fetch_fhir_resource_definition(resource_type: str) -> Optional[dict]:
    if resource_type in RESOURCE_DEFINITION_CACHE:
        return RESOURCE_DEFINITION_CACHE[resource_type]
    resource_type_lower = resource_type.lower()
    url = urljoin(FHIR_R4_BASE_URL, f"{resource_type_lower}.profile.json")
    try:
        print(f"Fetching FHIR resource definition for {resource_type} from {url}")
        response = requests.get(url)
        if response.status_code == 200:
            data = response.json()
            RESOURCE_DEFINITION_CACHE[resource_type] = data
            return data
        else:
            print(f"Failed to fetch resource definition for {resource_type}: HTTP {response.status_code}")
            alt_url = urljoin(FHIR_R4_BASE_URL, f"StructureDefinition-{resource_type}.json")
            print(f"Trying alternate URL: {alt_url}")
            alt_response = requests.get(alt_url)
            if alt_response.status_code == 200:
                data = alt_response.json()
                RESOURCE_DEFINITION_CACHE[resource_type] = data
                return data
            return None
    except Exception as e:
        print(f"Error fetching resource definition for {resource_type}: {str(e)}")
        return None

def get_documentation_url(structure: FHIRStructure) -> str:
    if structure.is_local_profile:
        return f"{LMDI_DOCS_BASE_URL}{structure.id}.html"
    else:
        return f"{FHIR_DOCS_BASE_URL}{structure.id.lower()}.html"

def find_structure_definitions(path: str) -> List[str]:
    structure_files = []
    if os.path.isfile(path):
        return [path] if os.path.basename(path).startswith('StructureDefinition-') else []
    for root, _, files in os.walk(path):
        for file in files:
            if file.startswith('StructureDefinition-') and file.endswith('.json'):
                full_path = os.path.join(root, file)
                structure_files.append(full_path)
                print(f"Found file: {full_path}")
    return structure_files

def get_structure_for_resource_type(resource_type: str, structures: List[FHIRStructure]) -> Optional[FHIRStructure]:
    for structure in structures:
        if structure.name == resource_type or get_resource_name(structure.name) == resource_type:
            return structure
    profile_json = fetch_fhir_resource_definition(resource_type)
    if profile_json:
        structure = parse_structure_definition(profile_json, f"fetched-{resource_type}")
        if structure:
            structure.is_local_profile = False
            structure.id = resource_type.lower()
            structures.append(structure)
            return structure
    return None

def generate_plantuml(structures: List[FHIRStructure]) -> str:
    uml = [
        "@startuml",
        "",
        "hide empty members",
        "skinparam class {",
        "    BackgroundColor White",
        "    ArrowColor Black",
        "    BorderColor Black",
        "}",
        ""
    ]
    classes_with_relationships = set()
    for structure in structures:
        source_name = get_resource_name(structure.name)
        if structure.references:
            classes_with_relationships.add(source_name)
        for ref in structure.references.values():
            target_name = get_resource_name(ref.target)
            classes_with_relationships.add(target_name)
    defined_classes = set()
    base_types = {}
    for structure in structures:
        structure_name = get_resource_name(structure.name)
        if structure_name in classes_with_relationships:
            if hasattr(structure, 'base_type') and structure.base_type:
                base_type = structure.base_type.split('/')[-1]
                base_types[structure_name] = get_resource_name(base_type)
            else:
                base_types[structure_name] = "Resource"
    for structure in structures:
        structure_name = get_resource_name(structure.name)
        if structure_name in classes_with_relationships and structure_name not in defined_classes:
            base_type = base_types.get(structure_name, "")
            doc_url = get_documentation_url(structure)
            display_name = structure_name
            if base_type:
                uml.append(f'class {structure_name} <<{base_type}>> [[{doc_url} {display_name} _blank]] {{')
            else:
                uml.append(f'class {structure_name} [[{doc_url} {display_name} _blank]] {{')
            grouped_attributes = {}
            for attr in structure.attributes:
                if attr.name not in grouped_attributes:
                    grouped_attributes[attr.name] = []
                grouped_attributes[attr.name].append(attr)
            for attr_name, attr_list in sorted(grouped_attributes.items()):
                if len(attr_list) == 1:
                    attr = attr_list[0]
                    uml.append(f'    {attr.name} : {attr.type} [{attr.cardinality}]')
                else:
                    for i, attr in enumerate(attr_list):
                        slice_info = f" ({attr.slice_name})" if attr.slice_name else f" (slice {i+1})"
                        uml.append(f'    {attr.name}{slice_info} : {attr.type} [{attr.cardinality}]')
            uml.append('}')
            defined_classes.add(structure_name)
    referenced_classes = classes_with_relationships - defined_classes
    for class_name in sorted(referenced_classes):
        structure = get_structure_for_resource_type(class_name, structures)
        if structure:
            base_type = base_types.get(class_name, "")
            doc_url = get_documentation_url(structure)
            display_name = class_name
            if base_type:
                uml.append(f'class {class_name} <<{base_type}>> [[{doc_url} {display_name} _blank]] {{')
            else:
                uml.append(f'class {class_name} [[{doc_url} {display_name} _blank]] {{')
            grouped_attributes = {}
            for attr in structure.attributes:
                if attr.name not in grouped_attributes:
                    grouped_attributes[attr.name] = []
                grouped_attributes[attr.name].append(attr)
            for attr_name, attr_list in sorted(grouped_attributes.items()):
                if len(attr_list) == 1:
                    attr = attr_list[0]
                    uml.append(f'    {attr.name} : {attr.type} [{attr.cardinality}]')
                else:
                    for i, attr in enumerate(attr_list):
                        slice_info = f" ({attr.slice_name})" if attr.slice_name else f" (slice {i+1})"
                        uml.append(f'    {attr.name}{slice_info} : {attr.type} [{attr.cardinality}]')
            uml.append('}')
        else:
            base_type = base_types.get(class_name, "Resource")
            doc_url = f"{FHIR_DOCS_BASE_URL}{class_name.lower()}.html"
            display_name = class_name
            uml.append(f'class {class_name} <<{base_type}>> [[{doc_url} {display_name} _blank]] {{')
            uml.append('}')
        defined_classes.add(class_name)
    uml.append("")
    for structure in structures:
        source_name = get_resource_name(structure.name)
        for ref in structure.references.values():
            target_name = get_resource_name(ref.target)
            uml.append(f'{source_name} "{ref.cardinality}" --> {target_name} : "{ref.name}"')
    uml.extend(["", "@enduml"])
    return "\n".join(uml)

def main(path: str) -> str:
    structure_files = find_structure_definitions(path)
    if not structure_files:
        raise ValueError(f"Ingen StructureDefinition-filer funnet i {path}")
    print(f"Found {len(structure_files)} structure definition files")
    structures = []
    for file_path in structure_files:
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                profile_json = json.load(f)
            structure = parse_structure_definition(profile_json, file_path)
            if structure:
                structures.append(structure)
                print(f"Successfully parsed {file_path}")
            else:
                print(f"No valid structure found in {file_path}")
        except Exception as e:
            print(f"Error processing {file_path}: {str(e)}")
    if not structures:
        raise ValueError("No valid profiles found in files")
    print(f"Successfully parsed {len(structures)} structures")
    return generate_plantuml(structures)

if __name__ == "__main__":
    import sys
    if len(sys.argv) != 2:
        print("Usage: python script.py <path-to-file-or-directory>")
        sys.exit(1)
    try:
        print(main(sys.argv[1]))
    except Exception as e:
        print(f"Error: {str(e)}")
        sys.exit(1)
