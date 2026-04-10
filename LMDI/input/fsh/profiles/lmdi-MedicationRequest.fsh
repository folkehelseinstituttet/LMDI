Profile: Legemiddelrekvirering
Parent: MedicationRequest
Id: lmdi-medicationrequest
Title: "Legemiddelrekvirering"
Description: "Legemiddelrekvirering - ordinering eller annen rekvirering av legemiddel"

// Metadata
* ^status = #draft
* ^date = "2025-09-12"
* ^publisher = "Folkehelseinstituttet"


// Extensions for Legemiddelrekvirering
* extension contains ProsentvisDoseendring named prosentvisDoseendring 0..1
* extension[prosentvisDoseendring] ^short = "Doseendring i prosent (100% = umodifisert dose)"
* extension[prosentvisDoseendring] ^definition = "Doseendring i prosent, sammenlignet med opprinnelig dosering. Spesielt relevant ved kjemoterapi. En normal dose, uten modifiseringer, er 100%. Kan ha verdier fra 0. Enhet skal være prosent."

* extension contains DelAvBehandlingsregime named delAvBehandlingsregime 0..1
* extension[delAvBehandlingsregime] ^short = "Del av behandlingsregime"
* extension[delAvBehandlingsregime] ^definition = "Navnet på kuren, behandlingsregimet eller protokollen legemidlet gis som en del av. Spesielt relevant ved kjemoterapi."

* extension contains KliniskStudie named kliniskStudie 0..1
* extension[kliniskStudie] ^short = "Legemiddel i klinisk studie"
* extension[kliniskStudie] ^definition = "Angir om legemidlet gis som en del av en klinisk studie."


// Deaktiverte elementer
* text 0..0
* recorder 0..0
* insurance 0..0
* supportingInformation 0..0
* performer 0..0
* performerType 0..0
* basedOn 0..0
* note 0..0
* dispenseRequest 0..0
* detectedIssue 0..0
* eventHistory 0..0
* dosageInstruction.text 0..0
* dosageInstruction.patientInstruction 0..0

// Identifikator
* identifier 0..* MS
* identifier ^short = "Identifikator for rekvirering"
* identifier ^definition = "Must Support: En identifikator som unikt identifiserer en rekvirering må oppgis om en slik finnes"

// Status og intensjon
* status 1..1 MS
* status ^short = "Status for rekvireringen"
* status ^definition = "Must Support: Status er viktig for å kunne følge livssyklusen til en rekvirering og må støttes av alle systemer"
* status from http://hl7.org/fhir/ValueSet/medicationrequest-status
* status ^comment = "Gyldige verdier: active | on-hold | cancelled | completed | entered-in-error | stopped | draft"

* intent 1..1 MS
* intent ^short = "Intensjonen eller hensikten med rekvireringen: proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option"

// Referanser til andre ressurser
* medication[x] only Reference(Legemiddel)
* medication[x] 1..1 MS
* medication[x] ^short = "Legemidlet som er rekvirert"

* subject 1..1 MS
* subject only Reference(Pasient)
* subject ^short = "Pasienten legemidlet er rekvirert til"

* requester 1..1 MS
* requester only Reference(Helsepersonell)
* requester ^short = "Helsepersonellet som rekvirerte legemidlet"

* reasonReference only Reference(Diagnose)
* reasonReference ^short = "Indikasjon (diagnose) for legemiddelrekvireringen"

* priorPrescription only Reference(Legemiddelrekvirering)

* encounter only Reference(Episode)
* encounter ^short = "Episoden (f.eks. konsultasjonen/innleggelsen) som legemidlet ble rekvirert i forbindelse med."

* courseOfTherapyType ^short = "Type behandlingsforløp (continuous | acute | seasonal)"

// Andre elementer
* reported[x] only boolean

// Kommentarer
//  priorPrescription må referere til Legemiddelrekvirering

// EKSEMPEL
Instance: Rekvirering-Paracetamol
InstanceOf: Legemiddelrekvirering
Description: "Eksempel på legemiddelrekvirering av Paracet"
* identifier.system = "http://example.org/rekvirering-id"
* identifier.value = "REK123456"
* status = #active
* intent = #order
* medicationReference = Reference(Legemiddel-FestLegemiddelMerkevare)
* subject = Reference(Pasient-Med-FNR)
* requester = Reference(Helsepersonell-Med-HPR)
* authoredOn = "2025-01-27"

Instance: Rekvirering-Kjemoterapi
InstanceOf: Legemiddelrekvirering
Description: "Eksempel på kjemoterapirekvirering med doseendring, behandlingsregime og klinisk studie"
* status = #active
* intent = #order
* medicationReference = Reference(Legemiddel-FestLegemiddelVirkestoff)
* subject = Reference(Pasient-Med-FNR)
* requester = Reference(Helsepersonell-Med-HPR)
* authoredOn = "2025-03-10"
* extension[prosentvisDoseendring].valueQuantity.value = 80
* extension[prosentvisDoseendring].valueQuantity.system = "http://unitsofmeasure.org"
* extension[prosentvisDoseendring].valueQuantity.code = #%
* extension[prosentvisDoseendring].valueQuantity.unit = "%"
* extension[delAvBehandlingsregime].valueString = "FOLFOX6"
* extension[kliniskStudie].valueBoolean = true

