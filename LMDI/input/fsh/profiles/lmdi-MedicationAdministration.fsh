Profile: Legemiddeladministrering
Parent: MedicationAdministration
Id: lmdi-medicationadministration
Title: "Legemiddeladministrering"
Description: """Beskriver administrering av legemiddel til pasient på institusjon.

Dette er kjerneressursen for denne implementasjonsguiden. Den peker videre til legemiddelet som ble gitt, pasienten som har fått administrert legemiddel, på hvilken institusjon det skjedde, tidspunkt for administrering og dose med eventuell administrasjonsvei."""

* ^status = #draft
* ^date = "2025-09-12"
* ^publisher = "Folkehelseinstituttet"

// Core Elements
* subject only Reference(Pasient)
* subject ^short = "Hvem fikk legemidlet (pasient)"
* subject ^definition = "Det skal alltid være en referanse til pasienten som har blitt administrert legemiddel."

* medication[x] only Reference(Legemiddel)
* medication[x] ^short = "Legemiddel"

* status from LegemiddeladministreringStatus
* status ^short = "Status administrering (completed | entered-in-error)"
* status ^definition = "Status administrering. Skal vanligvis settes til 'Gjennomført' (completed), men 'Feilregistrert' (entered-in-error) MÅ benyttes hvis registreringen inneholder en alvorlig feil og skal slettes."

// Timing Elements
* effective[x] ^short = "Tidspunktet eller periode legemidlet ble administrert"
* effective[x] only Period or dateTime
* effective[x] 1..1
* effectiveDateTime obeys time-required
* effectivePeriod.start 1..1
* effectivePeriod.end 1..1
* effectivePeriod.start obeys time-required
* effectivePeriod.end obeys time-required

// Context and References
* context MS
* context only Reference(Episode)
* context ^short = "Episoden (f.eks. konsultasjonen/innleggelsen) som legemidlet ble administrert i forbindelse med."
* context ^definition = "Referanse til hvilket institusjonsopphold eller avtale pasienten var på da legemiddelet ble administrert."

* reasonCode ^short = "Årsak til utført administrering (Given as Ordered, Emergency, None)"

* request MS
* request only Reference(Legemiddelrekvirering)
* request ^short = "Referanse til rekvireringen"
* request ^definition = "Referanse til rekvireringen som denne administreringen er basert på."

* reasonReference only Reference(Diagnose)
* reasonReference ^short = "Indikasjon (diagnose) for legemiddeladministreringen"

// Dosage Information
* dosage.route MS
* dosage.route ^short = "Administrasjonsvei"
* dosage.route ^definition = "Administrasjonsvei. Er begrenset til foreslått koding fra SNOMED CT-verdisettet til HL7 og Volven-kodeverket Administrasjonsvei (OID=7477) fra eResept."
* dosage.route ^comment = "Administrasjonsvei benyttes for å angi hvordan legemiddelet ble gitt."

* dosage.route.coding ^slicing.discriminator.type = #pattern
* dosage.route.coding ^slicing.discriminator.path = "system"
* dosage.route.coding ^slicing.rules = #closed
* dosage.route.coding 1..*
* dosage.route.coding contains SCT 0..1 and OID7477 0..1

* dosage.route.coding[SCT] ^short = "SNOMED CT"
* dosage.route.coding[SCT] ^definition = "Administrasjonsvei kodet med SNOMED CT, hentet fra verdisett foreslått av HL7."
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code 1..1
* dosage.route.coding[SCT].code from http://hl7.org/fhir/ValueSet/route-codes (required)

* dosage.route.coding[OID7477] ^short = "Administrasjonsvei (OID=7477)"
* dosage.route.coding[OID7477] ^definition = "Administrasjonsvei (OID=7477) fra kodeverkssamling Resept."
* dosage.route.coding[OID7477].system = "urn:oid:2.16.578.1.12.4.1.1.7477"
* dosage.route.coding[OID7477].code 1..1
* dosage.route.coding[OID7477].code ^short = "Verdi fra kodeverket"
* dosage.route.coding[OID7477].display ^short = "Beskrivelse av koden (navn) fra kodeverket"

* dosage.dose 1..1
* dosage.dose ^short = "Administrert mengde virkestoff"
* dosage.dose ^definition = "Mengde (dosering) av legemiddelets primære virkestoff."

* dosage.rateRatio MS

// Disabled Elements
* device 0..0
* note 0..0
* partOf 0..0
* performer 0..0
* supportingInformation 0..0
* text 0..0
* eventHistory 0..0
* dosage.text 0..0
* dosage.route.text 0..0

