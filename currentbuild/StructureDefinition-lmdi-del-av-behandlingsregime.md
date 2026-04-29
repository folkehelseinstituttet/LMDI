# Del av behandlingsregime - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

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
* **Del av behandlingsregime**

## Extension: Del av behandlingsregime 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-del-av-behandlingsregime **  | *Version*:1.1.0 **  |
| Active as of 2026-04-29 | *Computable Name*:DelAvBehandlingsregime |

Navnet på kuren, behandlingsregimet eller protokollen legemidlet gis som en del av. Spesielt relevant ved kjemoterapi.

**Context of Use**

This extension may be used on the following element(s):

* Element ID MedicationRequest

**Usage info**

**Usages:**

* Use this Extension: [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)
* Examples for this Extension: [Bundle/Bundle-Scenario-Sykehjem-Oksykodon](Bundle-Bundle-Scenario-Sykehjem-Oksykodon.md), [MedicationRequest/Rekvirering-Cellegift](MedicationRequest-Rekvirering-Cellegift.md) and [MedicationRequest/Rekvirering-Kjemoterapi](MedicationRequest-Rekvirering-Kjemoterapi.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.no.lmdi|current/StructureDefinition/lmdi-del-av-behandlingsregime)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-del-av-behandlingsregime.csv), [Excel](StructureDefinition-lmdi-del-av-behandlingsregime.xlsx), [Schematron](StructureDefinition-lmdi-del-av-behandlingsregime.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-del-av-behandlingsregime",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-del-av-behandlingsregime",
  "version" : "1.1.0",
  "name" : "DelAvBehandlingsregime",
  "title" : "Del av behandlingsregime",
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
  "description" : "Navnet på kuren, behandlingsregimet eller protokollen legemidlet gis som en del av. Spesielt relevant ved kjemoterapi.",
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
    "expression" : "MedicationRequest"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Del av behandlingsregime",
      "definition" : "Navnet på kuren, behandlingsregimet eller protokollen legemidlet gis som en del av. Spesielt relevant ved kjemoterapi."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-del-av-behandlingsregime"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "type" : [{
        "code" : "string"
      }]
    }]
  }
}

```
