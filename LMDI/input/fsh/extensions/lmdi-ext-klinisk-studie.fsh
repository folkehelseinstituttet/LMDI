Extension: KliniskStudie
Id: lmdi-klinisk-studie
Title: "Klinisk studie"
Description: "Angir om legemidlet gis som en del av en klinisk studie."
* ^context.type = #element
* ^context.expression = "MedicationRequest"
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Clinical trial"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "Indicates whether the medication is given as part of a clinical trial."
* value[x] only boolean
