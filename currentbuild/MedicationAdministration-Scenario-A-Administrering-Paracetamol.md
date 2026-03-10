# Scenario-A-Administrering-Paracetamol - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario-A-Administrering-Paracetamol**

## Example MedicationAdministration: Scenario-A-Administrering-Paracetamol

Profile: [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md)

**status**: Completed

**medication**: [Medication Paracet tab 500 mg](Medication-Scenario-A-Medisin-Paracetamol.md)

**subject**: [Anonymous Patient Female, DoB: 1945-04-12 ( urn:oid:2.16.578.1.12.4.1.4.1#12045678901)](Patient-Scenario-A-Pasient.md)

**context**: [Encounter: extension = ; status = in-progress; class = inpatient encounter (ActCode#IMP)](Encounter-Scenario-A-Episode.md)

**effective**: 2025-03-10 08:00:00+0100

### Dosages

| | | |
| :--- | :--- | :--- |
| - | **Route** | **Dose** |
| * | Swallow | 500 mg (Details: UCUM codemg = 'mg') |



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Scenario-A-Administrering-Paracetamol",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
  },
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/Scenario-A-Medisin-Paracetamol"
  },
  "subject" : {
    "reference" : "Patient/Scenario-A-Pasient"
  },
  "context" : {
    "reference" : "Encounter/Scenario-A-Episode"
  },
  "effectiveDateTime" : "2025-03-10T08:00:00+01:00",
  "dosage" : {
    "route" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "421521009",
        "display" : "Swallow"
      }]
    },
    "dose" : {
      "value" : 500,
      "unit" : "mg",
      "system" : "http://unitsofmeasure.org",
      "code" : "mg"
    }
  }
}

```
