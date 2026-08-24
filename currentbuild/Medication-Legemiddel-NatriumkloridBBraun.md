# Legemiddel-NatriumkloridBBraun - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.4

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Legemiddel-NatriumkloridBBraun**

## Example Medication: Legemiddel-NatriumkloridBBraun



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Legemiddel-NatriumkloridBBraun",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
  },
  "extension" : [{
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.whocc.no/atc",
        "code" : "V07AB",
        "display" : "Oppløsnings- og fortynningsvæsker, inkl. skyllemidler"
      }]
    }
  }],
  "code" : {
    "coding" : [{
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare",
      "code" : "ID_42240226-8225-468C-AB0A-9FD27AA67D44",
      "display" : "Natriumklorid B. Braun oppl væske til parenteral bruk 9 mg/ml"
    }]
  }
}

```
