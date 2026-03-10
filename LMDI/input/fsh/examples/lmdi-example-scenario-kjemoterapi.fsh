// Scenario C: Kjemoterapi med lokal katalog og extensions
// Demonstrerer: Lokal legemiddelkatalog, alle MedicationRequest-extensions, virkestoff, infusjon

Instance: Scenario-C-Pasient
InstanceOf: Pasient
Usage: #example
Description: "Scenario C - Kreftpasient"
* identifier[FNR].system = "urn:oid:2.16.578.1.12.4.1.4.1"
* identifier[FNR].value = "15076500565"
* gender = #male
* birthDate = "1965-07-15"
* address.district = "Trondheim"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#5001 "Trondheim"

Instance: Scenario-C-Organisasjon
InstanceOf: Organisasjon
Usage: #example
Description: "Scenario C - Onkologisk avdeling"
* identifier[RSH].system = "urn:oid:2.16.578.1.12.4.1.4.102"
* identifier[RSH].value = "4201050"
* name = "Onkologisk avdeling, St. Olavs hospital"
* address.type = #physical
* address.district = "Trondheim"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#5001 "Trondheim"

Instance: Scenario-C-Helsepersonell
InstanceOf: Helsepersonell
Usage: #example
Description: "Scenario C - Onkolog"
* identifier[HPR].system = "urn:oid:2.16.578.1.12.4.1.4.4"
* identifier[HPR].value = "8877665"

Instance: Scenario-C-Episode
InstanceOf: Episode
Usage: #example
Description: "Scenario C - Kjemoterapibehandling"
* status = #in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP "inpatient encounter"
* serviceProvider = Reference(Scenario-C-Organisasjon)
* extension[nprEpisodeIdentifier].extension[stringIdentifier].valueString = "NPR-STOL-2025-789"

Instance: Scenario-C-Virkestoff
InstanceOf: Virkestoff
Usage: #example
Description: "Scenario C - Oksaliplatin virkestoff"
* code.coding.system = "http://snomed.info/sct"
* code.coding.code = #395814003
* code.coding.display = "Oxaliplatin (substance)"
* category.coding.system = "http://terminology.hl7.org/CodeSystem/substance-category"
* category.coding.code = #drug
* category.coding.display = "Drug or Medicament"

Instance: Scenario-C-Medisin
InstanceOf: Legemiddel
Usage: #example
Description: "Scenario C - Oksaliplatin fra lokal legemiddelkatalog"
* code.coding[LokaltLegemiddel].system = "http://fh.no/fhir/NamingSystem/lokaltVirkemiddel"
* code.coding[LokaltLegemiddel].code = #OXA-85-INF
* code.coding[LokaltLegemiddel].display = "Oksaliplatin 85 mg/m2 infusjonsvæske"
* form.coding[7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448"
* form.coding[7448].code = #9
* form.coding[7448].display = "Infusjonsvæske, oppløsning"
* ingredient.itemReference = Reference(Scenario-C-Virkestoff)
* ingredient.isActive = true

Instance: Scenario-C-Rekvirering
InstanceOf: Legemiddelrekvirering
Usage: #example
Description: "Scenario C - FOLFOX6 kjemoterapirekvirering med alle extensions"
* status = #active
* intent = #order
* medicationReference = Reference(Scenario-C-Medisin)
* subject = Reference(Scenario-C-Pasient)
* requester = Reference(Scenario-C-Helsepersonell)
* encounter = Reference(Scenario-C-Episode)
* authoredOn = "2025-03-10"
* extension[prosentvisDoseendring].valueQuantity.value = 80
* extension[prosentvisDoseendring].valueQuantity.system = "http://unitsofmeasure.org"
* extension[prosentvisDoseendring].valueQuantity.code = #%
* extension[prosentvisDoseendring].valueQuantity.unit = "%"
* extension[delAvBehandlingsregime].valueString = "FOLFOX6"
* extension[kliniskStudie].valueBoolean = true

Instance: Scenario-C-Administrering
InstanceOf: Legemiddeladministrering
Usage: #example
Description: "Scenario C - Infusjon av Oksaliplatin"
* status = #completed
* medicationReference = Reference(Scenario-C-Medisin)
* subject = Reference(Scenario-C-Pasient)
* context = Reference(Scenario-C-Episode)
* request = Reference(Scenario-C-Rekvirering)
* effectivePeriod.start = "2025-03-10T09:00:00+01:00"
* effectivePeriod.end = "2025-03-10T11:00:00+01:00"
* dosage.dose.value = 170
* dosage.dose.unit = "mg"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code = #47625008
* dosage.route.coding[SCT].display = "Intravenous route (qualifier value)"
* dosage.rateRatio.numerator.value = 250
* dosage.rateRatio.numerator.system = "http://unitsofmeasure.org"
* dosage.rateRatio.numerator.code = #ml
* dosage.rateRatio.denominator.value = 120
* dosage.rateRatio.denominator.system = "http://unitsofmeasure.org"
* dosage.rateRatio.denominator.code = #min

Instance: Scenario-C-Bundle
InstanceOf: LegemiddelregisterBundle
Usage: #example
Title: "Scenario C - Kjemoterapi Bundle"
Description: "Komplett Bundle med kjemoterapibehandling, lokal legemiddelkatalog og alle extensions"
* identifier.system = "urn:oid:2.16.578.1.34.10.3"
* identifier.value = "scenario-c-bundle-001"
* timestamp = "2025-03-10T12:00:00+01:00"
* type = #transaction

* entry[0].resource = Scenario-C-Pasient
* entry[0].request.method = #POST
* entry[0].request.url = "Patient"

* entry[1].resource = Scenario-C-Helsepersonell
* entry[1].request.method = #POST
* entry[1].request.url = "Practitioner"

* entry[2].resource = Scenario-C-Organisasjon
* entry[2].request.method = #POST
* entry[2].request.url = "Organization"

* entry[3].resource = Scenario-C-Episode
* entry[3].request.method = #POST
* entry[3].request.url = "Encounter"

* entry[4].resource = Scenario-C-Medisin
* entry[4].request.method = #POST
* entry[4].request.url = "Medication"

* entry[5].resource = Scenario-C-Rekvirering
* entry[5].request.method = #POST
* entry[5].request.url = "MedicationRequest"

* entry[6].resource = Scenario-C-Administrering
* entry[6].request.method = #POST
* entry[6].request.url = "MedicationAdministration"
