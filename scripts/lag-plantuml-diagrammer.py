import json
import os
from dataclasses import dataclass
from typing import Dict, Optional, List, Set, Tuple

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
    # Legg til flere mappinger basert på filnavnene
    'lmdi-adresse': 'Adresse',
    'lmdi-diagnose': 'Diagnose',
    'lmdi-institusjonsopphold': 'Institusjonsopphold',
    'lmdi-legemiddel': 'Legemiddel',
    'lmdiLegemiddelrekvirering': 'Legemiddelrekvirering',
    'lmdLegemiddeladministrering': 'Legemiddeladministrering',
    'episode': 'Episode'  # Lagt til denne mappingen
}

def get_resource_name(resource_id: str) -> str:
    """Oversetter resource ID til navn hvis det finnes i mappingen."""
    # Strip any StructureDefinition- prefix if present
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
    max: str  # Can be a number or "*"

class FHIRStructure:
    def __init__(self, resource_id: str, display_name: str):
        self.resource_id = resource_id  # Original ID (e.g., lmdi-condition)
        self.display_name = display_name  # Display name (e.g., Diagnose)
        self.references: Dict[str, FHIRReference] = {}
        # Keep track of zero cardinality paths
        self.zero_cardinality_paths: Set[str] = set()
        # Store the base type for stereotypes
        self.base_type: str = ""
        # Store cardinality for each path
        self.element_cardinalities: Dict[str, ElementCardinality] = {}

def combine_cardinality(parent: ElementCardinality, child: ElementCardinality) -> ElementCardinality:
    """Combine parent and child cardinality to get effective cardinality."""
    # For minimum cardinality:
    # - If parent is 0, child can occur 0 times (regardless of child's min)
    # - If parent min > 0, then we need at least parent_min * child_min instances
    combined_min = 0 if parent.min == 0 else parent.min * child.min
    
    # For maximum cardinality:
    # - If either is unlimited (*), the result depends on the other
    # - If parent is 0, the result is 0 (impossible path)
    # - Otherwise, multiply the max values
    if parent.min == 0 and parent.max == "0":
        combined_max = "0"
    elif parent.max == "*" and child.max == "*":
        combined_max = "*"
    elif parent.max == "*":
        combined_max = "*"  # parent allows unlimited, child limits each parent
    elif child.max == "*":
        combined_max = "*"  # unlimited instances of child per each parent
    else:
        # Numeric multiplication of maximums
        try:
            p_max = int(parent.max)
            c_max = int(child.max)
            combined_max = str(p_max * c_max)
        except ValueError:
            # Fallback for any parsing issues
            combined_max = "*"
    
    return ElementCardinality(min=combined_min, max=combined_max)

def calculate_path_cardinality(path: str, element_cardinalities: Dict[str, ElementCardinality]) -> ElementCardinality:
    """Calculate the effective cardinality for a path by combining all parent cardinalities."""
    # Start with a default of exactly 1
    result = ElementCardinality(min=1, max="1")
    
    # Split the path and build up each segment
    parts = path.split('.')
    current_path = ""
    
    for i, part in enumerate(parts):
        # Skip the first part as it's the resource itself
        if i == 0:
            current_path = part
            continue
            
        # Build the path for this segment
        if current_path:
            current_path = f"{current_path}.{part}"
        else:
            current_path = part
            
        # If we have cardinality for this path, combine it
        if current_path in element_cardinalities:
            result = combine_cardinality(result, element_cardinalities[current_path])
    
    return result

