Profile: LegemiddelregisterBundle
Parent: Bundle
Id: lmdi-bundle
Title: "LegemiddelregisterBundle"
Description: "Profil av Bundle for Legemiddelregisteret. Støtter bare transaction-type og POST-operasjoner, med begrensninger på tillatte ressurstyper."

// Påkrevde felter
* identifier 1..1 MS
* timestamp 1..1 MS
* type 1..1 MS
* type = #transaction (exactly)
* type ^short = "Må være av type transaction"
* type ^definition = "Angir at bundle må være av type transaction"

// Deaktiverte elementer
* total 0..0
* link 0..0

// Entry-elementer
* entry 1..* MS
* entry ^short = "Innholdselementer i bundle"
* entry ^definition = "Inneholder ressursene som skal sendes inn til registeret"

* entry.request 1..1 MS
* entry.request.method 1..1 MS
* entry.request.method = #POST (exactly)
* entry.request.method ^short = "Må være POST"
* entry.request.method ^definition = "Angir at alle forespørsler i bundle må være av type POST"

* entry.request.url 1..1
* entry.request.url ^short = "URL for requesten (påkrevd, men verdien har ingen betydning)"
* entry.request.url ^definition = "Representerer adressen for requesten. URL er påkrevd av FHIR-spesifikasjonen for transaction bundles, men selve verdien har ingen funksjonell betydning i dette tilfellet."

* entry.resource 1..1 MS

// Invariant for tillatte ressurstyper
* obeys lr-allowed-resources

Invariant: lr-allowed-resources
Description: "Bundle kan bare inneholde følgende profilerte ressurstyper: Diagnose, Helsepersonell, Episode, Legemiddel, LegemiddelAdministrasjon, Legemiddelrekvirering, Organisasjon, Pasient, Virkestoff"
Severity: #error
Expression: "entry.all(
  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition').exists() or
  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-practitioner').exists() or
  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter').exists() or
  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication').exists() or
  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration').exists() or
  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest').exists() or
  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization').exists() or
  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient').exists() or
  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-substance').exists()
)"

// BUNDLE-LOKALE EKSEMPELRESSURSER
Instance: Scenario-Sykehjem-Oksykodon-Pasient
InstanceOf: Pasient
Usage: #inline
Description: "Pasient med fødselsnummer"
* identifier[FNR].system = "urn:oid:2.16.578.1.12.4.1.4.1"
* identifier[FNR].value = "12705825562"
* gender = #male
* birthDate = "1958-05-12"
* address.use = #home
* address.type = #physical
* address.district = "Oslo"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#0301 "Oslo"
* address.extension[urbanDistrict].valueCoding = $VsLmdiUrbanDistrict#030102 "Grünerløkka"

Instance: Scenario-Sykehjem-Oksykodon-Helsepersonell
InstanceOf: Helsepersonell
Usage: #inline
Description: "Helsepersonell med HPR-nummer"
* identifier[HPR].system = "urn:oid:2.16.578.1.12.4.1.4.4"
* identifier[HPR].value = "9144900"

Instance: Scenario-Sykehjem-Oksykodon-Kommune
InstanceOf: Organisasjon
Usage: #inline
Description: "Kommune i primærhelsetjenesten"
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "942110464"
* name = "TRONDHEIM KOMMUNE"
* address.type = #physical
* address.district = "Trondheim"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#5001 "Trondheim - Tråante"

Instance: Scenario-Sykehjem-Oksykodon-Sykehjem
InstanceOf: Organisasjon
Usage: #inline
Description: "Ssykehjem i primærhelsetjenesten"
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "985626154"
* name = "BYNESET OG NYPANTUNET HELSE- OG VELFERDSSENTER SYKEHJEM"
* partOf.reference = "urn:uuid:33333333-3333-4333-8333-333333333333"
* address.type = #physical
* address.district = "Trondheim"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#5001 "Trondheim - Tråante"

Instance: Scenario-Sykehjem-Oksykodon-Episode
InstanceOf: Episode
Usage: #inline
Description: "Episode på sykehjem"
* status = #in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#SS "short stay"
* serviceProvider.reference = "urn:uuid:44444444-4444-4444-8444-444444444444"

