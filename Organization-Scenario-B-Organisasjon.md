# Scenario-B-Organisasjon - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario-B-Organisasjon**

## Example Organization: Scenario-B-Organisasjon

Profile: [Organisasjon](StructureDefinition-lmdi-organization.md)

**identifier**: `urn:oid:2.16.578.1.12.4.1.4.101`/974557746, `urn:oid:2.16.578.1.12.4.1.4.102`/4204191

**name**: Haukeland universitetssjukehus

**address**: 



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "Scenario-B-Organisasjon",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.101",
    "value" : "974557746"
  },
  {
    "system" : "urn:oid:2.16.578.1.12.4.1.4.102",
    "value" : "4204191"
  }],
  "name" : "Haukeland universitetssjukehus",
  "address" : [{
    "type" : "physical",
    "district" : "Bergen",
    "_district" : {
      "extension" : [{
        "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
        "valueCoding" : {
          "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
          "code" : "4601",
          "display" : "Bergen"
        }
      }]
    }
  }]
}

```
