// Scenario B: Rekvirering + administrering med diagnose
// Demonstrerer: Komplett flyt fra ordinering til administrering, med diagnose som indikasjon

Instance: Scenario-B-Pasient
InstanceOf: Pasient
Usage: #example
Description: "Scenario B - Pasient med D-nummer"
* identifier[DNR].system = "urn:oid:2.16.578.1.12.4.1.4.2"
* identifier[DNR].value = "52030078901"
* gender = #female
* birthDate = "2000-03-12"
* address.district = "Bergen"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#4601 "Bergen"

Instance: Scenario-B-Helsepersonell
InstanceOf: Helsepersonell
Usage: #example
Description: "Scenario B - Rekvirerende lege"
* identifier[HPR].system = "urn:oid:2.16.578.1.12.4.1.4.4"
* identifier[HPR].value = "7654321"

Instance: Scenario-B-Organisasjon
InstanceOf: Organisasjon
Usage: #example
Description: "Scenario B - Sykehus"
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "974557746"
* identifier[RSH].system = "urn:oid:2.16.578.1.12.4.1.4.102"
* identifier[RSH].value = "4204191"
* name = "Haukeland universitetssjukehus"
* address.type = #physical
* address.district = "Bergen"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#4601 "Bergen"

Instance: Scenario-B-Episode
InstanceOf: Episode
Usage: #example
Description: "Scenario B - Sykehusinnleggelse"
* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP "inpatient encounter"
* serviceProvider = Reference(Scenario-B-Organisasjon)
* extension[nprEpisodeIdentifier].extension[stringIdentifier].valueString = "NPR-HUS-2025-4567"

Instance: Scenario-B-Diagnose
InstanceOf: Diagnose
Usage: #example
Description: "Scenario B - Postoperativ smerte"
* subject = Reference(Scenario-B-Pasient)
* code.coding[ICD10].system = "urn:oid:2.16.578.1.12.4.1.1.7110"
* code.coding[ICD10].code = #G89.1
* code.coding[ICD10].display = "Akutt smerte"
* code.coding[SCT].system = "http://snomed.info/sct"
* code.coding[SCT].code = #274663001
* code.coding[SCT].display = "Acute pain (finding)"

Instance: Scenario-B-Medisin
InstanceOf: Legemiddel
Usage: #example
Description: "Scenario B - Morfin injeksjonsvæske"
* code.coding[FestLegemiddelMerkevare].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare"
* code.coding[FestLegemiddelMerkevare].code = #ID_81E2A556-B09B-4EC2-BA37-E3A9E3E0F6D0
* code.coding[FestLegemiddelMerkevare].display = "Morfin injeksjonsvæske 10 mg/ml"
* extension[classification].valueCodeableConcept = $ATC#N02AA01 "Morfin"
* form.coding[7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448"
* form.coding[7448].code = #11
* form.coding[7448].display = "Injeksjonsvæske, oppløsning"

Instance: Scenario-B-Rekvirering
InstanceOf: Legemiddelrekvirering
Usage: #example
Description: "Scenario B - Rekvirering av Morfin"
* status = #completed
* intent = #order
* medicationReference = Reference(Scenario-B-Medisin)
* subject = Reference(Scenario-B-Pasient)
* requester = Reference(Scenario-B-Helsepersonell)
* authoredOn = "2025-03-09"
* reasonReference = Reference(Scenario-B-Diagnose)
* encounter = Reference(Scenario-B-Episode)

Instance: Scenario-B-Administrering
InstanceOf: Legemiddeladministrering
Usage: #example
Description: "Scenario B - Administrering av Morfin subkutant"
* status = #completed
* medicationReference = Reference(Scenario-B-Medisin)
* subject = Reference(Scenario-B-Pasient)
* context = Reference(Scenario-B-Episode)
* request = Reference(Scenario-B-Rekvirering)
* reasonReference = Reference(Scenario-B-Diagnose)
* effectiveDateTime = "2025-03-09T22:30:00+01:00"
* dosage.dose.value = 5.0
* dosage.dose.unit = "mg"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code = #34206005
* dosage.route.coding[SCT].display = "Subcutaneous route (qualifier value)"

Instance: Scenario-B-Bundle
InstanceOf: LegemiddelregisterBundle
Usage: #example
Title: "Scenario B - Rekvirering og administrering Bundle"
Description: "Komplett Bundle med rekvirering, administrering og diagnose"
* identifier.system = "urn:oid:2.16.578.1.34.10.3"
* identifier.value = "scenario-b-bundle-001"
* timestamp = "2025-03-10T08:00:00+01:00"
* type = #transaction

* entry[0].resource = Scenario-B-Pasient
* entry[0].request.method = #POST
* entry[0].request.url = "Patient"

* entry[1].resource = Scenario-B-Helsepersonell
* entry[1].request.method = #POST
* entry[1].request.url = "Practitioner"

* entry[2].resource = Scenario-B-Organisasjon
* entry[2].request.method = #POST
* entry[2].request.url = "Organization"

* entry[3].resource = Scenario-B-Episode
* entry[3].request.method = #POST
* entry[3].request.url = "Encounter"

* entry[4].resource = Scenario-B-Diagnose
* entry[4].request.method = #POST
* entry[4].request.url = "Condition"

* entry[5].resource = Scenario-B-Medisin
* entry[5].request.method = #POST
* entry[5].request.url = "Medication"

* entry[6].resource = Scenario-B-Rekvirering
* entry[6].request.method = #POST
* entry[6].request.url = "MedicationRequest"

* entry[7].resource = Scenario-B-Administrering
* entry[7].request.method = #POST
* entry[7].request.url = "MedicationAdministration"
