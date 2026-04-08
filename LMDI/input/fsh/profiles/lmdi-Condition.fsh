Profile: Diagnose
Parent: Condition
Id: lmdi-condition
Title: "Diagnose"
Description: "Diagnosen som pasienten har fått rekvirert eller administrert legemiddelet for."

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

// Diagnosekoding - hovedregler
* code 1..1
* code ^short = "Diagnosekode."
* code ^definition = "Diagnosekode. Det er mulig å bruke ICD-10, ICD-11, ICPC-2 og SNOMED CT."

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
* code.coding[SCT].system = "http://snomed.info/sct"
* code.coding[SCT].code 1..1

// ICD-10
* code.coding[ICD10] ^short = "ICD-10"
* code.coding[ICD10] ^definition = "ICD-10: Den internasjonale statistiske klassifikasjonen av sykdommer og beslektede helseproblemer."
* code.coding[ICD10].system = "urn:oid:2.16.578.1.12.4.1.1.7110"
* code.coding[ICD10].code 1..1
* code.coding[ICD10].code ^short = "Diagnosekode fra kodeverket"
* code.coding[ICD10].display ^short = "Beskrivelse av diagnosekode (fra kodeverket)"

// ICD-11
* code.coding[ICD11] ^short = "ICD-11"
* code.coding[ICD11] ^definition = "International Classification of Diseases, 11th Revision Mortality and Morbidity Statistics (MMS)."
* code.coding[ICD11] ^comment = "Skal erstattes av navnerom som peker på generell ICD-11, ikke MMS."
* code.coding[ICD11].system = "http://id.who.int/icd/release/11/mms"
* code.coding[ICD11].system ^comment = "Kilde for URI: https://build.fhir.org/ig/HL7/UTG/CodeSystem-ICD11MMS.html"
* code.coding[ICD11].code 1..1
* code.coding[ICD11].code ^short = "Diagnosekode fra kodeverket"
* code.coding[ICD11].display ^short = "Beskrivelse av diagnosekode (fra kodeverket)"

// ICPC-2
* code.coding[ICPC2] ^short = "ICPC-2"
* code.coding[ICPC2] ^definition = "ICPC-2 er den internasjonale klassifikasjonen for helseproblemer, diagnoser og andre årsaker til kontakt med primærhelsetjenesten."
* code.coding[ICPC2].system = "urn:oid:2.16.578.1.12.4.1.1.7170"
* code.coding[ICPC2].code 1..1
* code.coding[ICPC2].code ^short = "Diagnosekode fra kodeverket"
* code.coding[ICPC2].display ^short = "Beskrivelse av diagnosekode (fra kodeverket)"

// EKSEMPLER
Instance: Diagnose-ICD10
InstanceOf: Diagnose
Description: "Eksempel på diagnose ICD-10"
* subject = Reference(Pasient-Med-FNR)
* stage.summary.text = "Indikasjonsdiagnose for legemiddelbehandling"
* code.coding[ICD10].system = "urn:oid:2.16.578.1.12.4.1.1.7110"
* code.coding[ICD10] = #R63.3
* code.coding[ICD10].display = "Vanskeligheter med inntak og tilførsel av mat"

Instance: Diagnose-SNOMED-SCT
InstanceOf: Diagnose
Description: "Eksempel på diagnose SNOMED CT"
* subject = Reference(Pasient-Med-FNR)
* clinicalStatus.coding.system = "http://terminology.hl7.org/CodeSystem/condition-clinical"
* clinicalStatus.coding.code = #active
* code.coding[SCT].system = "http://snomed.info/sct"
* code.coding[SCT] = #396275006
* code.coding[SCT].display = "Artrose"
