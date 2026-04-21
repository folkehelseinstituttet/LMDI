# Administrering-MedDiagnoseICD10 - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-MedDiagnoseICD10**

## Example MedicationAdministration: Administrering-MedDiagnoseICD10



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-MedDiagnoseICD10",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
  },
  "identifier" : [{
    "value" : "71dd991f-2662-4a7e-86b6-c6c85c9580d4"
  }],
  "status" : "completed",
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-FestLegemiddelpakning"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Med-FNR"
  },
  "context" : {
    "reference" : "Encounter/Episode-Sykehus"
  },
  "effectiveDateTime" : "2025-06-13T14:48:47+02:00",
  "reasonReference" : [{
    "reference" : "Condition/Diagnose-ICD10"
  }],
  "dosage" : {
    "route" : {
      "coding" : [{
        "system" : "urn:oid:2.16.578.1.12.4.1.1.7477",
        "code" : "53",
        "display" : "Oral bruk"
      }]
    },
    "dose" : {
      "value" : 50,
      "unit" : "milligram",
      "system" : "http://unitsofmeasure.org",
      "code" : "mg"
    }
  }
}

```