// =========================================
// Invariant Definition
// =========================================
Invariant: time-required
Description: "Må inneholde tidspunkt for administrering."
Severity: #error
Expression: "$this.toString().matches('^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}.*$')"

// =========================================
// ValueSet Definition
// =========================================
ValueSet: LegemiddeladministreringStatus
Id: lmdi-medicationadministrationstatus
Title: "Status for legemiddeladministrering"
Description: "Verdisett som begrenses status til Legemiddeladministrering til henholdsvis 'Gjennomført' eller 'Feilregistrert'."
* ^status = #draft
* ^date = "2025-09-12"
* ^publisher = "Folkehelseinstituttet"
* http://terminology.hl7.org/CodeSystem/medication-admin-status#completed "Gjennomført"
* http://terminology.hl7.org/CodeSystem/medication-admin-status#entered-in-error "Feilregistrert"

// =========================================
// Examples
// =========================================
Instance: Administrering-Oral
InstanceOf: Legemiddeladministrering
Description: "Eksempel på administrering av legemiddel"
* status = #completed
* medicationReference = Reference(https://fhir.legemidler.example.com/legemidler/123456780)
* subject = Reference(https://fhi.no/fhir/lmdi/pasient/12345678)
* context = Reference(https://fhi.no/fhir/lmdi/episode/428ff23d-7a65-4c67-8059-6a1d07d287e3)
* effectiveDateTime = "2024-05-28T09:30:00+02:00"
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code = #421521009
* dosage.route.coding[SCT].display = "Swallow"
* dosage.dose.value = 10.0
* dosage.dose.unit = "mg"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg

Instance: Administrering-Infusjon
InstanceOf: Legemiddeladministrering
Description: "Eksempel på administrering av legemiddel - infusjon"
* status = #completed
* medicationReference = Reference(https://fhir.legemidler.example.com/legemidler/0987654321)
* subject = Reference(https://fhi.no/fhir/lmdi/pasient/12345678)
* context = Reference(https://fhi.no/fhir/lmdi/institusjonsopphold/428ff23d-7a65-4c67-8059-6a1d07d287e3)
* effectivePeriod.start = "2024-06-13T14:26:01+02:00"
* effectivePeriod.end = "2024-06-13T14:48:47+02:00"
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code = #47625008
* dosage.route.coding[SCT].display = "Intravenous route (qualifier value)"
* dosage.dose.value = 4500
* dosage.dose.unit = "mg"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg
* dosage.rateRatio.numerator.value = 8.0
* dosage.rateRatio.numerator.system = "http://unitsofmeasure.org"
* dosage.rateRatio.numerator.code = #mL
* dosage.rateRatio.denominator.value = 1
* dosage.rateRatio.denominator.system = "http://unitsofmeasure.org"
* dosage.rateRatio.denominator.code = #min

Instance: Administrering-MedDiagnoseSCT
InstanceOf: Legemiddeladministrering
Description: "Eksempel på administrering av legemiddel med SNOMED CT-diagnose som indikasjon"
* status = #completed
* medicationReference = Reference(Legemiddel-Varenummer)
* subject = Reference(Pasient-Med-DNR)
* context = Reference(Episode-Sykehus)
* effectiveDateTime = "2025-07-13T14:48:47+02:00"
* reasonReference = Reference(Diagnose-SNOMED-SCT)
* dosage.route.coding[OID7477].system = "urn:oid:2.16.578.1.12.4.1.1.7477"
* dosage.route.coding[OID7477].code = #53
* dosage.route.coding[OID7477].display = "Oral bruk"
* dosage.dose.value = 750
* dosage.dose.unit = "milligram"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg

Instance: Administrering-EnteredInError
InstanceOf: Legemiddeladministrering
Description: "Eksempel på administrering av legemiddel med status feilregistrert (entered-in-error)"
* status = #entered-in-error
* statusReason.coding.system = "http://snomed.info/sct"
* statusReason.coding.code = #182896008
* statusReason.coding.display = "Drug declined by patient - dislikes taste"
* identifier.value = "71dd991f-2662-4a7e-86b6-c6c85c9580d4"
* medicationReference = Reference(Legemiddel-FestLegemiddelpakning)
* subject = Reference(Pasient-Med-FNR)
* context = Reference(Episode-Sykehus)
* effectiveDateTime = "2025-06-13T14:48:47+02:00"
* reasonReference = Reference(Diagnose-ICD10)
* dosage.route.coding[OID7477].system = "urn:oid:2.16.578.1.12.4.1.1.7477"
* dosage.route.coding[OID7477].code = #53
* dosage.route.coding[OID7477].display = "Oral bruk"
* dosage.dose.value = 50
* dosage.dose.unit = "milligram"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg
