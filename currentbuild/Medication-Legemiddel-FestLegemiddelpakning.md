# Legemiddel-FestLegemiddelpakning - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Legemiddel-FestLegemiddelpakning**

## Example Medication: Legemiddel-FestLegemiddelpakning



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Legemiddel-FestLegemiddelpakning",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
  },
  "extension" : [{
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.whocc.no/atc",
        "code" : "C01DA14",
        "display" : "isosorbide mononitrate"
      }]
    }
  }],
  "code" : {
    "coding" : [{
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning",
      "code" : "ID_40EB7069-EFEC-41C9-8CEF-7D21BD18539C",
      "display" : "Monoket retard depottab 50 mg"
    }]
  },
  "form" : {
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.7448",
      "code" : "25",
      "display" : "Depottablett"
    }]
  }
}

```
