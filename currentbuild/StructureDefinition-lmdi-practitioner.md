# Helsepersonell - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.2

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Helsepersonell**

## Resource Profile: Helsepersonell 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-practitioner **  | *Version*:1.1.2 **  |
| Draft as of 2025-09-12 | *Computable Name*:Helsepersonell |

 
Helsepersonell som har rekvirert legemidlet, basert på no-basis-Practitioner. HPR-nummer skal oppgis når tilgjengelig. 

**Usages:**

* Refer to this Profile: [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)
* Examples for this Profile: [Practitioner/Helsepersonell-Med-HPR](Practitioner-Helsepersonell-Med-HPR.md) and [Practitioner/Helsepersonell-Uten-HPR](Practitioner-Helsepersonell-Uten-HPR.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/hl7.fhir.no.lmdi|current/StructureDefinition/StructureDefinition-lmdi-practitioner.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-practitioner.csv), [Excel](StructureDefinition-lmdi-practitioner.xlsx), [Schematron](StructureDefinition-lmdi-practitioner.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-practitioner",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-practitioner",
  "version" : "1.1.2",
  "name" : "Helsepersonell",
  "title" : "Helsepersonell",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Healthcare professional"
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
  "description" : "Helsepersonell som har rekvirert legemidlet, basert på no-basis-Practitioner. HPR-nummer skal oppgis når tilgjengelig.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Healthcare professional who requested the medication, based on no-basis-Practitioner. The HPR number shall be provided when available."
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
  "fhirVersion" : "4.0.1",
  "kind" : "resource",
  "abstract" : false,
  "type" : "Practitioner",
  "baseDefinition" : "http://hl7.no/fhir/StructureDefinition/no-basis-Practitioner",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Practitioner",
      "path" : "Practitioner"
    },
    {
      "id" : "Practitioner.text",
      "path" : "Practitioner.text",
      "max" : "0"
    },
    {
      "id" : "Practitioner.identifier",
      "path" : "Practitioner.identifier",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "rules" : "closed"
      },
      "short" : "Helsepersonellnummer (HPR-nummer)",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Health professional number (HPR number)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Helsepersonellnummer (HPR-nummer) fra Helsepersonellregisteret. Skal registreres når tilgjengelig.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Health professional number (HPR number) from the Health Personnel Register. Shall be recorded when available."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Practitioner.identifier:HPR",
      "path" : "Practitioner.identifier",
      "sliceName" : "HPR",
      "short" : "HPR-nummer",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "HPR number"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Helsepersonellnummer fra Helsepersonellregisteret.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Health professional number from the Health Personnel Register."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Practitioner.identifier:FNR",
      "path" : "Practitioner.identifier",
      "sliceName" : "FNR",
      "max" : "0"
    },
    {
      "id" : "Practitioner.identifier:DNR",
      "path" : "Practitioner.identifier",
      "sliceName" : "DNR",
      "max" : "0"
    },
    {
      "id" : "Practitioner.active",
      "path" : "Practitioner.active",
      "max" : "0"
    },
    {
      "id" : "Practitioner.name",
      "path" : "Practitioner.name",
      "max" : "0"
    },
    {
      "id" : "Practitioner.telecom",
      "path" : "Practitioner.telecom",
      "max" : "0"
    },
    {
      "id" : "Practitioner.address",
      "path" : "Practitioner.address",
      "max" : "0"
    },
    {
      "id" : "Practitioner.gender",
      "path" : "Practitioner.gender",
      "max" : "0"
    },
    {
      "id" : "Practitioner.birthDate",
      "path" : "Practitioner.birthDate",
      "max" : "0"
    },
    {
      "id" : "Practitioner.photo",
      "path" : "Practitioner.photo",
      "max" : "0"
    },
    {
      "id" : "Practitioner.qualification",
      "path" : "Practitioner.qualification",
      "max" : "0"
    },
    {
      "id" : "Practitioner.communication",
      "path" : "Practitioner.communication",
      "max" : "0"
    }]
  }
}

```