Instance: Scenario-Sykehjem-Oksykodon-Legemiddel
InstanceOf: Legemiddel
Usage: #inline
Description: "Oksykodon på virkestoffnivå"
* identifier.system = "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff"
* identifier.value = "C31AF94A-5D5A-4C91-9B99-BB221E26E4C9"
* extension[classification].valueCodeableConcept = $ATC#N02AA05 "Oksykodon"
* code.coding[FestLegemiddelVirkestoff].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff"
* code.coding[FestLegemiddelVirkestoff].code = #C31AF94A-5D5A-4C91-9B99-BB221E26E4C9
* code.coding[FestLegemiddelVirkestoff].display = "Oksykodon"
* form.coding[OID7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448"
* form.coding[OID7448].code = #51
* form.coding[OID7448].display = "Mikstur, oppløsning"

Instance: Scenario-Sykehjem-Oksykodon-Rekvirering
InstanceOf: Legemiddelrekvirering
Usage: #inline
Description: "Rekvirering med interne referanser"
* status = #active
* intent = #order
* medicationReference.reference = "urn:uuid:66666666-6666-4666-8666-666666666666"
* subject.reference = "urn:uuid:11111111-1111-4111-8111-111111111111"
* requester.reference = "urn:uuid:22222222-2222-4222-8222-222222222222"
* encounter.reference = "urn:uuid:55555555-5555-4555-8555-555555555555"
* authoredOn = "2025-03-10"
* extension[prosentvisDoseendring].valueQuantity.value = 80
* extension[prosentvisDoseendring].valueQuantity.system = "http://unitsofmeasure.org"
* extension[prosentvisDoseendring].valueQuantity.code = #%
* extension[prosentvisDoseendring].valueQuantity.unit = "%"
* extension[delAvBehandlingsregime].valueString = "FOLFOX6"
* extension[kliniskStudie].valueBoolean = true

Instance: Scenario-Sykehjem-Oksykodon-Administrering
InstanceOf: Legemiddeladministrering
Usage: #inline
Description: "Administrering med interne referanser"
* status = #completed
* medicationReference.reference = "urn:uuid:66666666-6666-4666-8666-666666666666"
* subject.reference = "urn:uuid:11111111-1111-4111-8111-111111111111"
* context.reference = "urn:uuid:55555555-5555-4555-8555-555555555555"
* request.reference = "urn:uuid:77777777-7777-4777-8777-777777777777"
* effectiveDateTime = "2024-05-28T09:30:00+02:00"
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code = #421521009
* dosage.route.coding[SCT].display = "Swallow"
* dosage.dose.value = 10.0
* dosage.dose.unit = "mg"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg

// EKSEMPEL
Instance: Bundle-Scenario-Sykehjem-Oksykodon
InstanceOf: LegemiddelregisterBundle
Usage: #example
Title: "Oksykodonadministrering i sykehjem med inline ressurskopier"
Description: "Eksempel på transaction-bundle der medlemsressursene er lokale bundle-instanser merket som inline."

* identifier.system = "urn:oid:2.16.578.1.34.10.3"
* identifier.value = "bundle-001"
* timestamp = "2024-02-07T13:28:17.239+02:00"
* type = #transaction

// Ressurser i bundle
* entry[0].fullUrl = "urn:uuid:11111111-1111-4111-8111-111111111111"
* entry[0].resource = Scenario-Sykehjem-Oksykodon-Pasient
* entry[0].request.method = #POST
* entry[0].request.url = "Patient"

* entry[1].fullUrl = "urn:uuid:22222222-2222-4222-8222-222222222222"
* entry[1].resource = Scenario-Sykehjem-Oksykodon-Helsepersonell
* entry[1].request.method = #POST
* entry[1].request.url = "Practitioner"

* entry[2].fullUrl = "urn:uuid:33333333-3333-4333-8333-333333333333"
* entry[2].resource = Scenario-Sykehjem-Oksykodon-Kommune
* entry[2].request.method = #POST
* entry[2].request.url = "Organization"

* entry[3].fullUrl = "urn:uuid:44444444-4444-4444-8444-444444444444"
* entry[3].resource = Scenario-Sykehjem-Oksykodon-Sykehjem
* entry[3].request.method = #POST
* entry[3].request.url = "Organization"

* entry[4].fullUrl = "urn:uuid:55555555-5555-4555-8555-555555555555"
* entry[4].resource = Scenario-Sykehjem-Oksykodon-Episode
* entry[4].request.method = #POST
* entry[4].request.url = "Encounter"

* entry[5].fullUrl = "urn:uuid:66666666-6666-4666-8666-666666666666"
* entry[5].resource = Scenario-Sykehjem-Oksykodon-Legemiddel
* entry[5].request.method = #POST
* entry[5].request.url = "Medication"

* entry[6].fullUrl = "urn:uuid:77777777-7777-4777-8777-777777777777"
* entry[6].resource = Scenario-Sykehjem-Oksykodon-Rekvirering
* entry[6].request.method = #POST
* entry[6].request.url = "MedicationRequest"

* entry[7].fullUrl = "urn:uuid:88888888-8888-4888-8888-888888888888"
* entry[7].resource = Scenario-Sykehjem-Oksykodon-Administrering
* entry[7].request.method = #POST
* entry[7].request.url = "MedicationAdministration"
