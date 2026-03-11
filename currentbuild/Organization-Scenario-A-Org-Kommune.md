# Scenario-A-Org-Kommune - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario-A-Org-Kommune**

## Example Organization: Scenario-A-Org-Kommune



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "Scenario-A-Org-Kommune",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.101",
    "value" : "938726027"
  }],
  "name" : "Drammen kommune",
  "address" : [{
    "type" : "physical",
    "district" : "Drammen",
    "_district" : {
      "extension" : [{
        "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
        "valueCoding" : {
          "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
          "code" : "3005",
          "display" : "Drammen"
        }
      }]
    }
  }]
}

```
