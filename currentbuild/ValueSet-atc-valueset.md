# ATC Kodesystem ValueSet - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **ATC Kodesystem ValueSet**

## ValueSet: ATC Kodesystem ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://fhir.no/ValueSet/atc-valueset** | *Version*:1.0.7** |
| Active as of 2025-09-12 | *Computable Name*:ATCValueSet |

 
ValueSet som inneholder koder fra WHO ATC (Anatomisk Terapeutisk Kjemisk legemiddelregister) 

 **References** 

* [Legemiddel Classification](StructureDefinition-legemiddel-classification.md)

### Logical Definition (CLD)

* Include all codes defined in [`http://www.whocc.no/atc`](http://www.whocc.no/atc)version Not Stated (use latest from terminology server)

 

### Expansion

Expansion from tx.fhir.org based on codesystem WHO ATC version 2025

This value set has 6,897 codes in it. In order to keep the publication size manageable, only a selection (1,000 codes) of the whole set of codes is shown.

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
  "id" : "atc-valueset",
  "url" : "http://fhir.no/ValueSet/atc-valueset",
  "version" : "1.0.7",
  "name" : "ATCValueSet",
  "title" : "ATC Kodesystem ValueSet",
  "status" : "active",
  "date" : "2025-09-12",
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
  "description" : "ValueSet som inneholder koder fra WHO ATC (Anatomisk Terapeutisk Kjemisk legemiddelregister)",
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
        "system" : "http://www.whocc.no/atc"
      }
    ]
  }
}

```
