Profile: Legemiddeladministrering
Parent: MedicationAdministration
Id: lmdi-medicationadministration
Title: "Legemiddeladministrering"
Description: """Beskriver administrering av legemiddel til pasient på institusjon.

Dette er kjerneressursen for denne implementasjonsguiden. Den peker videre til legemiddelet som ble gitt, pasienten som har fått administrert legemiddel, på hvilken institusjon det skjedde, tidspunkt for administrering og dose med eventuell administrasjonsvei."""

* ^status = #draft
* ^date = "2025-09-12"
* ^publisher = "Folkehelseinstituttet"
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Medication Administration"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = """Describes medication administration to a patient in an institution.

This is the core resource for this implementation guide. It links to the medication that was given, the patient who received the medication, the institution where it happened, the administration time, and the dose with any route of administration."""

// Core Elements
* subject only Reference(Pasient)
* subject ^short = "Hvem fikk legemidlet (pasient)"
* subject ^definition = "Det skal alltid være en referanse til pasienten som har blitt administrert legemiddel."
* subject ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* subject ^short.extension[=].extension[+].url = "lang"
* subject ^short.extension[=].extension[=].valueCode = #en
* subject ^short.extension[=].extension[+].url = "content"
* subject ^short.extension[=].extension[=].valueString = "Who received the medication (patient)"
* subject ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* subject ^definition.extension[=].extension[+].url = "lang"
* subject ^definition.extension[=].extension[=].valueCode = #en
* subject ^definition.extension[=].extension[+].url = "content"
* subject ^definition.extension[=].extension[=].valueString = "There shall always be a reference to the patient who received the medication."

* medication[x] only Reference(Legemiddel)
* medication[x] ^short = "Legemiddel"
* medication[x] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* medication[x] ^short.extension[=].extension[+].url = "lang"
* medication[x] ^short.extension[=].extension[=].valueCode = #en
* medication[x] ^short.extension[=].extension[+].url = "content"
* medication[x] ^short.extension[=].extension[=].valueString = "Medication"

* status from LegemiddeladministreringStatus
* status ^short = "Status administrering (completed | entered-in-error)"
* status ^definition = "Status administrering. Skal vanligvis settes til 'Gjennomført' (completed), men 'Feilregistrert' (entered-in-error) MÅ benyttes hvis registreringen inneholder en alvorlig feil og skal slettes."
* status ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* status ^short.extension[=].extension[+].url = "lang"
* status ^short.extension[=].extension[=].valueCode = #en
* status ^short.extension[=].extension[+].url = "content"
* status ^short.extension[=].extension[=].valueString = "Administration status (completed | entered-in-error)"
* status ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* status ^definition.extension[=].extension[+].url = "lang"
* status ^definition.extension[=].extension[=].valueCode = #en
* status ^definition.extension[=].extension[+].url = "content"
* status ^definition.extension[=].extension[=].valueString = "Administration status. It should usually be set to 'completed', but 'entered-in-error' MUST be used if the record contains a serious error and shall be deleted."

// Timing Elements
* effective[x] ^short = "Tidspunktet eller periode legemidlet ble administrert"
* effective[x] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* effective[x] ^short.extension[=].extension[+].url = "lang"
* effective[x] ^short.extension[=].extension[=].valueCode = #en
* effective[x] ^short.extension[=].extension[+].url = "content"
* effective[x] ^short.extension[=].extension[=].valueString = "The time or period when the medication was administered"
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
* context ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* context ^short.extension[=].extension[+].url = "lang"
* context ^short.extension[=].extension[=].valueCode = #en
* context ^short.extension[=].extension[+].url = "content"
* context ^short.extension[=].extension[=].valueString = "The episode (for example the consultation or admission) associated with the medication administration."
* context ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* context ^definition.extension[=].extension[+].url = "lang"
* context ^definition.extension[=].extension[=].valueCode = #en
* context ^definition.extension[=].extension[+].url = "content"
* context ^definition.extension[=].extension[=].valueString = "Reference to which institutional stay or appointment the patient was in when the medication was administered."

* category from http://hl7.org/fhir/ValueSet/medication-admin-category (preferred)
* category ^short = "Kategori (inneliggende | poliklinisk | selvadministrert | utskrivelse)"
* category ^definition = "Kategoriserer administreringskonteksten. Bruk 'community' for selvadministrering — pasienten tar legemidlet selv, men det er utdelt av institusjonen."
* category ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* category ^short.extension[=].extension[+].url = "lang"
* category ^short.extension[=].extension[=].valueCode = #en
* category ^short.extension[=].extension[+].url = "content"
* category ^short.extension[=].extension[=].valueString = "Category (inpatient | outpatient | self-administered | discharge)"
* category ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* category ^definition.extension[=].extension[+].url = "lang"
* category ^definition.extension[=].extension[=].valueCode = #en
* category ^definition.extension[=].extension[+].url = "content"
* category ^definition.extension[=].extension[=].valueString = "Categorizes the administration context. Use 'community' for self-administration - the patient takes the medication themselves, but it is dispensed by the institution."

* reasonCode ^short = "Årsak til utført administrering (Given as Ordered, Emergency, None)"
* reasonCode ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* reasonCode ^short.extension[=].extension[+].url = "lang"
* reasonCode ^short.extension[=].extension[=].valueCode = #en
* reasonCode ^short.extension[=].extension[+].url = "content"
* reasonCode ^short.extension[=].extension[=].valueString = "Reason for the administration (Given as Ordered, Emergency, None)"

* request MS
* request only Reference(Legemiddelrekvirering)
* request ^short = "Referanse til rekvireringen"
* request ^definition = "Referanse til rekvireringen som denne administreringen er basert på."
* request ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* request ^short.extension[=].extension[+].url = "lang"
* request ^short.extension[=].extension[=].valueCode = #en
* request ^short.extension[=].extension[+].url = "content"
* request ^short.extension[=].extension[=].valueString = "Reference to the request"
* request ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* request ^definition.extension[=].extension[+].url = "lang"
* request ^definition.extension[=].extension[=].valueCode = #en
* request ^definition.extension[=].extension[+].url = "content"
* request ^definition.extension[=].extension[=].valueString = "Reference to the request on which this administration is based."

* reasonReference only Reference(Diagnose)
* reasonReference ^short = "Indikasjon (diagnose) for legemiddeladministreringen"
* reasonReference ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* reasonReference ^short.extension[=].extension[+].url = "lang"
* reasonReference ^short.extension[=].extension[=].valueCode = #en
* reasonReference ^short.extension[=].extension[+].url = "content"
* reasonReference ^short.extension[=].extension[=].valueString = "Indication (diagnosis) for the medication administration"

// Dosage Information
* dosage.route MS
* dosage.route ^short = "Administrasjonsvei"
* dosage.route ^definition = "Administrasjonsvei. Er begrenset til foreslått koding fra SNOMED CT-verdisettet til HL7 og Volven-kodeverket Administrasjonsvei (OID=7477) fra eResept."
* dosage.route ^comment = "Administrasjonsvei benyttes for å angi hvordan legemiddelet ble gitt."
* dosage.route ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* dosage.route ^short.extension[=].extension[+].url = "lang"
* dosage.route ^short.extension[=].extension[=].valueCode = #en
* dosage.route ^short.extension[=].extension[+].url = "content"
* dosage.route ^short.extension[=].extension[=].valueString = "Route of administration"
* dosage.route ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* dosage.route ^definition.extension[=].extension[+].url = "lang"
* dosage.route ^definition.extension[=].extension[=].valueCode = #en
* dosage.route ^definition.extension[=].extension[+].url = "content"
* dosage.route ^definition.extension[=].extension[=].valueString = "Route of administration. Restricted to the proposed coding from HL7's SNOMED CT value set and the ePrescription code system Route of Administration (OID=7477)."
* dosage.route ^comment.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* dosage.route ^comment.extension[=].extension[+].url = "lang"
* dosage.route ^comment.extension[=].extension[=].valueCode = #en
* dosage.route ^comment.extension[=].extension[+].url = "content"
* dosage.route ^comment.extension[=].extension[=].valueString = "Route of administration is used to indicate how the medication was given."

* dosage.route.coding ^slicing.discriminator.type = #pattern
* dosage.route.coding ^slicing.discriminator.path = "system"
* dosage.route.coding ^slicing.rules = #closed
* dosage.route.coding 1..*
* dosage.route.coding contains SCT 0..1 and OID7477 0..1

* dosage.route.coding[SCT] ^short = "SNOMED CT"
* dosage.route.coding[SCT] ^definition = "Administrasjonsvei kodet med SNOMED CT, hentet fra verdisett foreslått av HL7."
* dosage.route.coding[SCT] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* dosage.route.coding[SCT] ^short.extension[=].extension[+].url = "lang"
* dosage.route.coding[SCT] ^short.extension[=].extension[=].valueCode = #en
* dosage.route.coding[SCT] ^short.extension[=].extension[+].url = "content"
* dosage.route.coding[SCT] ^short.extension[=].extension[=].valueString = "SNOMED CT"
* dosage.route.coding[SCT] ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* dosage.route.coding[SCT] ^definition.extension[=].extension[+].url = "lang"
* dosage.route.coding[SCT] ^definition.extension[=].extension[=].valueCode = #en
* dosage.route.coding[SCT] ^definition.extension[=].extension[+].url = "content"
* dosage.route.coding[SCT] ^definition.extension[=].extension[=].valueString = "Route of administration coded with SNOMED CT, taken from the HL7-proposed value set."
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code 1..1
* dosage.route.coding[SCT].code from http://hl7.org/fhir/ValueSet/route-codes (required)

* dosage.route.coding[OID7477] ^short = "Administrasjonsvei (OID=7477)"
* dosage.route.coding[OID7477] ^definition = "Administrasjonsvei (OID=7477) fra kodeverkssamling Resept."
* dosage.route.coding[OID7477] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* dosage.route.coding[OID7477] ^short.extension[=].extension[+].url = "lang"
* dosage.route.coding[OID7477] ^short.extension[=].extension[=].valueCode = #en
* dosage.route.coding[OID7477] ^short.extension[=].extension[+].url = "content"
* dosage.route.coding[OID7477] ^short.extension[=].extension[=].valueString = "Route of administration (OID=7477)"
* dosage.route.coding[OID7477] ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* dosage.route.coding[OID7477] ^definition.extension[=].extension[+].url = "lang"
* dosage.route.coding[OID7477] ^definition.extension[=].extension[=].valueCode = #en
* dosage.route.coding[OID7477] ^definition.extension[=].extension[+].url = "content"
* dosage.route.coding[OID7477] ^definition.extension[=].extension[=].valueString = "Route of administration (OID=7477) from the prescription code system collection."
* dosage.route.coding[OID7477].system = "urn:oid:2.16.578.1.12.4.1.1.7477"
* dosage.route.coding[OID7477].code 1..1
* dosage.route.coding[OID7477].code ^short = "Verdi fra kodeverket"
* dosage.route.coding[OID7477].display ^short = "Beskrivelse av koden (navn) fra kodeverket"
* dosage.route.coding[OID7477].code ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* dosage.route.coding[OID7477].code ^short.extension[=].extension[+].url = "lang"
* dosage.route.coding[OID7477].code ^short.extension[=].extension[=].valueCode = #en
* dosage.route.coding[OID7477].code ^short.extension[=].extension[+].url = "content"
* dosage.route.coding[OID7477].code ^short.extension[=].extension[=].valueString = "Value from the code system"
* dosage.route.coding[OID7477].display ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* dosage.route.coding[OID7477].display ^short.extension[=].extension[+].url = "lang"
* dosage.route.coding[OID7477].display ^short.extension[=].extension[=].valueCode = #en
* dosage.route.coding[OID7477].display ^short.extension[=].extension[+].url = "content"
* dosage.route.coding[OID7477].display ^short.extension[=].extension[=].valueString = "Description of the code (name) from the code system"

* dosage.dose 1..1
* dosage.dose ^short = "Administrert mengde virkestoff"
* dosage.dose ^definition = "Mengde (dosering) av legemiddelets primære virkestoff."
* dosage.dose ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* dosage.dose ^short.extension[=].extension[+].url = "lang"
* dosage.dose ^short.extension[=].extension[=].valueCode = #en
* dosage.dose ^short.extension[=].extension[+].url = "content"
* dosage.dose ^short.extension[=].extension[=].valueString = "Administered amount of substance"
* dosage.dose ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* dosage.dose ^definition.extension[=].extension[+].url = "lang"
* dosage.dose ^definition.extension[=].extension[=].valueCode = #en
* dosage.dose ^definition.extension[=].extension[+].url = "content"
* dosage.dose ^definition.extension[=].extension[=].valueString = "Amount (dosage) of the medication's primary substance."

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
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Medication administration status"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "Value set that restricts the status of medication administration to 'completed' or 'entered-in-error'."
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
* medicationReference = Reference(Legemiddel-LokaltLegemiddel-FlereIngredienser)
* subject = Reference(Pasient-Med-FNR)
* context = Reference(Episode-Sykehus)
* request = Reference(Rekvirering-Infusjon)
* effectivePeriod.start = "2024-06-13T14:26:01+02:00"
* effectivePeriod.end = "2024-06-13T14:48:47+02:00"
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code = #47625008
* dosage.route.coding[SCT].display = "intravenøs administrasjonsvei"
* dosage.dose.value = 80
* dosage.dose.unit = "milliliter"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mL
* dosage.rateRatio.numerator.value = 3.6
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

Instance: Administrering-MedDiagnoseICD10
InstanceOf: Legemiddeladministrering
Description: "Eksempel på administrering av legemiddel med ICD-10-diagnose som indikasjon"
* status = #completed
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

Instance: Administrering-Selvadministrert
InstanceOf: Legemiddeladministrering
Description: "Eksempel på selvadministrering — pasienten tar legemidlet selv etter utdeling fra institusjon"
* status = #completed
* category = http://terminology.hl7.org/CodeSystem/medication-admin-category#community "Community"
* medicationReference = Reference(Legemiddel-Varenummer)
* subject = Reference(Pasient-Med-FNR)
* context = Reference(Episode-Sykehus)
* effectiveDateTime = "2025-08-14T10:00:00+02:00"
* dosage.route.coding[OID7477].system = "urn:oid:2.16.578.1.12.4.1.1.7477"
* dosage.route.coding[OID7477].code = #53
* dosage.route.coding[OID7477].display = "Oral bruk"
* dosage.dose.value = 10
* dosage.dose.unit = "milligram"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg

Instance: Administrering-Cellegift
InstanceOf: Legemiddeladministrering
Description: "Eksempel på administrering av cellegift (Cisplatin) basert på rekvirering med prosentvis doseendring"
* identifier.value = "15634555315"
* status = #completed
* medicationReference = Reference(Lokalt-legemiddel-cellegift)
* subject = Reference(Pasient-Med-FNR)
* context = Reference(Episode-Sykehus-2)
* effectivePeriod.start = "2026-04-01T12:12:00+02:00"
* effectivePeriod.end = "2026-04-01T13:45:00+02:00"
* request = Reference(Rekvirering-Cellegift)
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code = #47625008
* dosage.route.coding[SCT].display = "intravenøs administrasjonsvei"
* dosage.dose.value = 1000
* dosage.dose.unit = "milligram"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg
* dosage.rateRatio.numerator.value = 10
* dosage.rateRatio.numerator.system = "http://unitsofmeasure.org"
* dosage.rateRatio.numerator.code = #mg
* dosage.rateRatio.denominator.value = 1
* dosage.rateRatio.denominator.system = "http://unitsofmeasure.org"
* dosage.rateRatio.denominator.code = #min
