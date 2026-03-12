# Administrering-Scenario-Sykehjem-Minimum-Oksykodon - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-Scenario-Sykehjem-Minimum-Oksykodon**

## Example MedicationAdministration: Administrering-Scenario-Sykehjem-Minimum-Oksykodon



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-Scenario-Sykehjem-Minimum-Oksykodon",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
  },
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-Scenario-Sykehjem-Minimum-Oksykodon-FEST-Virkestoff"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Scenario-Sykehjem-Minimum-Med-FNR"
  },
  "context" : {
    "reference" : "Encounter/Episode-Scenario-Sykehjem-Minimum-Opphold"
  },
  "effectiveDateTime" : "2025-03-10T08:15:00+01:00",
  "dosage" : {
    "dose" : {
      "value" : 5,
      "unit" : "mg",
      "system" : "http://unitsofmeasure.org",
      "code" : "mg"
    }
  }
}

```
