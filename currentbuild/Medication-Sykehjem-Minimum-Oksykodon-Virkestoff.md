# Sykehjem-Minimum-Oksykodon-Virkestoff - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Sykehjem-Minimum-Oksykodon-Virkestoff**

## Example Medication: Sykehjem-Minimum-Oksykodon-Virkestoff



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Sykehjem-Minimum-Oksykodon-Virkestoff",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
  },
  "code" : {
    "coding" : [{
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff",
      "code" : "C31AF94A-5D5A-4C91-9B99-BB221E26E4C9",
      "display" : "Oksykodon"
    }]
  }
}

```
