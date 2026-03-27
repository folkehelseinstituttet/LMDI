# Organisasjon-Kommune - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Organisasjon-Kommune**

## Example Organization: Organisasjon-Kommune



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "Organisasjon-Kommune",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.101",
    "value" : "942110464"
  }],
  "name" : "TRONDHEIM KOMMUNE",
  "address" : [{
    "type" : "physical",
    "district" : "Trondheim",
    "_district" : {
      "extension" : [{
        "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
        "valueCoding" : {
          "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
          "code" : "5001",
          "display" : "Trondheim - Tråante"
        }
      }]
    }
  }]
}

```
