// Scenario: Fullstendig kjemoterapiforløp med lokal legemiddelkatalog
// Demonstrerer: lokal legemiddelkatalog, ingredient-reference, diagnosekobling, forrige og gjeldende rekvirering, begge NPR-identifikatorer og alle MedicationRequest-extensions

Instance: Kjemoterapi-Full-Pasient
InstanceOf: Pasient
Usage: #example
Description: "Kreftpasient med fullere demografisk og geografisk kontekst."
* identifier[FNR].system = "urn:oid:2.16.578.1.12.4.1.4.1"
* identifier[FNR].value = "15076500565"
* gender = #male
* birthDate = "1965-07-15"
* address.use = #home
* address.district = "Trondheim"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#5001 "Trondheim"

Instance: Kjemoterapi-Full-Organisasjon
InstanceOf: Organisasjon
Usage: #example
Description: "Onkologisk avdeling som gjennomfører kjemoterapien."
* identifier[RSH].system = "urn:oid:2.16.578.1.12.4.1.4.102"
* identifier[RSH].value = "4201050"
* name = "Onkologisk avdeling, St. Olavs hospital"
* address.type = #physical
* address.district = "Trondheim"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#5001 "Trondheim"

Instance: Kjemoterapi-Full-Helsepersonell
InstanceOf: Helsepersonell
Usage: #example
Description: "Onkolog som rekvirerer kuren."
* identifier[HPR].system = "urn:oid:2.16.578.1.12.4.1.4.4"
* identifier[HPR].value = "8877665"

Instance: Kjemoterapi-Full-Episode
InstanceOf: Episode
Usage: #example
Description: "Kjemoterapiepisode med både string- og UUID-basert NPR-identifikator."
* status = #in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP "inpatient encounter"
* serviceProvider = Reference(Kjemoterapi-Full-Organisasjon)
* extension[nprEpisodeIdentifier].extension[stringIdentifier].valueString = "NPR-STOL-2025-789"
* extension[nprEpisodeIdentifier].extension[uuidIdentifier].valueUuid = "9b1deb4d-5b8b-4f83-8f9d-101c6a4a2dd9"

Instance: Kjemoterapi-Full-Diagnose
InstanceOf: Diagnose
Usage: #example
Description: "Diagnose knyttet til kjemoterapiregimet."
* subject = Reference(Kjemoterapi-Full-Pasient)
* stage.summary.text = "Adjuvant kjemoterapi etter colorectal cancer"
* code.coding[ICD10].system = "urn:oid:2.16.578.1.12.4.1.1.7110"
* code.coding[ICD10].code = #C18.7
* code.coding[ICD10].display = "Ondartet svulst i sigmoideum"
* code.coding[SCT].system = "http://snomed.info/sct"
* code.coding[SCT].code = #363406005
* code.coding[SCT].display = "Malignant tumor of colon"

Instance: Kjemoterapi-Full-Virkestoff
InstanceOf: Virkestoff
Usage: #example
Description: "Virkestoff for lokalregistrert oksaliplatin."
* code.coding.system = "http://snomed.info/sct"
* code.coding.code = #395814003
* code.coding.display = "Oxaliplatin (substance)"
* category.coding.system = "http://terminology.hl7.org/CodeSystem/substance-category"
* category.coding.code = #drug
* category.coding.display = "Drug or Medicament"

