# Diagnose-Eksempel-SNOMED-CT - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Diagnose-Eksempel-SNOMED-CT**

## Example Condition: Diagnose-Eksempel-SNOMED-CT



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "Diagnose-Eksempel-SNOMED-CT",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition"]
  },
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "276241001",
      "display" : "frykt for høyder"
    },
    {
      "system" : "urn:oid:2.16.578.1.12.4.1.1.7110",
      "code" : "F40.2",
      "display" : "Spesifikke (isolerte) fobier"
    }],
    "text" : "Høydeskrekk"
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
