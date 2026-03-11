# Scenario-A-Administrering-Oksykodon - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario-A-Administrering-Oksykodon**

## Example MedicationAdministration: Scenario-A-Administrering-Oksykodon



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Scenario-A-Administrering-Oksykodon",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
  },
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/Scenario-A-Medisin-Oksykodon"
  },
  "subject" : {
    "reference" : "Patient/Scenario-A-Pasient"
  },
  "context" : {
    "reference" : "Encounter/Scenario-A-Episode"
  },
  "effectiveDateTime" : "2025-03-10T08:15:00+01:00",
  "dosage" : {
    "route" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "421521009",
        "display" : "Swallow"
      }]
    },
    "dose" : {
      "value" : 5,
      "unit" : "ml",
      "system" : "http://unitsofmeasure.org",
      "code" : "ml"
    }
  }
}

```
