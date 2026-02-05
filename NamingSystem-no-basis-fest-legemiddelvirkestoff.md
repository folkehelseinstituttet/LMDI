# no-basis-fest-legemiddelvirkestoff - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **no-basis-fest-legemiddelvirkestoff**

## NamingSystem: no-basis-fest-legemiddelvirkestoff 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/NamingSystem/no-basis-fest-legemiddelvirkestoff **  | *Version*:1.0.7 **  |
| Draft as of 2024-06-10 | *Computable Name*:festLegemiddelVirkestoff |

 
FEST-id for virkestoff. Benyttes ved virkestoffrekvirering 



## Resource Content

```json
{
  "resourceType" : "NamingSystem",
  "id" : "no-basis-fest-legemiddelvirkestoff",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.url",
      "valueUri" : "http://hl7.no/fhir/ig/lmdi/NamingSystem/no-basis-fest-legemiddelvirkestoff"
    },
    {
      "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.version",
      "valueString" : "1.0.7"
    }
  ],
  "name" : "festLegemiddelVirkestoff",
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
  "responsible" : "Direktoratet for medisinske produkter",
  "description" : "FEST-id for virkestoff. Benyttes ved virkestoffrekvirering",
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
      "value" : "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff",
      "preferred" : true
    }
  ]
}

```
