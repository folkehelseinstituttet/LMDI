# Lokal Legemiddelkatalog Values - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Lokal Legemiddelkatalog Values**

## ValueSet: Lokal Legemiddelkatalog Values 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/ValueSet/LokalLegemiddelkatalogValues** | *Version*:1.0.7** |
| Draft as of 2025-11-24 | *Computable Name*:LokalLegemiddelkatalogValues |

 
Gyldige verdier for medlemskapsstatus 

 **References** 

This value set is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

### Logical Definition (CLD)

* Include all codes defined in [`http://hl7.no/fhir/ig/lmdi/CodeSystem/LokalLegemiddelkatalogCodeSystem`](CodeSystem-LokalLegemiddelkatalogCodeSystem.md)version 📦1.0.7

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "LokalLegemiddelkatalogValues",
  "url" : "http://hl7.no/fhir/ig/lmdi/ValueSet/LokalLegemiddelkatalogValues",
  "version" : "1.0.7",
  "name" : "LokalLegemiddelkatalogValues",
  "title" : "Lokal Legemiddelkatalog Values",
  "status" : "draft",
  "date" : "2025-11-24T09:13:45+00:00",
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
  "description" : "Gyldige verdier for medlemskapsstatus",
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
  "compose" : {
    "include" : [
      {
        "system" : "http://hl7.no/fhir/ig/lmdi/CodeSystem/LokalLegemiddelkatalogCodeSystem"
      }
    ]
  }
}

```
