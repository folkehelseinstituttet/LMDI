# NPR Episode Identifier - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

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
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/npr-episode-identifier **  | *Version*:1.1.0 **  |
| Active as of 2026-04-07 | *Computable Name*:NprEpisodeIdentifier |

Unik identifikator for episoden, som brukt i rapportering til Norsk pasientregister (NPR). Extensionen kan bære både string-basert og UUID-basert representasjon av den valgte NPR-identifikatoren. Hvis det er registrert flere NPR-identifiere for samme episode lokalt, skal kun én NPR-identifikator angis ved innsending til Legemiddelregisteret (LMR). Velg enten den første eller den lokalt foretrukne identifikatoren.

**Context of Use**

This extension may be used on the following element(s):

* Element ID Encounter

**Usage info**

**Usages:**

* Use this Extension: [Episode](StructureDefinition-lmdi-encounter.md)
* Examples for this Extension: [Encounter/Episode-Sykehus](Encounter-Episode-Sykehus.md)

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
  "version" : "1.1.0",
  "name" : "NprEpisodeIdentifier",
  "title" : "NPR Episode Identifier",
  "status" : "active",
  "date" : "2026-04-07T14:17:15+00:00",
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
  "description" : "Unik identifikator for episoden, som brukt i rapportering til Norsk pasientregister (NPR). Extensionen kan bære både string-basert og UUID-basert representasjon av den valgte NPR-identifikatoren. Hvis det er registrert flere NPR-identifiere for samme episode lokalt, skal kun én NPR-identifikator angis ved innsending til Legemiddelregisteret (LMR). Velg enten den første eller den lokalt foretrukne identifikatoren.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "NO",
      "display" : "Norway"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Encounter"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "NPR Episode Identifier",
      "definition" : "Unik identifikator for episoden, som brukt i rapportering til Norsk pasientregister (NPR). Extensionen kan bære både string-basert og UUID-basert representasjon av den valgte NPR-identifikatoren. Hvis det er registrert flere NPR-identifiere for samme episode lokalt, skal kun én NPR-identifikator angis ved innsending til Legemiddelregisteret (LMR). Velg enten den første eller den lokalt foretrukne identifikatoren.",
      "constraint" : [{
        "key" : "npr-episode-at-least-one",
        "severity" : "error",
        "human" : "Minst én NPR episode identifikator (string eller UUID) må oppgis",
        "expression" : "extension('stringIdentifier').exists() or extension('uuidIdentifier').exists()",
        "source" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/npr-episode-identifier"
      }]
    },
    {
      "id" : "Extension.extension:stringIdentifier",
      "path" : "Extension.extension",
      "sliceName" : "stringIdentifier",
      "short" : "String-representasjon av NPR episodeidentifikatoren",
      "definition" : "String-representasjon av den valgte NPR episodeidentifikatoren. Skal oppgis dersom string-representasjonen av identifikatoren er tilgjengelig.",
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
      "type" : [{
        "code" : "string"
      }]
    },
    {
      "id" : "Extension.extension:uuidIdentifier",
      "path" : "Extension.extension",
      "sliceName" : "uuidIdentifier",
      "short" : "UUID-representasjon av NPR episodeidentifikatoren",
      "definition" : "UUID-representasjon av den valgte NPR episodeidentifikatoren. Skal oppgis dersom UUID-representasjonen av identifikatoren er tilgjengelig.",
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
      "type" : [{
        "code" : "uuid"
      }]
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
    }]
  }
}

```
