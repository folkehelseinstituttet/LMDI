# Virkestoff-Natriumklorid - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.3

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Virkestoff-Natriumklorid**

## Example Substance: Virkestoff-Natriumklorid



## Resource Content

```json
{
  "resourceType" : "Substance",
  "id" : "Virkestoff-Natriumklorid",
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
      "code" : "387390002",
      "display" : "Sodium chloride (substance)"
    }]
  }
}

```
