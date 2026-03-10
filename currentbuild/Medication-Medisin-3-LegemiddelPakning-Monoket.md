# Medisin-3-LegemiddelPakning-Monoket - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Medisin-3-LegemiddelPakning-Monoket**

## Example Medication: Medisin-3-LegemiddelPakning-Monoket

Profile: [Legemiddel](StructureDefinition-lmdi-medication.md)

**Legemiddel Classification**: isosorbide mononitrate

**identifier**: [festLegemiddelPakning](NamingSystem-no-basis-fest-legemiddelpakning.md)/0003602E-315E-4CDE-9EB0-6756BE9CD120

**code**: Monoket

**form**: Depottablett



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Medisin-3-LegemiddelPakning-Monoket",
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
  "identifier" : [{
    "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning",
    "value" : "0003602E-315E-4CDE-9EB0-6756BE9CD120"
  }],
  "code" : {
    "coding" : [{
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning",
      "code" : "0003602E-315E-4CDE-9EB0-6756BE9CD120",
      "display" : "Monoket"
    }]
  },
  "form" : {
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.7448",
      "code" : "68",
      "display" : "Depottablett"
    }]
  }
}

```
