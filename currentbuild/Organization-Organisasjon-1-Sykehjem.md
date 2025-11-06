# Organisasjon-1-Sykehjem - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Organisasjon-1-Sykehjem**

## Example Organization: Organisasjon-1-Sykehjem

Profile: [Organisasjon](StructureDefinition-lmdi-organization.md)

**identifier**: `urn:oid:2.16.578.1.12.4.1.4.101`/1234567890

**name**: Lykkedalen sykehjem

**address**: 



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "Organisasjon-1-Sykehjem",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"
    ]
  },
  "identifier" : [
    {
      "system" : "urn:oid:2.16.578.1.12.4.1.4.101",
      "value" : "1234567890"
    }
  ],
  "name" : "Lykkedalen sykehjem",
  "address" : [
    {
      "type" : "physical",
      "district" : "Sigdal",
      "_district" : {
        "extension" : [
          {
            "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
            "valueCoding" : {
              "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
              "code" : "3025",
              "display" : "Sigdal"
            }
          }
        ]
      }
    }
  ]
}

```
