// Eksempel: oral administrering med contained ressurser

Instance: Administrering-Contained-Oksykodon-Oral
InstanceOf: Legemiddeladministrering
Description: "Contained eksempel med oral administrering av oksykodon og tilhørende pasient-, episode- og organisasjonskontekst."
* status = #completed
* medicationReference = Reference(Legemiddel-Contained-Oksykodon-FestDose)
* subject = Reference(Pasient-Contained-Fnr-Oslo)
* context = Reference(Episode-Contained-Sykehjemsopphold)
* effectiveDateTime = "2024-05-28T13:14:00+02:00"
* dosage.dose.value = 5.0
* dosage.dose.unit = "mg"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code = #421521009
* dosage.route.coding[SCT].display = "Swallow"
* contained[+] = Legemiddel-Contained-Oksykodon-FestDose
* contained[+] = Pasient-Contained-Fnr-Oslo
* contained[+] = Helsepersonell-Contained-Hpr
* contained[+] = Episode-Contained-Sykehjemsopphold
* contained[+] = Organisasjon-Contained-Eldrehjem

Instance: Legemiddel-Contained-Oksykodon-FestDose
InstanceOf: Legemiddel
Usage: #inline
Description: "Contained legemiddel med FEST dose-id og SNOMED-koding."
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

Instance: Pasient-Contained-Fnr-Oslo
InstanceOf: Pasient
Description: "Contained pasient med fødselsnummer."
Usage: #inline
* identifier[FNR].system = "urn:oid:2.16.578.1.12.4.1.4.1"
* identifier[FNR].value = "13031353453"
* gender = #male
* birthDate = "1953-03-13"
* address.district = "Oslo"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#0301 "Oslo"

Instance: Helsepersonell-Contained-Hpr
InstanceOf: Helsepersonell
Usage: #inline
Description: "Contained rekvirent med HPR-nummer."
* identifier[HPR].system = "urn:oid:2.16.578.1.12.4.1.4.4"
* identifier[HPR].value = "9144900"

Instance: Episode-Contained-Sykehjemsopphold
InstanceOf: Episode
Description: "Contained episode med både NPR string- og UUID-identifikator."
Usage: #inline
* status = #finished
* serviceProvider = Reference(Organisasjon-Contained-Eldrehjem)
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP "inpatient encounter"
* extension[nprEpisodeIdentifier].extension[stringIdentifier].valueString = "NPR123456789"
* extension[nprEpisodeIdentifier].extension[uuidIdentifier].valueUuid = "550e8400-e29b-41d4-a716-446655440000"

Instance: Organisasjon-Contained-Eldrehjem
InstanceOf: Organisasjon
Description: "Contained organisasjon fra primærhelsetjenesten."
Usage: #inline
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "1234567890"
* name = "Lykkedalen eldrehjem"
* type = $organization-type#prov "Healthcare Provider"
* address.type = #physical
* address.district = "Sigdal"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#3025 "Sigdal"
