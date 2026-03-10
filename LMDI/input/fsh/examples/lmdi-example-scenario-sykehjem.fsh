// Scenario A: Sykehjemsadministrering med organisasjonshierarki og flere administreringer
// Demonstrerer: Pasient, 3-nivå organisasjonshierarki, episode, 2 legemidler, 2 administreringer i én Bundle

Instance: Scenario-A-Pasient
InstanceOf: Pasient
Usage: #example
Description: "Scenario A - Sykehjemspasient"
* identifier[FNR].system = "urn:oid:2.16.578.1.12.4.1.4.1"
* identifier[FNR].value = "12045678901"
* gender = #female
* birthDate = "1945-04-12"
* address.district = "Drammen"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#3005 "Drammen"

Instance: Scenario-A-Org-Avdeling
InstanceOf: Organisasjon
Usage: #example
Description: "Scenario A - Sykehjemsavdeling"
* identifier[RSH].system = "urn:oid:2.16.578.1.12.4.1.4.102"
* identifier[RSH].value = "7100001"
* name = "Avdeling 2B, Soltoppen sykehjem"
* partOf = Reference(Scenario-A-Org-Sykehjem)

Instance: Scenario-A-Org-Sykehjem
InstanceOf: Organisasjon
Usage: #example
Description: "Scenario A - Sykehjem"
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "987654321"
* name = "Soltoppen sykehjem"
* partOf = Reference(Scenario-A-Org-Kommune)
* address.type = #physical
* address.district = "Drammen"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#3005 "Drammen"

Instance: Scenario-A-Org-Kommune
InstanceOf: Organisasjon
Usage: #example
Description: "Scenario A - Kommune"
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "938726027"
* name = "Drammen kommune"
* address.type = #physical
* address.district = "Drammen"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#3005 "Drammen"

Instance: Scenario-A-Episode
InstanceOf: Episode
Usage: #example
Description: "Scenario A - Sykehjemsopphold"
* status = #in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP "inpatient encounter"
* serviceProvider = Reference(Scenario-A-Org-Avdeling)
* extension[nprEpisodeIdentifier].extension[stringIdentifier].valueString = "NPR-SYK-2025-001"

Instance: Scenario-A-Medisin-Paracetamol
InstanceOf: Legemiddel
Usage: #example
Description: "Scenario A - Paracetamol 500 mg tablett"
* code.coding[FestLegemiddelMerkevare].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare"
* code.coding[FestLegemiddelMerkevare].code = #2ABAC272-0BCF-43F0-84BE-984074D92E15
* code.coding[FestLegemiddelMerkevare].display = "Paracet tab 500 mg"
* extension[classification].valueCodeableConcept = $ATC#N02BE01 "Paracetamol"
* form.coding[OID7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448"
* form.coding[OID7448].code = #1
* form.coding[OID7448].display = "Tablett"

Instance: Scenario-A-Medisin-Oksykodon
InstanceOf: Legemiddel
Usage: #example
Description: "Scenario A - Oksykodon mikstur 1 mg/ml"
* code.coding[FestVirkestoff].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff"
* code.coding[FestVirkestoff].code = #C31AF94A-5D5A-4C91-9B99-BB221E26E4C9
* code.coding[FestVirkestoff].display = "Oksykodon"
* extension[classification].valueCodeableConcept = $ATC#N02AA05 "Oksykodon"
* form.coding[OID7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448"
* form.coding[OID7448].code = #51
* form.coding[OID7448].display = "Mikstur, oppløsning"

Instance: Scenario-A-Administrering-Paracetamol
InstanceOf: Legemiddeladministrering
Usage: #example
Description: "Scenario A - Administrering av Paracetamol"
* status = #completed
* medicationReference = Reference(Scenario-A-Medisin-Paracetamol)
* subject = Reference(Scenario-A-Pasient)
* context = Reference(Scenario-A-Episode)
* effectiveDateTime = "2025-03-10T08:00:00+01:00"
* dosage.dose.value = 500
* dosage.dose.unit = "mg"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code = #421521009
* dosage.route.coding[SCT].display = "Swallow"

Instance: Scenario-A-Administrering-Oksykodon
InstanceOf: Legemiddeladministrering
Usage: #example
Description: "Scenario A - Administrering av Oksykodon mikstur"
* status = #completed
* medicationReference = Reference(Scenario-A-Medisin-Oksykodon)
* subject = Reference(Scenario-A-Pasient)
* context = Reference(Scenario-A-Episode)
* effectiveDateTime = "2025-03-10T08:15:00+01:00"
* dosage.dose.value = 5.0
* dosage.dose.unit = "ml"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #ml
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code = #421521009
* dosage.route.coding[SCT].display = "Swallow"

Instance: Scenario-A-Bundle
InstanceOf: LegemiddelregisterBundle
Usage: #example
Title: "Scenario A - Sykehjemsadministrering Bundle"
Description: "Komplett Bundle med sykehjemsadministrering, organisasjonshierarki og to administreringer"
* identifier.system = "urn:oid:2.16.578.1.34.10.3"
* identifier.value = "scenario-a-bundle-001"
* timestamp = "2025-03-10T09:00:00+01:00"
* type = #transaction

* entry[0].resource = Scenario-A-Pasient
* entry[0].request.method = #POST
* entry[0].request.url = "Patient"

* entry[1].resource = Scenario-A-Org-Avdeling
* entry[1].request.method = #POST
* entry[1].request.url = "Organization"

* entry[2].resource = Scenario-A-Org-Sykehjem
* entry[2].request.method = #POST
* entry[2].request.url = "Organization"

* entry[3].resource = Scenario-A-Org-Kommune
* entry[3].request.method = #POST
* entry[3].request.url = "Organization"

* entry[4].resource = Scenario-A-Episode
* entry[4].request.method = #POST
* entry[4].request.url = "Encounter"

* entry[5].resource = Scenario-A-Medisin-Paracetamol
* entry[5].request.method = #POST
* entry[5].request.url = "Medication"

* entry[6].resource = Scenario-A-Medisin-Oksykodon
* entry[6].request.method = #POST
* entry[6].request.url = "Medication"

* entry[7].resource = Scenario-A-Administrering-Paracetamol
* entry[7].request.method = #POST
* entry[7].request.url = "MedicationAdministration"

* entry[8].resource = Scenario-A-Administrering-Oksykodon
* entry[8].request.method = #POST
* entry[8].request.url = "MedicationAdministration"
