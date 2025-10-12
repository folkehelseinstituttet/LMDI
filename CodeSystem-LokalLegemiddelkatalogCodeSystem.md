# Lokal Legemiddelkatalog Codes - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Lokal Legemiddelkatalog Codes**

## CodeSystem: Lokal Legemiddelkatalog Codes 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/CodeSystem/LokalLegemiddelkatalogCodeSystem** | *Version*:1.0.7** |
| Draft as of 2025-10-12 | *Computable Name*:LokalLegemiddelkatalogCodeSystem |

 
Kodesystem for lokal legemiddelkatalog 

 This Code system is referenced in the content logical definition of the following value sets: 

* [LokalLegemiddelkatalogValues](ValueSet-LokalLegemiddelkatalogValues.md)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "LokalLegemiddelkatalogCodeSystem",
  "url" : "http://hl7.no/fhir/ig/lmdi/CodeSystem/LokalLegemiddelkatalogCodeSystem",
  "version" : "1.0.7",
  "name" : "LokalLegemiddelkatalogCodeSystem",
  "title" : "Lokal Legemiddelkatalog Codes",
  "status" : "draft",
  "date" : "2025-10-12T08:57:38+00:00",
  "publisher" : "Folkehelseinstituttet",
  "contact" : [
    {
      "name" : "Folkehelseinstituttet",
      "telecom" : [
        {
          "system" : "url",
          "value" : "https://www.fhi.no"
        }
      ]
    },
    {
      "name" : "Legemiddelregisteret",
      "telecom" : [
        {
          "system" : "email",
          "value" : "legemiddelregisteret@fhi.no"
        }
      ]
    }
  ],
  "description" : "Kodesystem for lokal legemiddelkatalog",
  "jurisdiction" : [
    {
      "coding" : [
        {
          "system" : "urn:iso:std:iso:3166",
          "code" : "NO",
          "display" : "Norway"
        }
      ]
    }
  ],
  "content" : "complete",
  "count" : 2,
  "concept" : [
    {
      "code" : "metavisionkatalogFraHso",
      "display" : "MetavisionkatalogFraHso",
      "definition" : "Metavisionkatalog fra Helse Sør-Øst"
    },
    {
      "code" : "metavisionkatalogFraHN",
      "display" : "MetavisionkatalogFraHN",
      "definition" : "Metavisionkatalog fra Helse Nord"
    }
  ]
}

```
