Extension: AssosiertLegemiddel
Id: lmdi-assosiert-legemiddel
Title: "Assosiert legemiddel"
Description: "Angir mer spesifikt identifiserte legemidler (f.eks. med FestId eller Varenummer) som kan velges ved administrering av et overordnet eller generisk definert lokalt legemiddel."
* ^context.type = #element
* ^context.expression = "Medication"
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Associated medication"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "Specifies more specifically identified medications (e.g. by FEST ID or item number) that can be selected when administering a local medication defined at a higher or generic level."
// Kodesystemet begrenses med en invariant i stedet for ValueSet-binding, fordi FhirMottak
// validerer uten terminologi. Hver extension bærer én kode og gjentas for flere legemidler.
* obeys lmdi-assosiert-legemiddel-system
* value[x] only Coding
* valueCoding.system 1..1
* valueCoding.code 1..1

Invariant: lmdi-assosiert-legemiddel-system
Description: "Assosiert legemiddel skal være angitt med FEST-id (legemiddeldose, merkevare eller pakning), LMR-løpenummer, varenummer eller SNOMED CT-kode."
Severity: #error
Expression: "value.ofType(Coding).all(system in ('http://dmp.no/fhir/NamingSystem/festLegemiddelDose' | 'http://dmp.no/fhir/NamingSystem/lmrLopenummer' | 'http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare' | 'http://dmp.no/fhir/NamingSystem/festLegemiddelPakning' | 'http://dmp.no/fhir/NamingSystem/fest-varenummer' | 'http://snomed.info/sct'))"
