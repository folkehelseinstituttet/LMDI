# Organisasjon-3-Sykehus - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Organisasjon-3-Sykehus**

## Example Organization: Organisasjon-3-Sykehus

Profile: [Organisasjon](StructureDefinition-lmdi-organization.md)

**identifier**: `urn:oid:2.16.578.1.12.4.1.4.101`/993467049, `urn:oid:2.16.578.1.12.4.1.4.102`/4001031

**name**: Oslo universitetssykehus HF

**address**: 



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "Organisasjon-3-Sykehus",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"
    ]
  },
  "identifier" : [
    {
      "system" : "urn:oid:2.16.578.1.12.4.1.4.101",
      "value" : "993467049"
    },
    {
      "system" : "urn:oid:2.16.578.1.12.4.1.4.102",
      "value" : "4001031"
    }
  ],
  "name" : "Oslo universitetssykehus HF",
  "address" : [
    {
      "extension" : [
        {
          "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-urban-district",
          "valueCoding" : {
            "system" : "urn:oid:2.16.578.1.12.4.1.1.3403",
            "code" : "01",
            "display" : "Gamle Oslo"
          }
        }
      ],
      "type" : "physical",
      "district" : "Oslo",
      "_district" : {
        "extension" : [
          {
            "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
            "valueCoding" : {
              "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
              "code" : "0301",
              "display" : "Oslo"
            }
          }
        ]
      }
    }
  ]
}

```
