# Diagnose - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Diagnose**

## Resource Profile: Diagnose 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition **  | *Version*:1.0.7 **  |
| Draft as of 2025-09-12 | *Computable Name*:Diagnose |

 
Diagnosen som pasienten har fått rekvirert eller administrert legemiddelet for. 

**Usages:**

* Refer to this Profile: [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md) and [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)
* Examples for this Profile: [Condition/Diagnose-1-ICD10-OID](Condition-Diagnose-1-ICD10-OID.md) and [Condition/Diagnose-2-SNOMED-CT](Condition-Diagnose-2-SNOMED-CT.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.no.lmdi|current/StructureDefinition/lmdi-condition)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-condition.csv), [Excel](StructureDefinition-lmdi-condition.xlsx), [Schematron](StructureDefinition-lmdi-condition.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-condition",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition",
  "version" : "1.0.7",
  "name" : "Diagnose",
  "title" : "Diagnose",
  "status" : "draft",
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
  "description" : "Diagnosen som pasienten har fått rekvirert eller administrert legemiddelet for.",
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
      "identity" : "sct-concept",
      "uri" : "http://snomed.info/conceptdomain",
      "name" : "SNOMED CT Concept Domain Binding"
    },
    {
      "identity" : "v2",
      "uri" : "http://hl7.org/v2",
      "name" : "HL7 v2 Mapping"
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
      "identity" : "sct-attr",
      "uri" : "http://snomed.org/attributebinding",
      "name" : "SNOMED CT Attribute Binding"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Condition",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Condition",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Condition",
        "path" : "Condition"
      },
      {
        "id" : "Condition.text",
        "path" : "Condition.text",
        "max" : "0"
      },
      {
        "id" : "Condition.category",
        "path" : "Condition.category",
        "max" : "0"
      },
      {
        "id" : "Condition.severity",
        "path" : "Condition.severity",
        "max" : "0"
      },
      {
        "id" : "Condition.code",
        "path" : "Condition.code",
        "short" : "Diagnosekode.",
        "definition" : "Diagnosekode. Det er mulig å bruke ICD-10, ICD-11, ICPC-2 og SNOMED CT.",
        "min" : 1
      },
      {
        "id" : "Condition.code.coding",
        "path" : "Condition.code.coding",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "pattern",
              "path" : "system"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Condition.code.coding:SCT",
        "path" : "Condition.code.coding",
        "sliceName" : "SCT",
        "short" : "SNOMED CT",
        "definition" : "SNOMED CT er ei systematisk samling av helsefaglege omgrep som kan brukast til å dokumentere og dele opplysningar knytt til pasientbehandlinga. Ved å bruke eit felles omgrepsapparat skal det bli lettare å kommunisere mellom ulike delar av helsetenesta.",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Condition.code.coding:SCT.system",
        "path" : "Condition.code.coding.system",
        "min" : 1,
        "patternUri" : "http://snomed.info/sct"
      },
      {
        "id" : "Condition.code.coding:SCT.code",
        "path" : "Condition.code.coding.code",
        "min" : 1
      },
      {
        "id" : "Condition.code.coding:ICD10",
        "path" : "Condition.code.coding",
        "sliceName" : "ICD10",
        "short" : "ICD-10",
        "definition" : "ICD-10: Den internasjonale statistiske klassifikasjonen av sykdommer og beslektede helseproblemer.",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Condition.code.coding:ICD10.system",
        "path" : "Condition.code.coding.system",
        "min" : 1,
        "patternUri" : "urn:oid:2.16.578.1.12.4.1.1.7110"
      },
      {
        "id" : "Condition.code.coding:ICD10.code",
        "path" : "Condition.code.coding.code",
        "short" : "Diagnosekode fra kodeverket",
        "min" : 1
      },
      {
        "id" : "Condition.code.coding:ICD10.display",
        "path" : "Condition.code.coding.display",
        "short" : "Beskrivelse av diagnosekode (fra kodeverket)"
      },
      {
        "id" : "Condition.code.coding:ICD11",
        "path" : "Condition.code.coding",
        "sliceName" : "ICD11",
        "short" : "ICD-11",
        "definition" : "International Classification of Diseases, 11th Revision Mortality and Morbidity Statistics (MMS).",
        "comment" : "Skal erstattes av navnerom som peker på generell ICD-11, ikke MMS.",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Condition.code.coding:ICD11.system",
        "path" : "Condition.code.coding.system",
        "comment" : "Kilde for URI: https://build.fhir.org/ig/HL7/UTG/CodeSystem-ICD11MMS.html",
        "min" : 1,
        "patternUri" : "http://id.who.int/icd/release/11/mms"
      },
      {
        "id" : "Condition.code.coding:ICD11.code",
        "path" : "Condition.code.coding.code",
        "short" : "Diagnosekode fra kodeverket",
        "min" : 1
      },
      {
        "id" : "Condition.code.coding:ICD11.display",
        "path" : "Condition.code.coding.display",
        "short" : "Beskrivelse av diagnosekode (fra kodeverket)"
      },
      {
        "id" : "Condition.code.coding:ICPC2",
        "path" : "Condition.code.coding",
        "sliceName" : "ICPC2",
        "short" : "ICPC-2",
        "definition" : "ICPC-2 er den internasjonale klassifikasjonen for helseproblemer, diagnoser og andre årsaker til kontakt med primærhelsetjenesten.",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Condition.code.coding:ICPC2.system",
        "path" : "Condition.code.coding.system",
        "min" : 1,
        "patternUri" : "urn:oid:2.16.578.1.12.4.1.1.7170"
      },
      {
        "id" : "Condition.code.coding:ICPC2.code",
        "path" : "Condition.code.coding.code",
        "short" : "Diagnosekode fra kodeverket",
        "min" : 1
      },
      {
        "id" : "Condition.code.coding:ICPC2.display",
        "path" : "Condition.code.coding.display",
        "short" : "Beskrivelse av diagnosekode (fra kodeverket)"
      },
      {
        "id" : "Condition.bodySite",
        "path" : "Condition.bodySite",
        "max" : "0"
      },
      {
        "id" : "Condition.subject",
        "path" : "Condition.subject",
        "short" : "Pasienten diagnosen er knyttet til.",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"
            ]
          }
        ]
      },
      {
        "id" : "Condition.encounter",
        "path" : "Condition.encounter",
        "max" : "0"
      },
      {
        "id" : "Condition.onset[x]",
        "path" : "Condition.onset[x]",
        "max" : "0"
      },
      {
        "id" : "Condition.abatement[x]",
        "path" : "Condition.abatement[x]",
        "max" : "0"
      },
      {
        "id" : "Condition.recordedDate",
        "path" : "Condition.recordedDate",
        "max" : "0"
      },
      {
        "id" : "Condition.recorder",
        "path" : "Condition.recorder",
        "max" : "0"
      },
      {
        "id" : "Condition.asserter",
        "path" : "Condition.asserter",
        "max" : "0"
      },
      {
        "id" : "Condition.stage",
        "path" : "Condition.stage",
        "constraint" : [
          {
            "key" : "con-1",
            "severity" : "warning",
            "human" : "Stage SHALL have summary or assessment",
            "xpath" : "exists(f:summary) or exists(f:assessment)"
          }
        ]
      },
      {
        "id" : "Condition.stage.assessment",
        "path" : "Condition.stage.assessment",
        "max" : "0"
      },
      {
        "id" : "Condition.evidence",
        "path" : "Condition.evidence",
        "max" : "0"
      },
      {
        "id" : "Condition.note",
        "path" : "Condition.note",
        "max" : "0"
      }
    ]
  }
}

```
