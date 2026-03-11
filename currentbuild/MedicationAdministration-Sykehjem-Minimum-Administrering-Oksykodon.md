# Sykehjem-Minimum-Administrering-Oksykodon - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Sykehjem-Minimum-Administrering-Oksykodon**

## Example MedicationAdministration: Sykehjem-Minimum-Administrering-Oksykodon



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Sykehjem-Minimum-Administrering-Oksykodon",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
  },
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/Sykehjem-Minimum-Oksykodon-Virkestoff"
  },
  "subject" : {
    "reference" : "Patient/Sykehjem-Minimum-Pasient"
  },
  "context" : {
    "reference" : "Encounter/Sykehjem-Minimum-Episode"
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
