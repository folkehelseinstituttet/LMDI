# Virkestoff-Scenario-Kjemoterapi-Full-Oksaliplatin - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Virkestoff-Scenario-Kjemoterapi-Full-Oksaliplatin**

## Example Substance: Virkestoff-Scenario-Kjemoterapi-Full-Oksaliplatin



## Resource Content

```json
{
  "resourceType" : "Substance",
  "id" : "Virkestoff-Scenario-Kjemoterapi-Full-Oksaliplatin",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-substance"]
  },
  "category" : [{
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/substance-category",
      "code" : "drug",
      "display" : "Drug or Medicament"
    }]
  }],
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "395814003",
      "display" : "Oxaliplatin (substance)"
    }]
  }
}

```
