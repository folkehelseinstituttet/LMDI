Profile: Diagnose
Parent: Condition
Id: lmdi-condition
Title: "Diagnose"
Description: "Diagnosen som pasienten har fått rekvirert eller administrert legemiddelet for."
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Diagnosis"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "The diagnosis for which the patient received a medication request or administration."

// Metadata
* ^status = #draft
* ^date = "2025-09-12"
* ^publisher = "Folkehelseinstituttet"

// Deaktiverte elementer
* encounter 0..0
* text 0..0
* category 0..0
* severity 0..0
* bodySite 0..0
* abatement[x] 0..0
* onset[x] 0..0
* recorder 0..0
* recordedDate 0..0
* asserter 0..0
* evidence 0..0
* note 0..0
* stage.summary 1..1
* stage.assessment 0..0

// Grunnleggende elementer
* subject 1..1
* subject only Reference(Pasient)
* subject ^short = "Pasienten diagnosen er knyttet til."
* subject ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* subject ^short.extension[=].extension[+].url = "lang"
* subject ^short.extension[=].extension[=].valueCode = #en
* subject ^short.extension[=].extension[+].url = "content"
* subject ^short.extension[=].extension[=].valueString = "The patient the diagnosis is associated with."

// Diagnosekoding - hovedregler
* code 1..1
* code ^short = "Diagnosekode."
* code ^definition = "Diagnosekode. Det er mulig å bruke ICD-10, ICD-11, ICPC-2 og SNOMED CT."
* code ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code ^short.extension[=].extension[+].url = "lang"
* code ^short.extension[=].extension[=].valueCode = #en
* code ^short.extension[=].extension[+].url = "content"
* code ^short.extension[=].extension[=].valueString = "Diagnosis code."
* code ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code ^definition.extension[=].extension[+].url = "lang"
* code ^definition.extension[=].extension[=].valueCode = #en
* code ^definition.extension[=].extension[+].url = "content"
* code ^definition.extension[=].extension[=].valueString = "Diagnosis code. ICD-10, ICD-11, ICPC-2, and SNOMED CT can be used."

* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #closed

// Diagnosekoding - kodesystemer
* code.coding contains
    SCT 0..1 and
    ICD10 0..1 and
    ICD11 0..1 and
    ICPC2 0..1

// SNOMED CT
* code.coding[SCT] ^short = "SNOMED CT"
* code.coding[SCT] ^definition = "SNOMED CT er ei systematisk samling av helsefaglege omgrep som kan brukast til å dokumentere og dele opplysningar knytt til pasientbehandlinga. Ved å bruke eit felles omgrepsapparat skal det bli lettare å kommunisere mellom ulike delar av helsetenesta."
* code.coding[SCT] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[SCT] ^short.extension[=].extension[+].url = "lang"
* code.coding[SCT] ^short.extension[=].extension[=].valueCode = #en
* code.coding[SCT] ^short.extension[=].extension[+].url = "content"
* code.coding[SCT] ^short.extension[=].extension[=].valueString = "SNOMED CT"
* code.coding[SCT] ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[SCT] ^definition.extension[=].extension[+].url = "lang"
* code.coding[SCT] ^definition.extension[=].extension[=].valueCode = #en
* code.coding[SCT] ^definition.extension[=].extension[+].url = "content"
* code.coding[SCT] ^definition.extension[=].extension[=].valueString = "SNOMED CT is a systematic collection of clinical concepts that can be used to document and share information related to patient care. Using a common terminology makes it easier to communicate across different parts of the health service."
* code.coding[SCT].system = "http://snomed.info/sct"
* code.coding[SCT].code 1..1

// ICD-10
* code.coding[ICD10] ^short = "ICD-10"
* code.coding[ICD10] ^definition = "ICD-10: Den internasjonale statistiske klassifikasjonen av sykdommer og beslektede helseproblemer."
* code.coding[ICD10] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[ICD10] ^short.extension[=].extension[+].url = "lang"
* code.coding[ICD10] ^short.extension[=].extension[=].valueCode = #en
* code.coding[ICD10] ^short.extension[=].extension[+].url = "content"
* code.coding[ICD10] ^short.extension[=].extension[=].valueString = "ICD-10"
* code.coding[ICD10] ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[ICD10] ^definition.extension[=].extension[+].url = "lang"
* code.coding[ICD10] ^definition.extension[=].extension[=].valueCode = #en
* code.coding[ICD10] ^definition.extension[=].extension[+].url = "content"
* code.coding[ICD10] ^definition.extension[=].extension[=].valueString = "ICD-10: The International Statistical Classification of Diseases and Related Health Problems."
* code.coding[ICD10].system = "urn:oid:2.16.578.1.12.4.1.1.7110"
* code.coding[ICD10].code 1..1
* code.coding[ICD10].code ^short = "Diagnosekode fra kodeverket"
* code.coding[ICD10].display ^short = "Beskrivelse av diagnosekode (fra kodeverket)"

