# lmdi-lokaltLegemiddel - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **lmdi-lokaltLegemiddel**

## NamingSystem: lmdi-lokaltLegemiddel 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/NamingSystem/lmdi-lokaltLegemiddel** | *Version*:1.0.7** |
| Draft as of 2024-06-10 | *Computable Name*:lmdiLokaltLegemiddel |

 
Id for angivelse av legemiddel fra lokal legemiddelkatalog 

### Summary

| | |
| :--- | :--- |
| Defining URL | http://hl7.no/fhir/ig/lmdi/NamingSystem/lmdi-lokaltLegemiddel |
| Version | 1.0.7 |
| Name | lmdiLokaltLegemiddel |
| Status | draft |
| Definition | Id for angivelse av legemiddel fra lokal legemiddelkatalog |
| Publisher | Folkehelseinstituttet |

### Identifiers

* **Type**: URI
  * **Value**: http://fh.no/fhir/NamingSystem/lokaltVirkemiddel
  * **Preferred**: true



## Resource Content

```json
{
  "resourceType" : "NamingSystem",
  "id" : "lmdi-lokaltLegemiddel",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.url",
      "valueUri" : "http://hl7.no/fhir/ig/lmdi/NamingSystem/lmdi-lokaltLegemiddel"
    },
    {
      "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.version",
      "valueString" : "1.0.7"
    }
  ],
  "name" : "lmdiLokaltLegemiddel",
  "status" : "draft",
  "kind" : "identifier",
  "date" : "2024-06-10",
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
  "responsible" : "Folkehelseinstituttet",
  "description" : "Id for angivelse av legemiddel fra lokal legemiddelkatalog",
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
  "uniqueId" : [
    {
      "type" : "uri",
      "value" : "http://fh.no/fhir/NamingSystem/lokaltVirkemiddel",
      "preferred" : true
    }
  ]
}

```
