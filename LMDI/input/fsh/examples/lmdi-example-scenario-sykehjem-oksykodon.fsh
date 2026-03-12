// Scenario: sykehjemsadministrering med separate relaterte ressurser

Instance: Pasient-Scenario-Sykehjem-Oksykodon-Med-FNR
InstanceOf: Pasient
Usage: #example
Description: "Pasient med fødselsnummer i et enkelt sykehjemsscenario."
* identifier[FNR].system = "urn:oid:2.16.578.1.12.4.1.4.1"
* identifier[FNR].value = "13031353453"
* gender = #male
* birthDate = "1953-03-13"
* address.district = "Oslo"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#0301 "Oslo"

Instance: Helsepersonell-Scenario-Sykehjem-Oksykodon-Rekvirent
InstanceOf: Helsepersonell
Usage: #example
Description: "Rekvirent i sykehjemsscenarioet, identifisert med HPR-nummer."
* identifier[HPR].system = "urn:oid:2.16.578.1.12.4.1.4.4"
* identifier[HPR].value = "9144900"

Instance: Organisasjon-Scenario-Sykehjem-Oksykodon-Eldrehjem
InstanceOf: Organisasjon
Usage: #example
Description: "Sykehjemsorganisasjon fra primærhelsetjenesten."
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "1234567890"
* name = "Lykkedalen eldrehjem"
* type = $organization-type#prov "Healthcare Provider"
* address.type = #physical
* address.district = "Sigdal"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#3025 "Sigdal"

Instance: Episode-Scenario-Sykehjem-Oksykodon-Opphold
InstanceOf: Episode
Usage: #example
Description: "Sykehjemsopphold med både NPR string- og UUID-identifikator."
* status = #finished
* serviceProvider = Reference(Organisasjon-Scenario-Sykehjem-Oksykodon-Eldrehjem)
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP "inpatient encounter"
* extension[nprEpisodeIdentifier].extension[stringIdentifier].valueString = "NPR123456789"
* extension[nprEpisodeIdentifier].extension[uuidIdentifier].valueUuid = "550e8400-e29b-41d4-a716-446655440000"

Instance: Legemiddel-Scenario-Sykehjem-Oksykodon-FEST-Dose
InstanceOf: Legemiddel
Usage: #example
Description: "Legemiddel med FEST dose-id og SNOMED-koding."
* code.coding[FestLegemiddeldose].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelDose"
* code.coding[FestLegemiddeldose].code = #ID_48BD33D2-2838-4B81-8225-02391B7A4516
* code.coding[FestLegemiddeldose].display = "Oxycodone Orifarm mikst oppl 1 mg/ml"
* code.coding[SCT].system = "http://snomed.info/sct"
* code.coding[SCT].code = #414984009
* code.coding[SCT].display = "Product containing oxycodone (medicinal product)"
* extension[classification].valueCodeableConcept = $ATC#N02AA05 "Oksykodon"
* form.coding[OID7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448"
* form.coding[OID7448].code = #51
* form.coding[OID7448].display = "Mikstur, oppløsning"

Instance: Legemiddelrekvirering-Scenario-Sykehjem-Oksykodon-Oral
InstanceOf: Legemiddelrekvirering
Usage: #example
Description: "Rekvirering av oksykodon i sykehjemsscenarioet."
* status = #completed
* intent = #order
* medicationReference = Reference(Legemiddel-Scenario-Sykehjem-Oksykodon-FEST-Dose)
* subject = Reference(Pasient-Scenario-Sykehjem-Oksykodon-Med-FNR)
* requester = Reference(Helsepersonell-Scenario-Sykehjem-Oksykodon-Rekvirent)
* encounter = Reference(Episode-Scenario-Sykehjem-Oksykodon-Opphold)
* authoredOn = "2024-05-28T12:30:00+02:00"

Instance: Legemiddeladministrering-Scenario-Sykehjem-Oksykodon-Oral
InstanceOf: Legemiddeladministrering
Usage: #example
Description: "Oral administrering av oksykodon med referanser til egne relaterte ressurser."
* status = #completed
* medicationReference = Reference(Legemiddel-Scenario-Sykehjem-Oksykodon-FEST-Dose)
* subject = Reference(Pasient-Scenario-Sykehjem-Oksykodon-Med-FNR)
* context = Reference(Episode-Scenario-Sykehjem-Oksykodon-Opphold)
* request = Reference(Legemiddelrekvirering-Scenario-Sykehjem-Oksykodon-Oral)
* effectiveDateTime = "2024-05-28T13:14:00+02:00"
* dosage.dose.value = 5.0
* dosage.dose.unit = "mg"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code = #421521009
* dosage.route.coding[SCT].display = "Swallow"
