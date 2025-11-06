# Kommunenummer ValueSet - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Kommunenummer ValueSet**

## ValueSet: Kommunenummer ValueSet 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/ValueSet/kommunenummer-alle** | *Version*:1.0.7** |
| Active as of 2025-11-06 | *Computable Name*:KommunenummerValueSet |

 
Komplett kodeverk for norske kommunenummer (Volven 3402) 

 **References** 

This value set is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

### Logical Definition (CLD)

* Include all codes defined in [`urn:oid:2.16.578.1.12.4.1.1.3402`](CodeSystem-kommunenummer-codesystem.md)version Not Stated (use latest from terminology server)

 

### Expansion

No Expansion for this valueset (not supported by Publication Tooling)

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
  "id" : "kommunenummer-alle",
  "url" : "http://hl7.no/fhir/ig/lmdi/ValueSet/kommunenummer-alle",
  "version" : "1.0.7",
  "name" : "KommunenummerValueSet",
  "title" : "Kommunenummer ValueSet",
  "status" : "active",
  "date" : "2025-11-06T09:59:39+00:00",
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
  "description" : "Komplett kodeverk for norske kommunenummer (Volven 3402)",
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
        "system" : "urn:oid:2.16.578.1.12.4.1.1.3402"
      }
    ]
  }
}

```
