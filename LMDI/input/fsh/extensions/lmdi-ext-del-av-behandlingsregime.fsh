Extension: DelAvBehandlingsregime
Id: lmdi-del-av-behandlingsregime
Title: "Del av behandlingsregime"
Description: "Navnet på kuren, behandlingsregimet eller protokollen legemidlet gis som en del av. Spesielt relevant ved kjemoterapi."
* ^context.type = #element
* ^context.expression = "MedicationRequest"
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Part of treatment regimen"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "The name of the regimen, treatment protocol, or course the medication is given as part of. Particularly relevant in chemotherapy."
* value[x] only string
