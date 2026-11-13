# Legemiddel-LokaltLegemiddel-AssosiertLegemiddel - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.10

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Legemiddel-LokaltLegemiddel-AssosiertLegemiddel**

## Example Medication: Legemiddel-LokaltLegemiddel-AssosiertLegemiddel



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Legemiddel-LokaltLegemiddel-AssosiertLegemiddel",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
  },
  "extension" : [{
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.whocc.no/atc",
        "code" : "N01BB09",
        "display" : "Ropivakain"
      }]
    }
  },
  {
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-assosiert-legemiddel",
    "valueCoding" : {
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelDose",
      "code" : "ID_FC282E2E-26ED-45C7-AF00-86936EFD26B4",
      "display" : "Ropivacain Fresenius Kabi inf, oppl 2 mg/ml"
    }
  },
  {
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-assosiert-legemiddel",
    "valueCoding" : {
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelDose",
      "code" : "ID_869E02D4-F1C5-4892-B5A6-109D5FC3E485",
      "display" : "Ropivacain Fresenius Kabi inf, oppl 2 mg/ml"
    }
  }],
  "code" : {
    "coding" : [{
      "system" : "http://fhi.no/fhir/NamingSystem/lokaltLegemiddel",
      "code" : "ropivakain-2mg-ml-inf",
      "display" : "Ropivakain 2mg/ml Infusjonsvæske"
    }]
  },
  "form" : {
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.7448",
      "code" : "858",
      "display" : "Infusjonsvæske, oppløsning"
    }]
  }
}

```
