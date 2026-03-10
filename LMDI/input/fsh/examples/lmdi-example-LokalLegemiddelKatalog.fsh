// Eksempel på legemiddel fra lokal legemiddelkatalog

Instance: Medisin-4-LokaltLegemiddel
InstanceOf: Legemiddel
Description: "Eksempel på legemiddel fra lokal legemiddelkatalog"
* code.coding[LokaltLegemiddel].system = "http://fh.no/fhir/NamingSystem/lokaltVirkemiddel"
* code.coding[LokaltLegemiddel].code = #12345
* code.coding[LokaltLegemiddel].display = "Spesialtilberedt kalsiumklorid-infusjon 10 mg/ml"
* form.coding[OID7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448"
* form.coding[OID7448].code = #9
* form.coding[OID7448].display = "Infusjonsvæske, oppløsning"
* ingredient.itemCodeableConcept.coding.system = "http://snomed.info/sct"
* ingredient.itemCodeableConcept.coding.code = #387309003
* ingredient.itemCodeableConcept.coding.display = "Calcium chloride (substance)"
* ingredient.isActive = true
