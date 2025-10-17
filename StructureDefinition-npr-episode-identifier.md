# NPR Episode Identifier - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **NPR Episode Identifier**

## Extension: NPR Episode Identifier 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/npr-episode-identifier** | *Version*:1.0.7** |
| Active as of 2025-10-17 | *Computable Name*:NprEpisodeIdentifier |

Entydig identifikator for episode, brukt ved rapportering til NPR. Kan inneholde både string-basert og UUID-basert identifikator.

**Context of Use**

This extension may be used on the following element(s):

* Element ID Encounter

**Usage info**

**Usages:**

* Use this Extension: [Episode](StructureDefinition-lmdi-encounter.md)
* Examples for this Extension: [Bundle/LegemiddelregisterBundle-1](Bundle-LegemiddelregisterBundle-1.md) and [MedicationAdministration/Administrering-10](MedicationAdministration-Administrering-10.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.no.lmdi|current/StructureDefinition/npr-episode-identifier)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-npr-episode-identifier.csv), [Excel](StructureDefinition-npr-episode-identifier.xlsx), [Schematron](StructureDefinition-npr-episode-identifier.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "npr-episode-identifier",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/npr-episode-identifier",
  "version" : "1.0.7",
  "name" : "NprEpisodeIdentifier",
  "title" : "NPR Episode Identifier",
  "status" : "active",
  "date" : "2025-10-17T18:23:46+00:00",
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
  "description" : "Entydig identifikator for episode, brukt ved rapportering til NPR. Kan inneholde både string-basert og UUID-basert identifikator.",
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
      "identity" : "rim",
      "uri" : "http://hl7.org/v3",
      "name" : "RIM Mapping"
    }
  ],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [
    {
      "type" : "element",
      "expression" : "Encounter"
    }
  ],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Extension",
        "path" : "Extension",
        "short" : "NPR Episode Identifier",
        "definition" : "Entydig identifikator for episode, brukt ved rapportering til NPR. Kan inneholde både string-basert og UUID-basert identifikator.",
        "constraint" : [
          {
            "key" : "npr-episode-at-least-one",
            "severity" : "error",
            "human" : "Minst én NPR episode identifikator (string eller UUID) må oppgis",
            "expression" : "extension('stringIdentifier').exists() or extension('uuidIdentifier').exists()",
            "source" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/npr-episode-identifier"
          }
        ]
      },
      {
        "id" : "Extension.extension:stringIdentifier",
        "path" : "Extension.extension",
        "sliceName" : "stringIdentifier",
        "short" : "String-basert NPR episode identifikator",
        "definition" : "String-basert identifikator for episoden som brukes ved rapportering til NPR.",
        "min" : 0,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Extension.extension:stringIdentifier.extension",
        "path" : "Extension.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.extension:stringIdentifier.url",
        "path" : "Extension.extension.url",
        "fixedUri" : "stringIdentifier"
      },
      {
        "id" : "Extension.extension:stringIdentifier.value[x]",
        "path" : "Extension.extension.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "string"
          }
        ]
      },
      {
        "id" : "Extension.extension:uuidIdentifier",
        "path" : "Extension.extension",
        "sliceName" : "uuidIdentifier",
        "short" : "UUID-basert NPR episode identifikator",
        "definition" : "UUID-basert identifikator for episoden som brukes ved rapportering til NPR.",
        "min" : 0,
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Extension.extension:uuidIdentifier.extension",
        "path" : "Extension.extension.extension",
        "max" : "0"
      },
      {
        "id" : "Extension.extension:uuidIdentifier.url",
        "path" : "Extension.extension.url",
        "fixedUri" : "uuidIdentifier"
      },
      {
        "id" : "Extension.extension:uuidIdentifier.value[x]",
        "path" : "Extension.extension.value[x]",
        "min" : 1,
        "type" : [
          {
            "code" : "uuid"
          }
        ]
      },
      {
        "id" : "Extension.url",
        "path" : "Extension.url",
        "fixedUri" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/npr-episode-identifier"
      },
      {
        "id" : "Extension.value[x]",
        "path" : "Extension.value[x]",
        "max" : "0"
      }
    ]
  }
}

```