Instance: Rekvirering-Infusjon
InstanceOf: Legemiddelrekvirering
Description: "Eksempel på rekvirering for intravenøs infusjon"
* extension[kliniskStudie].valueBoolean = false
* status = #active
* intent = #original-order
* category.coding.system = "http://terminology.hl7.org/CodeSystem/medicationrequest-category"
* category.coding.code = #inpatient
* reportedBoolean = false
* medicationReference = Reference(Legemiddel-LokaltLegemiddel-FlereIngredienser)
* subject = Reference(Pasient-Med-FNR)
* authoredOn = "2024-05-31T21:00:01+02:00"
* requester = Reference(Helsepersonell-Med-HPR)
* dosageInstruction.asNeededBoolean = true
* dosageInstruction.route.coding.system = "http://snomed.info/sct"
* dosageInstruction.route.coding.code = #47625008
* dosageInstruction.route.coding.display = "intravenøs administrasjonsvei"
* dosageInstruction.doseAndRate.rateRatio.numerator.value = 2.5
* dosageInstruction.doseAndRate.rateRatio.numerator.system = "http://unitsofmeasure.org"
* dosageInstruction.doseAndRate.rateRatio.numerator.code = #mL
* dosageInstruction.doseAndRate.rateRatio.denominator.value = 1
* dosageInstruction.doseAndRate.rateRatio.denominator.system = "http://unitsofmeasure.org"
* dosageInstruction.doseAndRate.rateRatio.denominator.code = #min

Instance: Rekvirering-MedDiagnoseICD10
InstanceOf: Legemiddelrekvirering
Description: "Eksempel på rekvirering med ICD-10-diagnose som indikasjon (allergisk rhinitt, sesongbehandling)"
* extension[kliniskStudie].valueBoolean = false
* identifier.system = "http://example.org/rekvirering-id"
* identifier.value = "13fb2660-f88a-473e-b0a9-a72266dc7137"
* status = #active
* intent = #plan
* category.coding.system = "http://terminology.hl7.org/CodeSystem/medicationrequest-category"
* category.coding.code = #inpatient
* reportedBoolean = true
* medicationReference = Reference(Legemiddel-FestLegemiddelVirkestoff-2)
* subject = Reference(Pasient-Med-DNR)
* encounter = Reference(Episode-Sykehus)
* authoredOn = "2025-04-15"
* requester = Reference(Helsepersonell-Med-HPR)
* reasonReference = Reference(Diagnose-ICD10-Allergi)
* courseOfTherapyType.coding.system = "http://terminology.hl7.org/CodeSystem/medicationrequest-course-of-therapy"
* courseOfTherapyType.coding.code = #seasonal
* courseOfTherapyType.coding.display = "Seasonal"
* dosageInstruction.timing.code.coding.system = "urn:oid:2.16.578.1.12.4.1.1.7478"
* dosageInstruction.timing.code.coding.code = #5685
* dosageInstruction.timing.code.coding.display = "1 inntil x1"
* dosageInstruction.asNeededBoolean = true
* dosageInstruction.doseAndRate.doseQuantity.value = 10
* dosageInstruction.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosageInstruction.doseAndRate.doseQuantity.code = #mg
* dosageInstruction.doseAndRate.doseQuantity.unit = "mg"

Instance: Rekvirering-EnteredInError
InstanceOf: Legemiddelrekvirering
Description: "Eksempel på rekvirering markert som entered-in-error grunnet duplisert behandling"
* extension[kliniskStudie].valueBoolean = false
* identifier.system = "http://example.org/rekvirering-id"
* identifier.value = "13fb2660-f88a-473e-b0a9-a72266dc7137"
* status = #entered-in-error
* statusReason.coding.system = "http://terminology.hl7.org/CodeSystem/medicationrequest-status-reason"
* statusReason.coding.code = #sdupther
* statusReason.coding.display = "Duplicate therapy"
* intent = #plan
* category.coding.system = "http://terminology.hl7.org/CodeSystem/medicationrequest-category"
* category.coding.code = #inpatient
* reportedBoolean = true
* medicationReference = Reference(Legemiddel-FestLegemiddelVirkestoff-2)
* subject = Reference(Pasient-Med-DNR)
* encounter = Reference(Episode-Sykehus)
* authoredOn = "2025-04-15"
* requester = Reference(Helsepersonell-Med-HPR)
* reasonReference = Reference(Diagnose-ICD10-Allergi)
* courseOfTherapyType.coding.system = "http://terminology.hl7.org/CodeSystem/medicationrequest-course-of-therapy"
* courseOfTherapyType.coding.code = #seasonal
* courseOfTherapyType.coding.display = "Seasonal"
* dosageInstruction.timing.code.coding.system = "urn:oid:2.16.578.1.12.4.1.1.7478"
* dosageInstruction.timing.code.coding.code = #5685
* dosageInstruction.timing.code.coding.display = "1 inntil x1"
* dosageInstruction.asNeededBoolean = true
* dosageInstruction.doseAndRate.doseQuantity.value = 15
* dosageInstruction.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosageInstruction.doseAndRate.doseQuantity.code = #mg
* dosageInstruction.doseAndRate.doseQuantity.unit = "mg"
