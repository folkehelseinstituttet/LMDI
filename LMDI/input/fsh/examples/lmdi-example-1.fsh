// Eksempel inline/contained

Alias: $SCT = http://snomed.info/sct

Instance: Administrering-10
InstanceOf: Legemiddeladministrering
Description: "Utfyllende eksempel, f.eks. om alt rapporteres som én melding. Bruker contained - bundle er å foretrekke for melding."
* status = #completed
* medicationReference = Reference(Medisin-10)
* subject = Reference(Pasient-20)
* context = Reference(Episode-2-Sykehjem)
* effectiveDateTime = "2024-05-28T13:14:00Z"
* contained[+] = Medisin-10
* contained[+] = Pasient-20
* contained[+] = Helsepersonell-10
* contained[+] = Episode-2-Sykehjem
* contained[+] = Organisasjon-2-Eldrehjem

Instance: Medisin-10
InstanceOf: Legemiddel
Usage: #inline
* code.coding[0].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelDose"
* code.coding[=] = #ID_48BD33D2-2838-4B81-8225-02391B7A4516
* code.coding[=].display = "Oxycodone Orifarm mikst oppl 1 mg/ml"
* code.coding[+].system = $SCT
* code.coding[=] = #414984009
* code.coding[=].display = "Product containing oxycodone (medicinal product)"

Instance: Pasient-20
InstanceOf: Pasient
Description: "Eksempel på pasient med fødselsnummer"
Usage: #inline
* identifier[FNR].system = "urn:oid:2.16.578.1.12.4.1.4.1"
* identifier[FNR].value = "13031353453"

Instance: Helsepersonell-10
InstanceOf: Helsepersonell
Usage: #inline
* identifier[HPR].system = "urn:oid:2.16.578.1.12.4.1.4.4"
* identifier[HPR].value = "9144900"

Instance: Episode-2-Sykehjem
InstanceOf: Episode
Description: "Eksempel på Episode"
Usage: #inline
* status = #finished
* serviceProvider = Reference(Organisasjon-2-Eldrehjem)
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP "inpatient encounter"
* extension[NprEpisodeIdentifier].extension[stringIdentifier].valueString = "NPR123456789"
* extension[NprEpisodeIdentifier].extension[uuidIdentifier].valueUuid = "550e8400-e29b-41d4-a716-446655440000"

Instance: Organisasjon-2-Eldrehjem
InstanceOf: Organisasjon
Description: "Eksempel på organisasjon - Primærhelsetjeneste"
Usage: #inline
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "1234567890"
* name = "Lykkedalen eldrehjem"
* type = $organization-type#prov "Healthcare Provider"
