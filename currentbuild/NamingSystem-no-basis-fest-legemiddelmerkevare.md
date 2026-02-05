# no-basis-fest-legemiddelmerkevare - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **no-basis-fest-legemiddelmerkevare**

## NamingSystem: no-basis-fest-legemiddelmerkevare 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/NamingSystem/no-basis-fest-legemiddelmerkevare **  | *Version*:1.0.7 **  |
| Draft as of 2024-06-10 | *Computable Name*:festLegemiddelMerkevare |

 
FEST-id for legemiddel merkevare. Rekvirering av en styrke og form av en bestemt merkevare. Pr. 2024 er det ikke lenger ønskelig at det rekvireres på LegemiddelMerkevare. 



## Resource Content

```json
{
  "resourceType" : "NamingSystem",
  "id" : "no-basis-fest-legemiddelmerkevare",
  "extension" : [
    {
      "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.url",
      "valueUri" : "http://hl7.no/fhir/ig/lmdi/NamingSystem/no-basis-fest-legemiddelmerkevare"
    },
    {
      "url" : "http://hl7.org/fhir/5.0/StructureDefinition/extension-NamingSystem.version",
      "valueString" : "1.0.7"
    }
  ],
  "name" : "festLegemiddelMerkevare",
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
  "description" : "FEST-id for legemiddel merkevare. Rekvirering av en styrke og form av en bestemt merkevare. Pr. 2024 er det ikke lenger ønskelig at det rekvireres på LegemiddelMerkevare.",
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
      "value" : "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare",
      "preferred" : true
    }
  ]
}

```
