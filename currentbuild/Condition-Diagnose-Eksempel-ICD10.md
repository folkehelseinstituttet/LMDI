# Diagnose-Eksempel-ICD10 - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Diagnose-Eksempel-ICD10**

## Example Condition: Diagnose-Eksempel-ICD10



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Diagnose-Eksempel-ICD10",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition"]
  },
  "code" : {
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.7110",
      "code" : "R63.3",
      "display" : "Vanskeligheter med inntak og tilførsel av mat"
    }]
  },
  "subject" : {
    "reference" : "Patient/Pasient-Eksempel-Med-FNR"
  },
  "stage" : [{
    "summary" : {
      "text" : "Indikasjonsdiagnose for legemiddelbehandling"
    }
  }]
}

```
