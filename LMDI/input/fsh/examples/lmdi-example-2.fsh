// Eksempel inline/contained, minimalt

Instance: Administrering-20
InstanceOf: Legemiddeladministrering
Description: "Utfyllende eksempel - contained med minimal medisinreferanse"
* status = #completed
* medicationReference = Reference(medisin-91171f8e-b615-41ba-881a-87b8e8075611)
* subject = Reference(https://fhi.no/fhir/lmdi/pasient/12345678)
* effectiveDateTime = "2024-05-28T10:00:00+02:00"
* dosage.dose.value = 100.0
* dosage.dose.unit = "mg"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code = #78421000
* dosage.route.coding[SCT].display = "Intramuscular route (qualifier value)"
* contained[+] = medisin-91171f8e-b615-41ba-881a-87b8e8075611

Instance: medisin-91171f8e-b615-41ba-881a-87b8e8075611
InstanceOf: Legemiddel
Usage: #inline
* code.coding[FestLegemiddelpakning].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning"
* code.coding[FestLegemiddelpakning].code = #ID_00B35335-0DF7-4C98-8A0A-1148F4599D21
* code.coding[FestLegemiddelpakning].display = "Botox pulv til inj væske, oppl 50 E"
* extension[classification].valueCodeableConcept = $ATC#M03AX01 "Botulinumtoksin"
* form.coding[7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448"
* form.coding[7448].code = #36
* form.coding[7448].display = "Pulver til injeksjonsvæske, oppløsning"
