# Status for legemiddeladministrering - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.2

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Status for legemiddeladministrering**

## ValueSet: Status for legemiddeladministrering 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/ValueSet/lmdi-medicationadministrationstatus **  | *Version*:1.1.2 **  |
| Draft as of 2025-09-12 | *Computable Name*:LegemiddeladministreringStatus |

 
Verdisett som begrenses status til Legemiddeladministrering til henholdsvis ‘Gjennomført’ eller ‘Feilregistrert’. 

 **References** 

* [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md)

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
  "id" : "lmdi-medicationadministrationstatus",
  "url" : "http://hl7.no/fhir/ig/lmdi/ValueSet/lmdi-medicationadministrationstatus",
  "version" : "1.1.2",
  "name" : "LegemiddeladministreringStatus",
  "title" : "Status for legemiddeladministrering",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Medication administration status"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "date" : "2025-09-12",
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
  "description" : "Verdisett som begrenses status til Legemiddeladministrering til henholdsvis 'Gjennomført' eller 'Feilregistrert'.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Value set that restricts the status of medication administration to 'completed' or 'entered-in-error'."
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "NO",
      "display" : "Norway"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/medication-admin-status",
      "concept" : [{
        "code" : "completed",
        "display" : "Gjennomført"
      },
      {
        "code" : "entered-in-error",
        "display" : "Feilregistrert"
      }]
    }]
  }
}

```
