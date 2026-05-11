Profile: Legemiddelrekvirering
Parent: MedicationRequest
Id: lmdi-medicationrequest
Title: "Legemiddelrekvirering"
Description: "Legemiddelrekvirering - ordinering eller annen rekvirering av legemiddel"

// Metadata
* ^status = #draft
* ^date = "2025-09-12"
* ^publisher = "Folkehelseinstituttet"
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Medication Request"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "Medication request - prescribing or other medication ordering"


// Extensions for Legemiddelrekvirering
* extension contains ProsentvisDoseendring named prosentvisDoseendring 0..1
* extension[prosentvisDoseendring] ^short = "Doseendring i prosent (100% = umodifisert dose)"
* extension[prosentvisDoseendring] ^definition = "Doseendring i prosent, sammenlignet med opprinnelig dosering. Spesielt relevant ved kjemoterapi. En normal dose, uten modifiseringer, er 100%. Kan ha verdier fra 0. Enhet skal være prosent."
* extension[prosentvisDoseendring] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* extension[prosentvisDoseendring] ^short.extension[=].extension[+].url = "lang"
* extension[prosentvisDoseendring] ^short.extension[=].extension[=].valueCode = #en
* extension[prosentvisDoseendring] ^short.extension[=].extension[+].url = "content"
* extension[prosentvisDoseendring] ^short.extension[=].extension[=].valueString = "Dose adjustment in percent (100% = unmodified dose)"
* extension[prosentvisDoseendring] ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* extension[prosentvisDoseendring] ^definition.extension[=].extension[+].url = "lang"
* extension[prosentvisDoseendring] ^definition.extension[=].extension[=].valueCode = #en
* extension[prosentvisDoseendring] ^definition.extension[=].extension[+].url = "content"
* extension[prosentvisDoseendring] ^definition.extension[=].extension[=].valueString = "Dose adjustment in percent, compared with the original dosage. Especially relevant for chemotherapy. A normal dose without modifications is 100%. May have values from 0. Unit shall be percent."

* extension contains DelAvBehandlingsregime named delAvBehandlingsregime 0..1
* extension[delAvBehandlingsregime] ^short = "Del av behandlingsregime"
* extension[delAvBehandlingsregime] ^definition = "Navnet på kuren, behandlingsregimet eller protokollen legemidlet gis som en del av. Spesielt relevant ved kjemoterapi."
* extension[delAvBehandlingsregime] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* extension[delAvBehandlingsregime] ^short.extension[=].extension[+].url = "lang"
* extension[delAvBehandlingsregime] ^short.extension[=].extension[=].valueCode = #en
* extension[delAvBehandlingsregime] ^short.extension[=].extension[+].url = "content"
* extension[delAvBehandlingsregime] ^short.extension[=].extension[=].valueString = "Part of treatment regimen"
* extension[delAvBehandlingsregime] ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* extension[delAvBehandlingsregime] ^definition.extension[=].extension[+].url = "lang"
* extension[delAvBehandlingsregime] ^definition.extension[=].extension[=].valueCode = #en
* extension[delAvBehandlingsregime] ^definition.extension[=].extension[+].url = "content"
* extension[delAvBehandlingsregime] ^definition.extension[=].extension[=].valueString = "The name of the course, treatment regimen, or protocol that the medication is part of. Especially relevant for chemotherapy."

