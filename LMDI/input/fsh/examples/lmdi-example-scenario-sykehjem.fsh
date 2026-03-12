// Scenario: Minimumsrapportering fra sykehjem
// Demonstrerer: to ulike Medication.code-slicer og et realistisk minimum av kontekst rundt administreringene

Instance: Pasient-Scenario-Sykehjem-Minimum-Med-FNR
InstanceOf: Pasient
Usage: #example
Description: "Minimumsscenario - pasient identifisert med fødselsnummer."
* identifier[FNR].system = "urn:oid:2.16.578.1.12.4.1.4.1"
* identifier[FNR].value = "12045678901"

Instance: Organisasjon-Scenario-Sykehjem-Minimum-Avdeling
InstanceOf: Organisasjon
Usage: #example
Description: "Minimumsscenario - avdelingen som administrerer legemidlet."
* identifier[RSH].system = "urn:oid:2.16.578.1.12.4.1.4.102"
* identifier[RSH].value = "7100001"
* name = "Avdeling 2B, Soltoppen sykehjem"
* partOf = Reference(Organisasjon-Scenario-Sykehjem-Minimum-Sykehjem)

Instance: Organisasjon-Scenario-Sykehjem-Minimum-Sykehjem
InstanceOf: Organisasjon
Usage: #example
Description: "Minimumsscenario - institusjonen som avdelingen tilhører."
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "987654321"
* name = "Soltoppen sykehjem"
* partOf = Reference(Organisasjon-Scenario-Sykehjem-Minimum-Kommune)

Instance: Organisasjon-Scenario-Sykehjem-Minimum-Kommune
InstanceOf: Organisasjon
Usage: #example
Description: "Minimumsscenario - overordnet kommuneorganisasjon."
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "938726027"
* name = "Drammen kommune"

Instance: Episode-Scenario-Sykehjem-Minimum-Opphold
InstanceOf: Episode
Usage: #example
Description: "Minimumsscenario - pågående sykehjemsopphold."
* status = #in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP "inpatient encounter"
* serviceProvider = Reference(Organisasjon-Scenario-Sykehjem-Minimum-Avdeling)

Instance: Legemiddel-Scenario-Sykehjem-Minimum-Paracetamol-FEST-Merkevare
InstanceOf: Legemiddel
Usage: #example
Description: "Minimumsscenario - paracetamol identifisert med FEST merkevare."
* code.coding[FestLegemiddelMerkevare].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare"
* code.coding[FestLegemiddelMerkevare].code = #2ABAC272-0BCF-43F0-84BE-984074D92E15
* code.coding[FestLegemiddelMerkevare].display = "Paracet tab 500 mg"

Instance: Legemiddel-Scenario-Sykehjem-Minimum-Oksykodon-FEST-Virkestoff
InstanceOf: Legemiddel
Usage: #example
Description: "Minimumsscenario - oksykodon identifisert med FEST virkestoff-id."
* code.coding[FestVirkestoff].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff"
* code.coding[FestVirkestoff].code = #C31AF94A-5D5A-4C91-9B99-BB221E26E4C9
* code.coding[FestVirkestoff].display = "Oksykodon"

Instance: Legemiddeladministrering-Scenario-Sykehjem-Minimum-Paracetamol
InstanceOf: Legemiddeladministrering
Usage: #example
Description: "Minimumsscenario - tablettadministrering uten valgfri kontekst utover episode."
* status = #completed
* medicationReference = Reference(Legemiddel-Scenario-Sykehjem-Minimum-Paracetamol-FEST-Merkevare)
* subject = Reference(Pasient-Scenario-Sykehjem-Minimum-Med-FNR)
* context = Reference(Episode-Scenario-Sykehjem-Minimum-Opphold)
* effectiveDateTime = "2025-03-10T08:00:00+01:00"
* dosage.dose.value = 500
* dosage.dose.unit = "mg"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg

Instance: Legemiddeladministrering-Scenario-Sykehjem-Minimum-Oksykodon
InstanceOf: Legemiddeladministrering
Usage: #example
Description: "Minimumsscenario - administrering av oksykodon som virkestoffidentifisert legemiddel."
* status = #completed
* medicationReference = Reference(Legemiddel-Scenario-Sykehjem-Minimum-Oksykodon-FEST-Virkestoff)
* subject = Reference(Pasient-Scenario-Sykehjem-Minimum-Med-FNR)
* context = Reference(Episode-Scenario-Sykehjem-Minimum-Opphold)
* effectiveDateTime = "2025-03-10T08:15:00+01:00"
* dosage.dose.value = 5.0
* dosage.dose.unit = "mg"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg

Instance: Bundle-Scenario-Sykehjem-Minimum
InstanceOf: LegemiddelregisterBundle
Usage: #example
Title: "Minimumsrapportering fra sykehjem med to administreringer"
Description: "Transaction-bundle med kun nødvendige felter, organisasjonshierarki og to ulike legemiddelslicer."
* identifier.system = "urn:oid:2.16.578.1.34.10.3"
* identifier.value = "sykehjem-minimum-bundle-001"
* timestamp = "2025-03-10T09:00:00+01:00"
* type = #transaction

* entry[0].resource = Pasient-Scenario-Sykehjem-Minimum-Med-FNR
* entry[0].request.method = #POST
* entry[0].request.url = "Patient"

* entry[1].resource = Organisasjon-Scenario-Sykehjem-Minimum-Avdeling
* entry[1].request.method = #POST
* entry[1].request.url = "Organization"

* entry[2].resource = Organisasjon-Scenario-Sykehjem-Minimum-Sykehjem
* entry[2].request.method = #POST
* entry[2].request.url = "Organization"

* entry[3].resource = Organisasjon-Scenario-Sykehjem-Minimum-Kommune
* entry[3].request.method = #POST
* entry[3].request.url = "Organization"

* entry[4].resource = Episode-Scenario-Sykehjem-Minimum-Opphold
* entry[4].request.method = #POST
* entry[4].request.url = "Encounter"

* entry[5].resource = Legemiddel-Scenario-Sykehjem-Minimum-Paracetamol-FEST-Merkevare
* entry[5].request.method = #POST
* entry[5].request.url = "Medication"

* entry[6].resource = Legemiddel-Scenario-Sykehjem-Minimum-Oksykodon-FEST-Virkestoff
* entry[6].request.method = #POST
* entry[6].request.url = "Medication"

* entry[7].resource = Legemiddeladministrering-Scenario-Sykehjem-Minimum-Paracetamol
* entry[7].request.method = #POST
* entry[7].request.url = "MedicationAdministration"

* entry[8].resource = Legemiddeladministrering-Scenario-Sykehjem-Minimum-Oksykodon
* entry[8].request.method = #POST
* entry[8].request.url = "MedicationAdministration"
