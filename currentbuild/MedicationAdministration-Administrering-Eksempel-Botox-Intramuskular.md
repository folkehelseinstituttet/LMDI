# Administrering-Eksempel-Botox-Intramuskular - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-Eksempel-Botox-Intramuskular**

## Example MedicationAdministration: Administrering-Eksempel-Botox-Intramuskular



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-Eksempel-Botox-Intramuskular",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
  },
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-Eksempel-Botox-FEST-Pakning"
  },
  "subject" : {
    "reference" : "https://fhi.no/fhir/lmdi/pasient/12345678"
  },
  "effectiveDateTime" : "2024-05-28T10:00:00+02:00",
  "dosage" : {
    "route" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "78421000",
        "display" : "Intramuscular route (qualifier value)"
      }]
    },
    "dose" : {
      "value" : 100,
      "unit" : "mg",
      "system" : "http://unitsofmeasure.org",
      "code" : "mg"
    }
  }
}

```