* extension contains KliniskStudie named kliniskStudie 0..1
* extension[kliniskStudie] ^short = "Legemiddel i klinisk studie"
* extension[kliniskStudie] ^definition = "Angir om legemidlet gis som en del av en klinisk studie."
* extension[kliniskStudie] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* extension[kliniskStudie] ^short.extension[=].extension[+].url = "lang"
* extension[kliniskStudie] ^short.extension[=].extension[=].valueCode = #en
* extension[kliniskStudie] ^short.extension[=].extension[+].url = "content"
* extension[kliniskStudie] ^short.extension[=].extension[=].valueString = "Medication in clinical trial"
* extension[kliniskStudie] ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* extension[kliniskStudie] ^definition.extension[=].extension[+].url = "lang"
* extension[kliniskStudie] ^definition.extension[=].extension[=].valueCode = #en
* extension[kliniskStudie] ^definition.extension[=].extension[+].url = "content"
* extension[kliniskStudie] ^definition.extension[=].extension[=].valueString = "Indicates whether the medication is given as part of a clinical trial."


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
* identifier ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* identifier ^short.extension[=].extension[+].url = "lang"
* identifier ^short.extension[=].extension[=].valueCode = #en
* identifier ^short.extension[=].extension[+].url = "content"
* identifier ^short.extension[=].extension[=].valueString = "Identifier for the medication request"
* identifier ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* identifier ^definition.extension[=].extension[+].url = "lang"
* identifier ^definition.extension[=].extension[=].valueCode = #en
* identifier ^definition.extension[=].extension[+].url = "content"
* identifier ^definition.extension[=].extension[=].valueString = "Must Support: An identifier that uniquely identifies a medication request shall be provided if one exists."

// Status og intensjon
* status 1..1 MS
* status ^short = "Status for rekvireringen"
* status ^definition = "Must Support: Status er viktig for å kunne følge livssyklusen til en rekvirering og må støttes av alle systemer"
* status from http://hl7.org/fhir/ValueSet/medicationrequest-status
* status ^comment = "Gyldige verdier: active | on-hold | cancelled | completed | entered-in-error | stopped | draft"
* status ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* status ^short.extension[=].extension[+].url = "lang"
* status ^short.extension[=].extension[=].valueCode = #en
* status ^short.extension[=].extension[+].url = "content"
* status ^short.extension[=].extension[=].valueString = "Status of the medication request"
* status ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* status ^definition.extension[=].extension[+].url = "lang"
* status ^definition.extension[=].extension[=].valueCode = #en
* status ^definition.extension[=].extension[+].url = "content"
* status ^definition.extension[=].extension[=].valueString = "Must Support: Status is important for following the lifecycle of a medication request and must be supported by all systems."
* status ^comment.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* status ^comment.extension[=].extension[+].url = "lang"
* status ^comment.extension[=].extension[=].valueCode = #en
* status ^comment.extension[=].extension[+].url = "content"
* status ^comment.extension[=].extension[=].valueString = "Valid values: active | on-hold | cancelled | completed | entered-in-error | stopped | draft"

* intent 1..1 MS
* intent ^short = "Intensjonen eller hensikten med rekvireringen: proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option"
* intent ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* intent ^short.extension[=].extension[+].url = "lang"
* intent ^short.extension[=].extension[=].valueCode = #en
* intent ^short.extension[=].extension[+].url = "content"
* intent ^short.extension[=].extension[=].valueString = "The intent or purpose of the medication request: proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option"

// Referanser til andre ressurser
* medication[x] only Reference(Legemiddel)
* medication[x] 1..1 MS
* medication[x] ^short = "Legemidlet som er rekvirert"
* medication[x] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* medication[x] ^short.extension[=].extension[+].url = "lang"
* medication[x] ^short.extension[=].extension[=].valueCode = #en
* medication[x] ^short.extension[=].extension[+].url = "content"
* medication[x] ^short.extension[=].extension[=].valueString = "The medication that was requested"

* subject 1..1 MS
* subject only Reference(Pasient)
* subject ^short = "Pasienten legemidlet er rekvirert til"
* subject ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* subject ^short.extension[=].extension[+].url = "lang"
* subject ^short.extension[=].extension[=].valueCode = #en
* subject ^short.extension[=].extension[+].url = "content"
* subject ^short.extension[=].extension[=].valueString = "The patient the medication was requested for"

