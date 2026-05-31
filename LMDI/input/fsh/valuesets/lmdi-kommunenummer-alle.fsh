ValueSet: KommunenummerValueSet
Id: kommunenummer-alle
Title: "Kommunenummer ValueSet"
Description: "Komplett kodeverk for norske kommunenummer (Volven 3402)"
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Municipality number ValueSet"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "Complete code system for Norwegian municipality numbers (Volven 3402)."
* ^status = #active
* include codes from system KommunenummerCodeSystem

CodeSystem: KommunenummerCodeSystem
Id: kommunenummer-codesystem
Title: "Kommunenummer CodeSystem"
Description: "Kodesystem for norske kommunenummer (Volven 3402)"
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Municipality number CodeSystem"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "Code system for Norwegian municipality numbers (Volven 3402)."
* ^url = "urn:oid:2.16.578.1.12.4.1.1.3402"
* ^status = #active
* ^content = #not-present
