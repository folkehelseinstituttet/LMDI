# Scenario-A-Org-Sykehjem - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario-A-Org-Sykehjem**

## Example Organization: Scenario-A-Org-Sykehjem

Profile: [Organisasjon](StructureDefinition-lmdi-organization.md)

**identifier**: `urn:oid:2.16.578.1.12.4.1.4.101`/987654321

**name**: Soltoppen sykehjem

**address**: 

**partOf**: [Organization Drammen kommune](Organization-Scenario-A-Org-Kommune.md)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "Scenario-A-Org-Sykehjem",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.101",
    "value" : "987654321"
  }],
  "name" : "Soltoppen sykehjem",
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
  }],
  "partOf" : {
    "reference" : "Organization/Scenario-A-Org-Kommune"
  }
}

```
