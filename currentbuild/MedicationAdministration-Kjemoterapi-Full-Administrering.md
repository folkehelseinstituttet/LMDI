# Kjemoterapi-Full-Administrering - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Kjemoterapi-Full-Administrering**

## Example MedicationAdministration: Kjemoterapi-Full-Administrering



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Kjemoterapi-Full-Administrering",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
  },
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/Kjemoterapi-Full-Oksaliplatin-LokalKatalog"
  },
  "subject" : {
    "reference" : "Patient/Kjemoterapi-Full-Pasient"
  },
  "context" : {
    "reference" : "Encounter/Kjemoterapi-Full-Episode"
  },
  "effectivePeriod" : {
    "start" : "2025-03-10T09:00:00+01:00",
    "end" : "2025-03-10T11:00:00+01:00"
  },
  "reasonReference" : [{
    "reference" : "Condition/Kjemoterapi-Full-Diagnose"
  }],
  "request" : {
    "reference" : "MedicationRequest/Kjemoterapi-Full-Rekvirering"
  },
  "dosage" : {
    "route" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "47625008",
        "display" : "Intravenous route (qualifier value)"
      },
      {
        "system" : "urn:oid:2.16.578.1.12.4.1.1.7477",
        "code" : "7",
        "display" : "Intravenøs"
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
