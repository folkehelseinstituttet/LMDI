CodeSystem: LokalLegemiddelkatalogCodeSystem
Title: "Lokal Legemiddelkatalog Codes"
Description: "Kodesystem for lokal legemiddelkatalog"
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Local Medication Catalogue Codes"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "Code system for the local medication catalogue."
* #metavisionkatalogFraHso "MetavisionkatalogFraHso" "Metavisionkatalog fra Helse Sør-Øst"
* #metavisionkatalogFraHN "MetavisionkatalogFraHN" "Metavisionkatalog fra Helse Nord"

ValueSet: LokalLegemiddelkatalogValues
Title: "Lokal Legemiddelkatalog Values"
Description: "Gyldige verdier for lokal legemiddelkatalog"
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Local Medication Catalogue Values"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "Valid values for the local medication catalogue."
* include codes from system LokalLegemiddelkatalogCodeSystem
