# Scenario-C-Administrering - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario-C-Administrering**

## Example MedicationAdministration: Scenario-C-Administrering



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Scenario-C-Administrering",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
  },
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/Scenario-C-Medisin"
  },
  "subject" : {
    "reference" : "Patient/Scenario-C-Pasient"
  },
  "context" : {
    "reference" : "Encounter/Scenario-C-Episode"
  },
  "effectivePeriod" : {
    "start" : "2025-03-10T09:00:00+01:00",
    "end" : "2025-03-10T11:00:00+01:00"
  },
  "request" : {
    "reference" : "MedicationRequest/Scenario-C-Rekvirering"
  },
  "dosage" : {
    "route" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "47625008",
        "display" : "Intravenous route (qualifier value)"
      }]
    },
    "dose" : {
      "value" : 170,
      "unit" : "mg",
      "system" : "http://unitsofmeasure.org",
      "code" : "mg"
    },
    "rateRatio" : {
      "numerator" : {
        "value" : 250,
        "system" : "http://unitsofmeasure.org",
        "code" : "ml"
      },
      "denominator" : {
        "value" : 120,
        "system" : "http://unitsofmeasure.org",
        "code" : "min"
      }
    }
  }
}

```
