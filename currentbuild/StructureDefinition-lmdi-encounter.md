# Episode - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.1

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Episode**

## Resource Profile: Episode 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter **  | *Version*:1.1.1 **  |
| Active as of 2026-05-31 | *Computable Name*:Episode |

 
En behandlingsepisode som representerer et klinisk møte, konsultasjon, innleggelse eller en behandling i helsevesenet, med fokus på organisatorisk tilhørighet. 

**Usages:**

* Refer to this Profile: [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md) and [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)
* Examples for this Profile: [Encounter/Episode-Sykehjem](Encounter-Episode-Sykehjem.md), [Encounter/Episode-Sykehus-2](Encounter-Episode-Sykehus-2.md) and [Encounter/Episode-Sykehus](Encounter-Episode-Sykehus.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/hl7.fhir.no.lmdi|current/StructureDefinition/StructureDefinition-lmdi-encounter.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-encounter.csv), [Excel](StructureDefinition-lmdi-encounter.xlsx), [Schematron](StructureDefinition-lmdi-encounter.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-encounter",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter",
  "version" : "1.1.1",
  "name" : "Episode",
  "title" : "Episode",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Episode"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "active",
  "date" : "2026-05-31T19:21:18+00:00",
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
  "description" : "En behandlingsepisode som representerer et klinisk møte, konsultasjon, innleggelse eller en behandling i helsevesenet, med fokus på organisatorisk tilhørighet.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Profile for a care episode based on the FHIR Encounter resource. This profile represents a clinical encounter or treatment in health care, with a focus on organizational affiliation."
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
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Encounter",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Encounter",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Encounter",
      "path" : "Encounter"
    },
    {
      "id" : "Encounter.text",
      "path" : "Encounter.text",
      "max" : "0"
    },
    {
      "id" : "Encounter.extension",
      "path" : "Encounter.extension",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "ordered" : false,
        "rules" : "open"
      }
    },
    {
      "id" : "Encounter.extension:nprEpisodeIdentifier",
      "path" : "Encounter.extension",
      "sliceName" : "nprEpisodeIdentifier",
      "short" : "Unik identifikator for episoden, som brukt i rapportering til Norsk pasientregister (NPR).",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Unique identifier for the episode, as used in reporting to the Norwegian Patient Registry (NPR)."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Unik identifikator for episoden, som brukt i rapportering til Norsk pasientregister (NPR). Hvis det er registrert flere NPR-identifiere for samme episode lokalt, skal kun én NPR-identifikator angis ved innsending til Legemiddelregisteret (LMR). Velg enten den første eller den lokalt foretrukne identifikatoren. Den valgte identifikatoren skal oppgis med sin string-representasjon og/eller UUID-representasjon, dersom begge er tilgjengelige oppgis begge.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Unique identifier for the episode, as used in reporting to the Norwegian Patient Registry (NPR). If multiple NPR identifiers are registered locally for the same episode, only one NPR identifier shall be submitted to Legemiddelregisteret (LMR). Choose either the first or the locally preferred identifier. The selected identifier shall be provided using its string representation and/or UUID representation; if both are available, provide both."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/npr-episode-identifier"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Encounter.statusHistory",
      "path" : "Encounter.statusHistory",
      "max" : "0"
    },
    {
      "id" : "Encounter.classHistory",
      "path" : "Encounter.classHistory",
      "max" : "0"
    },
    {
      "id" : "Encounter.type",
      "path" : "Encounter.type",
      "max" : "0"
    },
    {
      "id" : "Encounter.serviceType",
      "path" : "Encounter.serviceType",
      "max" : "0"
    },
    {
      "id" : "Encounter.priority",
      "path" : "Encounter.priority",
      "max" : "0"
    },
    {
      "id" : "Encounter.subject",
      "path" : "Encounter.subject",
      "max" : "0"
    },
    {
      "id" : "Encounter.episodeOfCare",
      "path" : "Encounter.episodeOfCare",
      "max" : "0"
    },
    {
      "id" : "Encounter.basedOn",
      "path" : "Encounter.basedOn",
      "max" : "0"
    },
    {
      "id" : "Encounter.participant",
      "path" : "Encounter.participant",
      "max" : "0"
    },
    {
      "id" : "Encounter.appointment",
      "path" : "Encounter.appointment",
      "max" : "0"
    },
    {
      "id" : "Encounter.period",
      "path" : "Encounter.period",
      "max" : "0"
    },
    {
      "id" : "Encounter.length",
      "path" : "Encounter.length",
      "max" : "0"
    },
    {
      "id" : "Encounter.reasonCode",
      "path" : "Encounter.reasonCode",
      "max" : "0"
    },
    {
      "id" : "Encounter.reasonReference",
      "path" : "Encounter.reasonReference",
      "max" : "0"
    },
    {
      "id" : "Encounter.diagnosis",
      "path" : "Encounter.diagnosis",
      "max" : "0"
    },
    {
      "id" : "Encounter.account",
      "path" : "Encounter.account",
      "max" : "0"
    },
    {
      "id" : "Encounter.hospitalization",
      "path" : "Encounter.hospitalization",
      "max" : "0"
    },
    {
      "id" : "Encounter.location",
      "path" : "Encounter.location",
      "max" : "0"
    },
    {
      "id" : "Encounter.serviceProvider",
      "path" : "Encounter.serviceProvider",
      "short" : "Sted for episoden",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Location of the episode"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
      }]
    },
    {
      "id" : "Encounter.partOf",
      "path" : "Encounter.partOf",
      "max" : "0"
    }]
  }
}

```
