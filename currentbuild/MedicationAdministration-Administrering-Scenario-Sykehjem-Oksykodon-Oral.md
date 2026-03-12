# Administrering-Scenario-Sykehjem-Oksykodon-Oral - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-Scenario-Sykehjem-Oksykodon-Oral**

## Example MedicationAdministration: Administrering-Scenario-Sykehjem-Oksykodon-Oral



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-Scenario-Sykehjem-Oksykodon-Oral",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
  },
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-Scenario-Sykehjem-Oksykodon-FEST-Dose"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Scenario-Sykehjem-Oksykodon-Med-FNR"
  },
  "context" : {
    "reference" : "Encounter/Episode-Scenario-Sykehjem-Oksykodon-Opphold"
  },
  "effectiveDateTime" : "2024-05-28T13:14:00+02:00",
  "request" : {
    "reference" : "MedicationRequest/Rekvirering-Scenario-Sykehjem-Oksykodon-Oral"
  },
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
      "unit" : "mg",
      "system" : "http://unitsofmeasure.org",
      "code" : "mg"
    }
  }
}

```
