# Legemiddel-Scenario-Sykehjem-Oksykodon-FEST-Dose - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Legemiddel-Scenario-Sykehjem-Oksykodon-FEST-Dose**

## Example Medication: Legemiddel-Scenario-Sykehjem-Oksykodon-FEST-Dose



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Legemiddel-Scenario-Sykehjem-Oksykodon-FEST-Dose",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
  },
  "extension" : [{
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.whocc.no/atc",
        "code" : "N02AA05",
        "display" : "Oksykodon"
      }]
    }
  }],
  "code" : {
    "coding" : [{
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelDose",
      "code" : "ID_48BD33D2-2838-4B81-8225-02391B7A4516",
      "display" : "Oxycodone Orifarm mikst oppl 1 mg/ml"
    },
    {
      "system" : "http://snomed.info/sct",
      "code" : "414984009",
      "display" : "Product containing oxycodone (medicinal product)"
    }]
  },
  "form" : {
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.7448",
      "code" : "51",
      "display" : "Mikstur, oppløsning"
    }]
  }
}

```
