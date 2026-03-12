# Administrering-Scenario-Kjemoterapi-Full-Oksaliplatin - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-Scenario-Kjemoterapi-Full-Oksaliplatin**

## Example MedicationAdministration: Administrering-Scenario-Kjemoterapi-Full-Oksaliplatin



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-Scenario-Kjemoterapi-Full-Oksaliplatin",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
  },
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-Scenario-Kjemoterapi-Full-Oksaliplatin-LokalKatalog"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Scenario-Kjemoterapi-Full-Med-FNR"
  },
  "context" : {
    "reference" : "Encounter/Episode-Scenario-Kjemoterapi-Full-Innleggelse"
  },
  "effectivePeriod" : {
    "start" : "2025-03-10T09:00:00+01:00",
    "end" : "2025-03-10T11:00:00+01:00"
  },
  "reasonReference" : [{
    "reference" : "Condition/Diagnose-Scenario-Kjemoterapi-Full-Kreftdiagnose"
  }],
  "request" : {
    "reference" : "MedicationRequest/Rekvirering-Scenario-Kjemoterapi-Full-Gjeldende"
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
