# Legemiddel-MorfinKonsentrat - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.3

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Legemiddel-MorfinKonsentrat**

## Example Medication: Legemiddel-MorfinKonsentrat



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Legemiddel-MorfinKonsentrat",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
  },
  "extension" : [{
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.whocc.no/atc",
        "code" : "N02AA01",
        "display" : "Morfin"
      }]
    }
  }],
  "code" : {
    "coding" : [{
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare",
      "code" : "ID_1767DDFA-C248-4814-8EE8-A0C6D09E11BF",
      "display" : "Morfin NAF inj, oppl 40 mg/ml"
    }]
  }
}

```
