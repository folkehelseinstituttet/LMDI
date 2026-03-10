# Scenario-B-Administrering - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario-B-Administrering**

## Example MedicationAdministration: Scenario-B-Administrering

Profile: [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md)

**status**: Completed

**medication**: [Medication Morfin injeksjonsvæske 10 mg/ml](Medication-Scenario-B-Medisin.md)

**subject**: [Anonymous Patient Female, DoB: 2000-03-12 ( urn:oid:2.16.578.1.12.4.1.4.2#52030078901)](Patient-Scenario-B-Pasient.md)

**context**: [Encounter: extension = ; status = finished; class = inpatient encounter (ActCode#IMP)](Encounter-Scenario-B-Episode.md)

**effective**: 2025-03-09 22:30:00+0100

**reasonReference**: [Condition Akutt smerte](Condition-Scenario-B-Diagnose.md)

**request**: [MedicationRequest: status = completed; intent = order; medication[x] = ->Medication Morfin injeksjonsvæske 10 mg/ml; authoredOn = 2025-03-09](MedicationRequest-Scenario-B-Rekvirering.md)

### Dosages

| | | |
| :--- | :--- | :--- |
| - | **Route** | **Dose** |
| * | Subcutaneous route (qualifier value) | 5 mg (Details: UCUM codemg = 'mg') |



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Scenario-B-Administrering",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
  },
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/Scenario-B-Medisin"
  },
  "subject" : {
    "reference" : "Patient/Scenario-B-Pasient"
  },
  "context" : {
    "reference" : "Encounter/Scenario-B-Episode"
  },
  "effectiveDateTime" : "2025-03-09T22:30:00+01:00",
  "reasonReference" : [{
    "reference" : "Condition/Scenario-B-Diagnose"
  }],
  "request" : {
    "reference" : "MedicationRequest/Scenario-B-Rekvirering"
  },
  "dosage" : {
    "route" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "34206005",
        "display" : "Subcutaneous route (qualifier value)"
      }]
    },
    "dose" : {
      "value" : 5,
      "unit" : "mg",
      "system" : "http://unitsofmeasure.org",
      "code" : "mg"
    }
  }
}

```
