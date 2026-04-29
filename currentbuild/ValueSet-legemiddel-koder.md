# Gyldige legemiddelkoder - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [Home](en-index.md)
* [Information Model](en-informasjonsmodell.md)
* [Integration](en-integrasjon.md) 
* [Protocol](en-protokoll.md)
* [SignedEncryptedBundle](en-SignertKryptertBundle.md)
* [C# Example Code](en-eksempelkode_cs.md)
* [PowerShell Example Code](en-eksempelkode_ps1.md)
 
* [FHIR Profiles](en-profiler.md)
* [Downloads](en-nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Gyldige legemiddelkoder**

## ValueSet: Gyldige legemiddelkoder 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/ValueSet/legemiddel-koder **  | *Version*:1.1.0 **  |
| Active as of 2026-04-29 | *Computable Name*:LegemiddelKoder |

 
ValueSet som inneholder koder fra SNOMED CT, FEST, LMR-nummer, varenummer og lokal legemiddelkatalog 

 **References** 

* [Legemiddel](StructureDefinition-lmdi-medication.md)

### Logical Definition (CLD)

 

### Expansion

This value set cannot be expanded because of the way it is defined - it has an infinite number of members

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
  "id" : "legemiddel-koder",
  "url" : "http://hl7.no/fhir/ig/lmdi/ValueSet/legemiddel-koder",
  "version" : "1.1.0",
  "name" : "LegemiddelKoder",
  "title" : "Gyldige legemiddelkoder",
  "status" : "active",
  "date" : "2026-04-29T19:26:05+00:00",
  "publisher" : "Folkehelseinstituttet",
  "contact" : [{
    "name" : "Folkehelseinstituttet",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.fhi.no"
    }]
  },
  {
    "name" : "Legemiddelregisteret",
    "telecom" : [{
      "system" : "email",
      "value" : "legemiddelregisteret@fhi.no"
    }]
  }],
  "description" : "ValueSet som inneholder koder fra SNOMED CT, FEST, LMR-nummer, varenummer og lokal legemiddelkatalog",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "NO",
      "display" : "Norway"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct"
    },
    {
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare"
    },
    {
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff"
    },
    {
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning"
    },
    {
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelDose"
    },
    {
      "system" : "http://dmp.no/fhir/NamingSystem/lmrLopenummer"
    },
    {
      "system" : "http://dmp.no/fhir/NamingSystem/fest-varenummer"
    },
    {
      "system" : "http://fhi.no/fhir/NamingSystem/lokaltLegemiddel"
    }]
  }
}

```
