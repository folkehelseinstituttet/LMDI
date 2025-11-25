# Episode - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Episode**

## Resource Profile: Episode 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter** | *Version*:1.0.7** |
| Draft as of 2025-11-25 | *Computable Name*:Episode |

 
Profil for en behandlingsepisode basert på Encounter-ressursen i FHIR. Denne profilen representerer et klinisk møte eller en behandling i helsevesenet, med fokus på organisatorisk tilhørighet. 

**Usages:**

* Refer to this Profile: [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md) and [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.no.lmdi|current/StructureDefinition/lmdi-encounter)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-encounter.csv), [Excel](StructureDefinition-lmdi-encounter.xlsx), [Schematron](StructureDefinition-lmdi-encounter.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-encounter",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter",
  "version" : "1.0.7",
  "name" : "Episode",
  "title" : "Episode",
  "status" : "draft",
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
  "description" : "Profil for en behandlingsepisode basert på Encounter-ressursen i FHIR. Denne profilen representerer et klinisk møte eller en behandling i helsevesenet, med fokus på organisatorisk tilhørighet.",
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
  "fhirVersion" : "4.0.1",
  "mapping" : [
    {
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
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Encounter",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Encounter",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
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
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "Encounter.extension:nprEpisodeIdentifier",
        "path" : "Encounter.extension",
        "sliceName" : "nprEpisodeIdentifier",
        "short" : "Unik identifikator(er) for episoden, som brukes ved rapportering til NPR",
        "definition" : "En eller flere unike identifikatorer (string og/eller UUID) som identifiserer episoden entydig i helseinstitusjonens systemer. Brukes ved rapportering til Norsk pasientregister (NPR). Kan inneholde både string-basert og UUID-basert identifikator samtidig.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://hl7.no/fhir/ig/lmdi/StructureDefinition/npr-episode-identifier"
            ]
          }
        ],
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
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"
            ]
          }
        ]
      },
      {
        "id" : "Encounter.partOf",
        "path" : "Encounter.partOf",
        "max" : "0"
      }
    ]
  }
}

```
