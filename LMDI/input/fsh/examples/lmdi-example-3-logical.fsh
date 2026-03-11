// Eksempel: infusjon med logiske referanser
// Demonstrerer bruk av identifier-referanser i stedet for literal-referanser

Instance: Administrering-LogiskReferanse-Infusjon
InstanceOf: Legemiddeladministrering
Description: "Eksempel med logisk medikamentreferanse ved infusjon, uten lokal medication-ressurs i meldingen."
* status = #completed
* medicationReference.identifier.system = "uri:eu:spor:idmp:mpid:dummy"
* medicationReference.identifier.value = "1a38f25a8791fc3270e7c388f2031eee"
* subject = Reference(https://fhi.no/fhir/lmdi/pasient/12345678)
* context = Reference(https://fhi.no/fhir/lmdi/episode/428ff23d-7a65-4c67-8059-6a1d07d287e3)
* effectiveDateTime = "2024-05-28T14:30:00+02:00"
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code = #47625008
* dosage.route.coding[SCT].display = "Intravenous route (qualifier value)"
* dosage.dose.value = 100.0
* dosage.dose.unit = "mg"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg
