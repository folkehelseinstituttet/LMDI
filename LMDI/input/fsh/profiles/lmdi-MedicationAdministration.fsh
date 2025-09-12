Profile: Legemiddeladministrering
Parent: MedicationAdministration
Id: lmdi-medicationadministration
Title: "Legemiddeladministrering"
Description: """Beskriver administrering av legemiddel til pasient på institusjon.

Dette er kjerneressursen for denne implementasjonsguiden. Den peker videre legemiddelet som ble gitt, pasienten som har fått administrert legemiddel, på hvilken institusjon det skjedde, tidspunkt for administrering, hvem som utførte den (helsepersonell eller rolle ved institusjon) og dose med eventuell administrasjonsvei."""

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
* request ^short = "Referanse til rekivreringen"
* request ^definition = "Referanse til rekivreringen som denne administreringen er basert på."

* reasonReference only Reference(Diagnose)
* reasonReference ^short = "Indikasjon (diagnose) for legemiddeladministreringen"

// Dosage Information
* dosage.route MS
* dosage.route ^short = "Administrasjonsvei"
* dosage.route ^definition = "Administrasjonsvei. Er begrenset til foreslått koding fra SNOMED CT-verdisettet til HL7 og Volven-kodeverket Administrasjonsvei (OID=7477) fra eResept."
* dosage.route ^comment = "TODO #22 Diskuter om det bør være 0..1 hvis man ikke har registret administrasjonsvei."

* dosage.route.coding ^slicing.discriminator.type = #pattern
* dosage.route.coding ^slicing.discriminator.path = "system"
* dosage.route.coding ^slicing.rules = #closed
* dosage.route.coding contains SCT 0..1 and 7477 0..1

* dosage.route.coding[SCT] ^short = "SNOMED CT"
* dosage.route.coding[SCT] ^definition = "Administrasjonsvei kodet med SNOMED CT, hentet fra verdisett foreslått av HL7."
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code from http://hl7.org/fhir/ValueSet/route-codes (required)

* dosage.route.coding[7477] ^short = "Administrasjonsvei (OID=7477)"
* dosage.route.coding[7477] ^definition = "Administrasjonsvei (OID=7477) fra kodeverkssamling Resept."
* dosage.route.coding[7477].system = "urn:oid:2.16.578.1.12.4.1.1.7477"
* dosage.route.coding[7477].code ^short = "Verdi fra kodeverket"
* dosage.route.coding[7477].display ^short = "Beskrivelse av koden (navn) fra kodeverket"

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
Expression: "$this.matches('^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}.*$')"

// =========================================
// ValueSet Definition
// =========================================
ValueSet: LegemiddeladministreringStatus
Id: lmdi-medicationadministrationstatus
Title: "Status for legemiddeladministrering"
Description: "Verdisett som begrenses status til Legemiddeladministrering til henholdsvis 'Gjennomført' eller 'Feilregistrert'."
* ^version = "1.0.6"
* ^status = #draft
* ^date = "2025-09-12"
* ^publisher = "Folkehelseinstituttet"
* http://hl7.org/fhir/ValueSet/medication-admin-status#completed "Gjennomført"
* http://hl7.org/fhir/ValueSet/medication-admin-status#entered-in-error "Feilregistrert"

// =========================================
// Examples
// =========================================
Instance: Administrering-1-Oralt
InstanceOf: Legemiddeladministrering
Description: "Eksempel på administrering av legemiddel"
* status = #completed
* medicationReference = Reference(https://fhir.legemidler.example.com/legemidler/123456780)
* subject = Reference(https://fhi.no/fhir/lmdi/pasient/12345678)
* context = Reference(https://fhi.no/fhir/lmdi/episode/428ff23d-7a65-4c67-8059-6a1d07d287e3)
* effectiveDateTime = "2024-05-28"
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code = #421521009
* dosage.route.coding[SCT].display = "Swallow"
* dosage.dose.value = 2.0
* dosage.dose.unit = "metric tablespoon"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #tsp_us

Instance: Administrering-2-Infusjon
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
* dosage.rateRatio.numerator.code = #ml
* dosage.rateRatio.denominator.value = 1
* dosage.rateRatio.denominator.system = "http://unitsofmeasure.org"
* dosage.rateRatio.denominator.code = #min