Instance: Kjemoterapi-Full-Oksaliplatin-LokalKatalog
InstanceOf: Legemiddel
Usage: #example
Description: "Lokalregistrert oksaliplatin med ingredient-reference og ATC-klassifisering."
* code.coding[LokaltLegemiddel].system = "http://fh.no/fhir/NamingSystem/lokaltVirkemiddel"
* code.coding[LokaltLegemiddel].code = #OXA-85-INF
* code.coding[LokaltLegemiddel].display = "Oksaliplatin 85 mg/m2 infusjonsvæske"
* extension[classification].valueCodeableConcept = $ATC#L01XA03 "Oksaliplatin"
* form.coding[OID7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448"
* form.coding[OID7448].code = #9
* form.coding[OID7448].display = "Infusjonsvæske, oppløsning"
* ingredient.itemReference = Reference(Kjemoterapi-Full-Virkestoff)
* ingredient.isActive = true

Instance: Kjemoterapi-Full-Forrige-Rekvirering
InstanceOf: Legemiddelrekvirering
Usage: #example
Description: "Tidligere rekvirering i samme kurforløp."
* identifier.system = "http://example.org/rekvirering-id"
* identifier.value = "KJEMO-2025-001"
* status = #completed
* intent = #order
* medicationReference = Reference(Kjemoterapi-Full-Oksaliplatin-LokalKatalog)
* subject = Reference(Kjemoterapi-Full-Pasient)
* requester = Reference(Kjemoterapi-Full-Helsepersonell)
* encounter = Reference(Kjemoterapi-Full-Episode)
* reasonReference = Reference(Kjemoterapi-Full-Diagnose)
* authoredOn = "2025-02-24"
* reportedBoolean = false
* courseOfTherapyType.text = "Kjemoterapikur"

Instance: Kjemoterapi-Full-Rekvirering
InstanceOf: Legemiddelrekvirering
Usage: #example
Description: "Aktiv rekvirering i FOLFOX6-regime med alle LMDI-extensions."
* identifier.system = "http://example.org/rekvirering-id"
* identifier.value = "KJEMO-2025-002"
* status = #active
* intent = #order
* medicationReference = Reference(Kjemoterapi-Full-Oksaliplatin-LokalKatalog)
* subject = Reference(Kjemoterapi-Full-Pasient)
* requester = Reference(Kjemoterapi-Full-Helsepersonell)
* encounter = Reference(Kjemoterapi-Full-Episode)
* reasonReference = Reference(Kjemoterapi-Full-Diagnose)
* priorPrescription = Reference(Kjemoterapi-Full-Forrige-Rekvirering)
* authoredOn = "2025-03-10"
* reportedBoolean = false
* courseOfTherapyType.text = "Kjemoterapikur"
* extension[prosentvisDoseendring].valueQuantity.value = 80
* extension[prosentvisDoseendring].valueQuantity.system = "http://unitsofmeasure.org"
* extension[prosentvisDoseendring].valueQuantity.code = #%
* extension[prosentvisDoseendring].valueQuantity.unit = "%"
* extension[delAvBehandlingsregime].valueString = "FOLFOX6"
* extension[kliniskStudie].valueBoolean = true

Instance: Kjemoterapi-Full-Administrering
InstanceOf: Legemiddeladministrering
Usage: #example
Description: "Infusjon av lokalregistrert oksaliplatin med request-, diagnose- og hastighetsinformasjon."
* status = #completed
* medicationReference = Reference(Kjemoterapi-Full-Oksaliplatin-LokalKatalog)
* subject = Reference(Kjemoterapi-Full-Pasient)
* context = Reference(Kjemoterapi-Full-Episode)
* request = Reference(Kjemoterapi-Full-Rekvirering)
* reasonReference = Reference(Kjemoterapi-Full-Diagnose)
* effectivePeriod.start = "2025-03-10T09:00:00+01:00"
* effectivePeriod.end = "2025-03-10T11:00:00+01:00"
* dosage.dose.value = 170
* dosage.dose.unit = "mg"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code = #47625008
* dosage.route.coding[SCT].display = "Intravenous route (qualifier value)"
* dosage.route.coding[OID7477].system = "urn:oid:2.16.578.1.12.4.1.1.7477"
* dosage.route.coding[OID7477].code = #7
* dosage.route.coding[OID7477].display = "Intravenøs"
* dosage.rateRatio.numerator.value = 250
* dosage.rateRatio.numerator.system = "http://unitsofmeasure.org"
* dosage.rateRatio.numerator.code = #ml
* dosage.rateRatio.denominator.value = 120
* dosage.rateRatio.denominator.system = "http://unitsofmeasure.org"
* dosage.rateRatio.denominator.code = #min

Instance: Kjemoterapi-Full-Bundle
InstanceOf: LegemiddelregisterBundle
Usage: #example
Title: "Fullt kjemoterapiscenario med lokal katalog, forrige rekvirering og aktiv administrering"
Description: "Komplett bundle som viser lokal legemiddelkatalog, diagnosekobling, begge NPR-identifikatorer og alle LMDI-extensions for rekvirering."
* identifier.system = "urn:oid:2.16.578.1.34.10.3"
* identifier.value = "kjemoterapi-full-bundle-001"
* timestamp = "2025-03-10T12:00:00+01:00"
* type = #transaction

* entry[0].resource = Kjemoterapi-Full-Pasient
* entry[0].request.method = #POST
* entry[0].request.url = "Patient"

* entry[1].resource = Kjemoterapi-Full-Helsepersonell
* entry[1].request.method = #POST
* entry[1].request.url = "Practitioner"

* entry[2].resource = Kjemoterapi-Full-Organisasjon
* entry[2].request.method = #POST
* entry[2].request.url = "Organization"

* entry[3].resource = Kjemoterapi-Full-Episode
* entry[3].request.method = #POST
* entry[3].request.url = "Encounter"

* entry[4].resource = Kjemoterapi-Full-Diagnose
* entry[4].request.method = #POST
* entry[4].request.url = "Condition"

* entry[5].resource = Kjemoterapi-Full-Virkestoff
* entry[5].request.method = #POST
* entry[5].request.url = "Substance"

* entry[6].resource = Kjemoterapi-Full-Oksaliplatin-LokalKatalog
* entry[6].request.method = #POST
* entry[6].request.url = "Medication"

* entry[7].resource = Kjemoterapi-Full-Forrige-Rekvirering
* entry[7].request.method = #POST
* entry[7].request.url = "MedicationRequest"

* entry[8].resource = Kjemoterapi-Full-Rekvirering
* entry[8].request.method = #POST
* entry[8].request.url = "MedicationRequest"

* entry[9].resource = Kjemoterapi-Full-Administrering
* entry[9].request.method = #POST
* entry[9].request.url = "MedicationAdministration"
