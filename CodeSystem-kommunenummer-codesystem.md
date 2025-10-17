# Kommunenummer CodeSystem - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Kommunenummer CodeSystem**

## CodeSystem: Kommunenummer CodeSystem 

| | |
| :--- | :--- |
| *Official URL*:urn:oid:2.16.578.1.12.4.1.1.3402** | *Version*:1.0.7** |
| Active as of 2025-10-17 | *Computable Name*:KommunenummerCodeSystem |

 
Kodesystem for norske kommunenummer (Volven 3402) 

 This Code system is referenced in the content logical definition of the following value sets: 

* [KommunenummerValueSet](ValueSet-kommunenummer-alle.md)

This code system `urn:oid:2.16.578.1.12.4.1.1.3402` defines codes, but no codes are represented here



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "kommunenummer-codesystem",
  "url" : "urn:oid:2.16.578.1.12.4.1.1.3402",
  "version" : "1.0.7",
  "name" : "KommunenummerCodeSystem",
  "title" : "Kommunenummer CodeSystem",
  "status" : "active",
  "date" : "2025-10-17T18:45:29+00:00",
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
  "description" : "Kodesystem for norske kommunenummer (Volven 3402)",
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
  "content" : "not-present"
}

```