def parse_element_definition(elements: List[dict], structure: FHIRStructure) -> None:
    """Parse FHIR element definitions for references and cardinalities."""
    # First pass - collect all path cardinalities
    for element in elements:
        path = element.get('path', '')
        
        # Skip if path doesn't have minimum segments
        if not path or path.count('.') < 0:
            continue
            
        # Extract cardinality
        min_value = element.get('min', 0)
        max_value = element.get('max', '*')
        
        # Store the cardinality for this path
        structure.element_cardinalities[path] = ElementCardinality(
            min=int(min_value), 
            max=max_value
        )
        
        # If this is a zero cardinality element, mark it
        if max_value == '0':
            structure.zero_cardinality_paths.add(path)
            print(f"Identified zero cardinality path: {path}")
    
    # Second pass - process references with correct combined cardinality
    for element in elements:
        path = element.get('path', '')
        
        # Skip if path doesn't have minimum segments (resource.element)
        if not path or path.count('.') < 1:
            continue
            
        # Check if this path or any parent has zero cardinality
        skip_element = False
        for zero_path in structure.zero_cardinality_paths:
            if path == zero_path or path.startswith(zero_path + '.'):
                skip_element = True
                print(f"Skipping {path} - path or parent has zero cardinality")
                break
                
        if skip_element:
            continue
            
        # Skip Extension fields
        if path.endswith('extension') or path.endswith('modifierExtension'):
            print(f"Skipping {path} - extension field")
            continue
        
        # Process different type structures
        type_info = element.get('type', [])
        
        for type_def in type_info:
            code = type_def.get('code')
            
            # Handle direct references
            if code == 'Reference':
                target_profiles = type_def.get('targetProfile', [])
                if not target_profiles:
                    continue
                
                # Calculate the effective cardinality for this path
                effective_cardinality = calculate_path_cardinality(path, structure.element_cardinalities)
                cardinality_str = f"{effective_cardinality.min}..{effective_cardinality.max}"
                
                # Process all target profiles in the list
                for target_profile in target_profiles:
                    # Skip if target is an Extension
                    if 'Extension' in target_profile:
                        print(f"Skipping {path} - references Extension")
                        continue
                        
                    # Extract the target type from the profile URL
                    target_type = target_profile.split('/')[-1]
                    if target_type.startswith('StructureDefinition-'):
                        target_type = target_type[len('StructureDefinition-'):]
                        
                    # For nested paths, use the full path in the reference name
                    source_part = path.split('.')[0]
                    
                    # Get the full path without the resource name for the reference name
                    # This keeps all the path elements for the relationship name
                    if '.' in path:
                        # Get everything after the resource name (the first segment)
                        friendly_name = path[len(source_part)+1:]
                        # Remove any [x] from the path segments
                        friendly_name = friendly_name.replace('[x]', '')
                    else:
                        friendly_name = path
                        # Remove any [x] if present in the resource name itself
                        friendly_name = friendly_name.replace('[x]', '')
                    
                    # Create unique reference key when there are multiple targets
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
    """Parse a FHIR StructureDefinition for resource references."""
    # Debug output
    print(f"Parsing file: {filename}")
    print(f"Resource kind: {profile_json.get('kind')}")
    print(f"Resource type: {profile_json.get('type')}")
    print(f"Resource id: {profile_json.get('id')}")
    print(f"Resource name: {profile_json.get('name')}")
    
    # Check if this is a profile or resource
    if profile_json.get('kind') not in ['resource', 'complex-type']:
        print(f"Skipping {filename} - not a resource or complex-type")
        return None
        
    # Get the resource ID - prioritize the 'id' field
    resource_id = profile_json.get('id')
    if not resource_id:
        # Fallback to the basename of file without extension
        resource_id = os.path.splitext(os.path.basename(filename))[0]
        if resource_id.startswith('StructureDefinition-'):
            resource_id = resource_id[len('StructureDefinition-'):]
    
    # Get the display name using the resource ID
    display_name = get_resource_name(resource_id)
    
    print(f"Using resource ID: {resource_id}")
    print(f"Using display name: {display_name}")
    
    # Create structure with both resource_id and display_name
    structure = FHIRStructure(resource_id, display_name)
    
    # Store the base type
    structure.base_type = profile_json.get('baseDefinition', '').split('/')[-1]
    if structure.base_type.startswith('StructureDefinition-'):
        structure.base_type = structure.base_type[len('StructureDefinition-'):]
    print(f"Base type: {structure.base_type}")
    
    # Check both snapshot and differential
    elements = (profile_json.get('snapshot', {}).get('element', []) or 
               profile_json.get('differential', {}).get('element', []))
    
    # Process all elements
    parse_element_definition(elements, structure)
    
    return structure

def find_structure_definitions(path: str) -> List[str]:
    """Finn alle StructureDefinition-*.json filer i angitt sti."""
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

def generate_plantuml(structures: List[FHIRStructure]) -> str:
    """Generate PlantUML for multiple structures with links to documentation."""
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
    
    # Track classes with relationships
    classes_with_relationships = set()
    
    # Create mappings between display names and resource IDs
    display_to_resource_map = {}  # Maps display name to resource ID
    
    # Build a map of display names to resource IDs and to structure objects
    for structure in structures:
        display_to_resource_map[structure.display_name] = structure.resource_id
    
    # First collect all classes involved in relationships
    for structure in structures:
        if structure.references:  # If this structure has outgoing references
            classes_with_relationships.add(structure.display_name)
            
        # Mark all target classes as having relationships
        for ref in structure.references.values():
            target_display = get_resource_name(ref.target)
            classes_with_relationships.add(target_display)
    
    # Add classes that have relationships
    defined_classes = set()
    base_types = {}  # Store base types for stereotypes
    
    # Extract base types from structures
    for structure in structures:
        if structure.display_name in classes_with_relationships:
            # Get base type from the structure
            if hasattr(structure, 'base_type') and structure.base_type:
                base_type = structure.base_type.split('/')[-1]  # Extract last part if it's a URL
                base_types[structure.display_name] = get_resource_name(base_type)
            else:
                # Default to Resource if no base type is specified
                base_types[structure.display_name] = "Resource"
    
    # Add classes with stereotypes and links
    for class_name in sorted(classes_with_relationships):
        base_type = base_types.get(class_name, "")
        
        # Find the resource ID for this class name
        resource_id = display_to_resource_map.get(class_name)
        
        # Generate link based on whether it's a profile or FHIR base resource
        if resource_id:
            # This is a profile class with a StructureDefinition file
            # Use the original resource ID for the link, not the display name
            link = f"https://folkehelseinstituttet.github.io/LMDI/StructureDefinition-{resource_id}.html"
        else:
            # This is a FHIR base resource
            # Convert to lowercase for FHIR base resource URLs
            link = f"https://hl7.org/fhir/R4/{class_name.lower()}.html"
        
        # Add class with stereotype and link
        if base_type:
            uml.append(f'class {class_name} <<{base_type}>> [[{link} {class_name} _blank]]')
        else:
            uml.append(f'class {class_name} [[{link} {class_name} _blank]]')
        
        defined_classes.add(class_name)
    
    uml.append("")  # Empty line after classes
    
    # Add all relationships
    for structure in structures:
        for ref in structure.references.values():
            source_display = structure.display_name
            target_display = get_resource_name(ref.target)
            uml.append(f'{source_display} "{ref.cardinality}" --> {target_display} : "{ref.name}"')
    
    uml.extend(["", "@enduml"])
    return "\n".join(uml)

def main(path: str) -> str:
    """
    Hovedfunksjon som håndterer både enkeltfiler og mapper.
    Returns PlantUML-diagrammet som en streng.
    """
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