* requester 1..1 MS
* requester only Reference(Helsepersonell)
* requester ^short = "Helsepersonellet som rekvirerte legemidlet"
* requester ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* requester ^short.extension[=].extension[+].url = "lang"
* requester ^short.extension[=].extension[=].valueCode = #en
* requester ^short.extension[=].extension[+].url = "content"
* requester ^short.extension[=].extension[=].valueString = "The healthcare professional who requested the medication"

* reasonReference only Reference(Diagnose)
* reasonReference ^short = "Indikasjon (diagnose) for legemiddelrekvireringen"
* reasonReference ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* reasonReference ^short.extension[=].extension[+].url = "lang"
* reasonReference ^short.extension[=].extension[=].valueCode = #en
* reasonReference ^short.extension[=].extension[+].url = "content"
* reasonReference ^short.extension[=].extension[=].valueString = "Indication (diagnosis) for the medication request"

* priorPrescription only Reference(Legemiddelrekvirering)

* encounter only Reference(Episode)
* encounter ^short = "Episoden (f.eks. konsultasjonen/innleggelsen) som legemidlet ble rekvirert i forbindelse med."
* encounter ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* encounter ^short.extension[=].extension[+].url = "lang"
* encounter ^short.extension[=].extension[=].valueCode = #en
* encounter ^short.extension[=].extension[+].url = "content"
* encounter ^short.extension[=].extension[=].valueString = "The episode (for example the consultation or admission) associated with the medication request."

* courseOfTherapyType ^short = "Type behandlingsforløp (continuous | acute | seasonal)"
* courseOfTherapyType ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* courseOfTherapyType ^short.extension[=].extension[+].url = "lang"
* courseOfTherapyType ^short.extension[=].extension[=].valueCode = #en
* courseOfTherapyType ^short.extension[=].extension[+].url = "content"
* courseOfTherapyType ^short.extension[=].extension[=].valueString = "Type of treatment course (continuous | acute | seasonal)"

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

Instance: Rekvirering-Cellegift
InstanceOf: Legemiddelrekvirering
Description: "Eksempel på rekvirering av cellegift (Cisplatin) med prosentvis doseendring og del av behandlingsregime"
* identifier.system = "http://example.org/rekvirering-id"
* identifier.value = "46456453321544556324"
* status = #unknown
* intent = #original-order
* medicationReference = Reference(Lokalt-legemiddel-cellegift)
* subject = Reference(Pasient-Med-FNR)
* requester = Reference(Helsepersonell-Uten-HPR)
* authoredOn = "2026-03-28"
* extension[prosentvisDoseendring].valueQuantity.value = 50
* extension[prosentvisDoseendring].valueQuantity.system = "http://unitsofmeasure.org"
* extension[prosentvisDoseendring].valueQuantity.code = #%
* extension[prosentvisDoseendring].valueQuantity.unit = "%"
* extension[delAvBehandlingsregime].valueString = "B102 Gastro, ECX, Epirubicin, Cisplatin, Xeloda"
* dosageInstruction.timing.repeat.count = 5
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #mo
* dosageInstruction.route.coding.system = "http://snomed.info/sct"
* dosageInstruction.route.coding.code = #47625008
* dosageInstruction.route.coding.display = "intravenøs administrasjonsvei"
* dosageInstruction.doseAndRate.doseQuantity.value = 1025
* dosageInstruction.doseAndRate.doseQuantity.system = "http://unitsofmeasure.org"
* dosageInstruction.doseAndRate.doseQuantity.code = #mg
* dosageInstruction.doseAndRate.doseQuantity.unit = "milligram"
* dosageInstruction.doseAndRate.rateQuantity.value = 12
* dosageInstruction.doseAndRate.rateQuantity.system = "http://unitsofmeasure.org"
* dosageInstruction.doseAndRate.rateQuantity.code = #mg/min
* dosageInstruction.doseAndRate.rateQuantity.unit = "milligram per minute"
