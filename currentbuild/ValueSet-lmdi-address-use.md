# LMDI Address Use - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **LMDI Address Use**

## ValueSet: LMDI Address Use 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/ValueSet/lmdi-address-use** | *Version*:1.0.7** |
| Active as of 2025-11-25 | *Computable Name*:LmdiAddressUse |

 
Tillatte verdier for address.use i LMDI: home, temp, old 

 **References** 

* [Pasient](StructureDefinition-lmdi-patient.md)

### Logical Definition (CLD)

 

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
  "id" : "lmdi-address-use",
  "url" : "http://hl7.no/fhir/ig/lmdi/ValueSet/lmdi-address-use",
  "version" : "1.0.7",
  "name" : "LmdiAddressUse",
  "title" : "LMDI Address Use",
  "status" : "active",
  "date" : "2025-11-25T12:26:13+00:00",
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
  "description" : "Tillatte verdier for address.use i LMDI: home, temp, old",
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
        "system" : "http://hl7.org/fhir/address-use",
        "concept" : [
          {
            "code" : "home"
          },
          {
            "code" : "temp"
          },
          {
            "code" : "old"
          }
        ]
      }
    ]
  }
}

```
