Extension: LegemiddelClassification
Id: legemiddel-classification
Title: "Legemiddel Classification"
Description: "Klassifisering av legemidler, primært med ATC-koder (Anatomisk Terapeutisk Kjemisk legemiddelregister)."
* ^context.type = #element
* ^context.expression = "Medication"
* ^status = #active
* ^date = "2025-09-12"
* ^publisher = "Folkehelseinstituttet"
* ^contact.name = "Folkehelseinstituttet"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "https://www.fhi.no"

* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept ^binding.strength = #preferred
* valueCodeableConcept ^binding.description = "ATC kode fra WHO ATC kodesystem"
* valueCodeableConcept ^binding.valueSet = "http://fhir.no/ValueSet/atc-valueset"