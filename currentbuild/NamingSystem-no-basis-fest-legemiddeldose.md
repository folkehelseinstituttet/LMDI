# no-basis-fest-legemiddeldose - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **no-basis-fest-legemiddeldose**

## NamingSystem: no-basis-fest-legemiddeldose 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/NamingSystem/no-basis-fest-legemiddeldose** | *Version*:1.0.7** |
| Draft as of 2024-06-10 | *Computable Name*:festLegemiddelDose |

 
FEST-id for dose. Rekvirering av en bestemt merkevare med ID (LMR-nummer) som representerer minste plukkbare enhet, f.eks. 1 ampulle eller 1 tablett. 

### Summary

| | |
| :--- | :--- |
| Defining URL | http://hl7.no/fhir/ig/lmdi/NamingSystem/no-basis-fest-legemiddeldose |
| Version | 1.0.7 |
| Name | festLegemiddelDose |
| Status | draft |
| Definition | FEST-id for dose. Rekvirering av en bestemt merkevare med ID (LMR-nummer) som representerer minste plukkbare enhet, f.eks. 1 ampulle eller 1 tablett. |
| Publisher | Folkehelseinstituttet |

### Identifiers

* **Type**: URI
  * **Value**: http://dmp.no/fhir/NamingSystem/festLegemiddelDose
  * **Preferred**: true



## Resource Content

```json
{
  "resourceType" : "NamingSystem",
  "id" : "no-basis-fest-legemiddeldose",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.url",
      "valueUri" : "http://hl7.no/fhir/ig/lmdi/NamingSystem/no-basis-fest-legemiddeldose"
    },
    {
      "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.version",
      "valueString" : "1.0.7"
    }
  ],
  "name" : "festLegemiddelDose",
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
  "description" : "FEST-id for dose. Rekvirering av en bestemt merkevare med ID (LMR-nummer) som representerer minste plukkbare enhet, f.eks. 1 ampulle eller 1 tablett.",
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
      "value" : "http://dmp.no/fhir/NamingSystem/festLegemiddelDose",
      "preferred" : true
    }
  ]
}

```