// ICD-11
* code.coding[ICD11] ^short = "ICD-11"
* code.coding[ICD11] ^definition = "International Classification of Diseases, 11th Revision Mortality and Morbidity Statistics (MMS)."
* code.coding[ICD11] ^comment = "Skal erstattes av navnerom som peker på generell ICD-11, ikke MMS."
* code.coding[ICD11] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[ICD11] ^short.extension[=].extension[+].url = "lang"
* code.coding[ICD11] ^short.extension[=].extension[=].valueCode = #en
* code.coding[ICD11] ^short.extension[=].extension[+].url = "content"
* code.coding[ICD11] ^short.extension[=].extension[=].valueString = "ICD-11"
* code.coding[ICD11] ^comment.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[ICD11] ^comment.extension[=].extension[+].url = "lang"
* code.coding[ICD11] ^comment.extension[=].extension[=].valueCode = #en
* code.coding[ICD11] ^comment.extension[=].extension[+].url = "content"
* code.coding[ICD11] ^comment.extension[=].extension[=].valueString = "Should be replaced by a namespace that points to general ICD-11, not MMS."
* code.coding[ICD11].system = "http://id.who.int/icd/release/11/mms"
* code.coding[ICD11].system ^comment = "Kilde for URI: https://build.fhir.org/ig/HL7/UTG/CodeSystem-ICD11MMS.html"
* code.coding[ICD11].code 1..1
* code.coding[ICD11].code ^short = "Diagnosekode fra kodeverket"
* code.coding[ICD11].display ^short = "Beskrivelse av diagnosekode (fra kodeverket)"

// ICPC-2
* code.coding[ICPC2] ^short = "ICPC-2"
* code.coding[ICPC2] ^definition = "ICPC-2 er den internasjonale klassifikasjonen for helseproblemer, diagnoser og andre årsaker til kontakt med primærhelsetjenesten."
* code.coding[ICPC2] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[ICPC2] ^short.extension[=].extension[+].url = "lang"
* code.coding[ICPC2] ^short.extension[=].extension[=].valueCode = #en
* code.coding[ICPC2] ^short.extension[=].extension[+].url = "content"
* code.coding[ICPC2] ^short.extension[=].extension[=].valueString = "ICPC-2"
* code.coding[ICPC2] ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[ICPC2] ^definition.extension[=].extension[+].url = "lang"
* code.coding[ICPC2] ^definition.extension[=].extension[=].valueCode = #en
* code.coding[ICPC2] ^definition.extension[=].extension[+].url = "content"
* code.coding[ICPC2] ^definition.extension[=].extension[=].valueString = "ICPC-2 is the International Classification of Primary Care, for health problems, diagnoses, and other reasons for contact with primary care."
* code.coding[ICPC2].system = "urn:oid:2.16.578.1.12.4.1.1.7170"
* code.coding[ICPC2].code 1..1
* code.coding[ICPC2].code ^short = "Diagnosekode fra kodeverket"
* code.coding[ICPC2].display ^short = "Beskrivelse av diagnosekode (fra kodeverket)"

// EKSEMPLER
Instance: Diagnose-ICD10
InstanceOf: Diagnose
Description: "Eksempel på diagnose ICD-10"
* subject = Reference(Pasient-Med-FNR)
* clinicalStatus.coding.system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* clinicalStatus.coding.code = #active
* code.coding[ICD10].system = "urn:oid:2.16.578.1.12.4.1.1.7110"
* code.coding[ICD10] = #I20
* code.coding[ICD10].display = "Angina pectoris"

Instance: Diagnose-SNOMED-SCT
InstanceOf: Diagnose
Description: "Eksempel på diagnose SNOMED CT"
* subject = Reference(Pasient-Med-FNR)
* clinicalStatus.coding.system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* clinicalStatus.coding.code = #active
* code.coding[SCT].system = "http://snomed.info/sct"
* code.coding[SCT] = #396275006
* code.coding[SCT].display = "Artrose"

Instance: Diagnose-ICD10-Allergi
InstanceOf: Diagnose
Description: "Eksempel på diagnose med ICD-10-kode J30 - allergisk rhinitt"
* subject = Reference(Pasient-Med-DNR)
* clinicalStatus.coding.system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* clinicalStatus.coding.code = #active
* code.coding[ICD10].system = "urn:oid:2.16.578.1.12.4.1.1.7110"
* code.coding[ICD10] = #J30
* code.coding[ICD10].display = "Vasomotorisk og allergisk rhinitt"
