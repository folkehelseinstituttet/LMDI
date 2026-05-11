Extension: LegemiddelClassification
Id: legemiddel-classification
Title: "Legemiddel Classification"
Description: "Klassifisering av legemidler, primært med ATC-koder (Anatomisk Terapeutisk Kjemisk legemiddelregister)."
* ^context.type = #element
* ^context.expression = "Medication"
* ^status = #active
* ^date = "2025-09-12"
* ^publisher = "Folkehelseinstituttet"
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Medication Classification"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "Classification of medications, primarily using ATC codes (Anatomical Therapeutic Chemical classification)."
* ^contact.name = "Folkehelseinstituttet"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.fhi.no"

* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept ^binding.strength = #preferred
* valueCodeableConcept ^binding.description = "ATC kode fra WHO ATC kodesystem"
* valueCodeableConcept ^binding.valueSet = "http://fhir.no/ValueSet/atc-valueset"