# Sykehjem-Minimum-Paracetamol-Merkevare - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Sykehjem-Minimum-Paracetamol-Merkevare**

## Example Medication: Sykehjem-Minimum-Paracetamol-Merkevare



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Sykehjem-Minimum-Paracetamol-Merkevare",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
  },
  "code" : {
    "coding" : [{
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare",
      "code" : "2ABAC272-0BCF-43F0-84BE-984074D92E15",
      "display" : "Paracet tab 500 mg"
    }]
  }
}

```
