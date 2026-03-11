# Endose-Smertebehandling-Administrering - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Endose-Smertebehandling-Administrering**

## Example MedicationAdministration: Endose-Smertebehandling-Administrering



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Endose-Smertebehandling-Administrering",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
  },
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/Endose-Smertebehandling-Morfin-Endose"
  },
  "subject" : {
    "reference" : "Patient/Endose-Smertebehandling-Pasient-Dnr"
  },
  "context" : {
    "reference" : "Encounter/Endose-Smertebehandling-Episode"
  },
  "effectiveDateTime" : "2025-03-09T22:30:00+01:00",
  "reasonReference" : [{
    "reference" : "Condition/Endose-Smertebehandling-Diagnose"
  }],
  "request" : {
    "reference" : "MedicationRequest/Endose-Smertebehandling-Rekvirering"
  },
  "dosage" : {
    "route" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "34206005",
        "display" : "Subcutaneous route (qualifier value)"
      },
      {
        "system" : "urn:oid:2.16.578.1.12.4.1.1.7477",
        "code" : "3",
        "display" : "Subkutan"
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
