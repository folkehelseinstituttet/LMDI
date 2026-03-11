// Scenario: Endosebasert smertebehandling med rekvirering og diagnose
// Demonstrerer: D-nummer, diagnosekobling, FestLmrLopenr- og Varenummer-slicer, samt begge route-slicer

Instance: Endose-Smertebehandling-Pasient-Dnr
InstanceOf: Pasient
Usage: #example
Description: "Pasient med D-nummer i et innleggelsesscenario for postoperativ smertebehandling."
* identifier[DNR].system = "urn:oid:2.16.578.1.12.4.1.4.2"
* identifier[DNR].value = "52030078901"
* gender = #female
* birthDate = "2000-03-12"
* address.district = "Bergen"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#4601 "Bergen"

Instance: Endose-Smertebehandling-Rekvirent
InstanceOf: Helsepersonell
Usage: #example
Description: "Rekvirerende lege i sykehusscenarioet."
* identifier[HPR].system = "urn:oid:2.16.578.1.12.4.1.4.4"
* identifier[HPR].value = "7654321"

Instance: Endose-Smertebehandling-Sykehus
InstanceOf: Organisasjon
Usage: #example
Description: "Sykehusorganisasjon der behandling og administrering skjer."
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "974557746"
* identifier[RSH].system = "urn:oid:2.16.578.1.12.4.1.4.102"
* identifier[RSH].value = "4204191"
* name = "Haukeland universitetssjukehus"
* address.type = #physical
* address.district = "Bergen"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#4601 "Bergen"

Instance: Endose-Smertebehandling-Episode
InstanceOf: Episode
Usage: #example
Description: "Sykehusinnleggelse for pasient med akutt smertebehov."
* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP "inpatient encounter"
* serviceProvider = Reference(Endose-Smertebehandling-Sykehus)
* extension[nprEpisodeIdentifier].extension[stringIdentifier].valueString = "NPR-HUS-2025-4567"

Instance: Endose-Smertebehandling-Diagnose
InstanceOf: Diagnose
Usage: #example
Description: "Postoperativ smerte kodet med både ICD-10 og SNOMED CT."
* subject = Reference(Endose-Smertebehandling-Pasient-Dnr)
* stage.summary.text = "Akutt postoperativ smerte"
* code.coding[ICD10].system = "urn:oid:2.16.578.1.12.4.1.1.7110"
* code.coding[ICD10].code = #G89.1
* code.coding[ICD10].display = "Akutt smerte"
* code.coding[SCT].system = "http://snomed.info/sct"
* code.coding[SCT].code = #274663001
* code.coding[SCT].display = "Acute pain (finding)"

Instance: Endose-Smertebehandling-Morfin-Endose
InstanceOf: Legemiddel
Usage: #example
Description: "Morfin identifisert med både LMR-løpenummer og varenummer."
* code.coding[FestLmrLopenr].system = "http://dmp.no/fhir/NamingSystem/lmrLopenummer"
* code.coding[FestLmrLopenr].code = #1234567
* code.coding[FestLmrLopenr].display = "Morfin endose 10 mg/ml"
* code.coding[Varenummer].system = "http://dmp.no/fhir/NamingSystem/fest-varenummer"
* code.coding[Varenummer].code = #476281
* code.coding[Varenummer].display = "Morfin injeksjonsvæske 10 mg/ml"
* extension[classification].valueCodeableConcept = $ATC#N02AA01 "Morfin"
* form.coding[OID7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448"
* form.coding[OID7448].code = #11
* form.coding[OID7448].display = "Injeksjonsvæske, oppløsning"

Instance: Endose-Smertebehandling-Rekvirering
InstanceOf: Legemiddelrekvirering
Usage: #example
Description: "Rekvirering av morfin ved postoperativ smerte."
* status = #completed
* intent = #order
* medicationReference = Reference(Endose-Smertebehandling-Morfin-Endose)
* subject = Reference(Endose-Smertebehandling-Pasient-Dnr)
* requester = Reference(Endose-Smertebehandling-Rekvirent)
* authoredOn = "2025-03-09"
* reasonReference = Reference(Endose-Smertebehandling-Diagnose)
* encounter = Reference(Endose-Smertebehandling-Episode)

Instance: Endose-Smertebehandling-Administrering
InstanceOf: Legemiddeladministrering
Usage: #example
Description: "Subkutan administrering med både SNOMED- og OID7477-koding av administrasjonsvei."
* status = #completed
* medicationReference = Reference(Endose-Smertebehandling-Morfin-Endose)
* subject = Reference(Endose-Smertebehandling-Pasient-Dnr)
* context = Reference(Endose-Smertebehandling-Episode)
* request = Reference(Endose-Smertebehandling-Rekvirering)
* reasonReference = Reference(Endose-Smertebehandling-Diagnose)
* effectiveDateTime = "2025-03-09T22:30:00+01:00"
* dosage.dose.value = 5.0
* dosage.dose.unit = "mg"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code = #34206005
* dosage.route.coding[SCT].display = "Subcutaneous route (qualifier value)"
* dosage.route.coding[OID7477].system = "urn:oid:2.16.578.1.12.4.1.1.7477"
* dosage.route.coding[OID7477].code = #3
* dosage.route.coding[OID7477].display = "Subkutan"

Instance: Endose-Smertebehandling-Bundle
InstanceOf: LegemiddelregisterBundle
Usage: #example
Title: "Endosebasert smertebehandling med rekvirering, diagnose og administrering"
Description: "Komplett bundle for postoperativ smertebehandling der legemidlet er identifisert med LMR-løpenummer og varenummer."
* identifier.system = "urn:oid:2.16.578.1.34.10.3"
* identifier.value = "endose-smertebehandling-bundle-001"
* timestamp = "2025-03-10T08:00:00+01:00"
* type = #transaction

* entry[0].resource = Endose-Smertebehandling-Pasient-Dnr
* entry[0].request.method = #POST
* entry[0].request.url = "Patient"

* entry[1].resource = Endose-Smertebehandling-Rekvirent
* entry[1].request.method = #POST
* entry[1].request.url = "Practitioner"

* entry[2].resource = Endose-Smertebehandling-Sykehus
* entry[2].request.method = #POST
* entry[2].request.url = "Organization"

* entry[3].resource = Endose-Smertebehandling-Episode
* entry[3].request.method = #POST
* entry[3].request.url = "Encounter"

* entry[4].resource = Endose-Smertebehandling-Diagnose
* entry[4].request.method = #POST
* entry[4].request.url = "Condition"

* entry[5].resource = Endose-Smertebehandling-Morfin-Endose
* entry[5].request.method = #POST
* entry[5].request.url = "Medication"

* entry[6].resource = Endose-Smertebehandling-Rekvirering
* entry[6].request.method = #POST
* entry[6].request.url = "MedicationRequest"

* entry[7].resource = Endose-Smertebehandling-Administrering
* entry[7].request.method = #POST
* entry[7].request.url = "MedicationAdministration"
