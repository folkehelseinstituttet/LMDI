ValueSet: ATCValueSet
Id: atc-valueset
Title: "ATC Kodesystem ValueSet"
Description: "ValueSet som inneholder koder fra WHO ATC (Anatomisk Terapeutisk Kjemisk legemiddelregister)"
* ^url = "http://fhir.no/ValueSet/atc-valueset"
* ^status = #active
* ^date = "2025-09-12"
* ^publisher = "Folkehelseinstituttet"
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "ATC Code System ValueSet"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "ValueSet containing codes from the WHO ATC (Anatomical Therapeutic Chemical classification)."
* ^contact.name = "Folkehelseinstituttet"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.fhi.no"
* include codes from system http://www.whocc.no/atc