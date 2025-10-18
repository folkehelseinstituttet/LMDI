# Legemiddelrekvirering - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Legemiddelrekvirering**

## Resource Profile: Legemiddelrekvirering 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest** | *Version*:1.0.7** |
| Draft as of 2025-09-12 | *Computable Name*:Legemiddelrekvirering |

 
Legemiddelrekvirering - ordinering eller annen rekvirering av legemiddel 

**Usages:**

* Refer to this Profile: [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md) and [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)
* Examples for this Profile: [MedicationRequest/Rekvirering-1](MedicationRequest-Rekvirering-1.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.no.lmdi|current/StructureDefinition/lmdi-medicationrequest)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-medicationrequest.csv), [Excel](StructureDefinition-lmdi-medicationrequest.xlsx), [Schematron](StructureDefinition-lmdi-medicationrequest.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-medicationrequest",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest",
  "version" : "1.0.7",
  "name" : "Legemiddelrekvirering",
  "title" : "Legemiddelrekvirering",
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
  "description" : "Legemiddelrekvirering - ordinering eller annen rekvirering av legemiddel",
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
      "identity" : "script10.6",
      "uri" : "http://ncpdp.org/SCRIPT10_6",
      "name" : "Mapping to NCPDP SCRIPT 10.6"
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
  "type" : "MedicationRequest",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/MedicationRequest",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "MedicationRequest",
        "path" : "MedicationRequest"
      },
      {
        "id" : "MedicationRequest.text",
        "path" : "MedicationRequest.text",
        "max" : "0"
      },
      {
        "id" : "MedicationRequest.extension",
        "path" : "MedicationRequest.extension",
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
        "id" : "MedicationRequest.extension:prosentvisDoseendring",
        "path" : "MedicationRequest.extension",
        "sliceName" : "prosentvisDoseendring",
        "short" : "Doseendring i prosent",
        "definition" : "Doseendring i prosent, sammenlignet med opprinnelig dosering. Spesielt relevant ved kjemoterapi. Kan ha verdier fra 0. Ved vanlig dose uten endring er doseendring 100 (%). Enhet skal være prosent.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-prosentvis-doseendring"
            ]
          }
        ]
      },
      {
        "id" : "MedicationRequest.extension:delAvBehandlingsregime",
        "path" : "MedicationRequest.extension",
        "sliceName" : "delAvBehandlingsregime",
        "short" : "Del av behandlingsregime",
        "definition" : "Navnet på kuren, behandlingsregimet eller protokollen legemidlet gis som en del av. Spesielt relevant ved kjemoterapi.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-del-av-behandlingsregime"
            ]
          }
        ]
      },
      {
        "id" : "MedicationRequest.extension:kliniskStudie",
        "path" : "MedicationRequest.extension",
        "sliceName" : "kliniskStudie",
        "short" : "Legemiddel i klinisk studie",
        "definition" : "Angir om legemidlet gis som en del av en klinisk studie.",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-klinisk-studie"
            ]
          }
        ]
      },
      {
        "id" : "MedicationRequest.identifier",
        "path" : "MedicationRequest.identifier",
        "short" : "Identifikator for rekvisisjon",
        "definition" : "Must Support: En identifikator som unikt identifiserer en rekvirering må oppgis om en slik finnes",
        "mustSupport" : true
      },
      {
        "id" : "MedicationRequest.status",
        "path" : "MedicationRequest.status",
        "short" : "Status for rekvireringen",
        "definition" : "Must Support: Status er viktig for å kunne følge livssyklusen til en rekvisisjon og må støttes av alle systemer",
        "comment" : "Gyldige verdier: active | on-hold | cancelled | completed | entered-in-error | stopped | draft",
        "mustSupport" : true,
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://hl7.org/fhir/ValueSet/medicationrequest-status"
        }
      },
      {
        "id" : "MedicationRequest.intent",
        "path" : "MedicationRequest.intent",
        "short" : "Intensjonen eller hensikten med rekvireringen: proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option",
        "mustSupport" : true
      },
      {
        "id" : "MedicationRequest.reported[x]",
        "path" : "MedicationRequest.reported[x]",
        "type" : [
          {
            "code" : "boolean"
          }
        ]
      },
      {
        "id" : "MedicationRequest.medication[x]",
        "path" : "MedicationRequest.medication[x]",
        "short" : "Legemidlet som er rekvirert",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "MedicationRequest.subject",
        "path" : "MedicationRequest.subject",
        "short" : "Pasienten legemidlet er rekvirert til",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "MedicationRequest.encounter",
        "path" : "MedicationRequest.encounter",
        "short" : "Episoden (f.eks. konsultasjonen/innleggelsen) som legemidlet ble rekvirert i forbindelse med.",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"
            ]
          }
        ]
      },
      {
        "id" : "MedicationRequest.supportingInformation",
        "path" : "MedicationRequest.supportingInformation",
        "max" : "0"
      },
      {
        "id" : "MedicationRequest.requester",
        "path" : "MedicationRequest.requester",
        "short" : "Helsepersonellet som rekvirerte legemidlet",
        "min" : 1,
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-practitioner"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "MedicationRequest.performer",
        "path" : "MedicationRequest.performer",
        "max" : "0"
      },
      {
        "id" : "MedicationRequest.performerType",
        "path" : "MedicationRequest.performerType",
        "max" : "0"
      },
      {
        "id" : "MedicationRequest.recorder",
        "path" : "MedicationRequest.recorder",
        "max" : "0"
      },
      {
        "id" : "MedicationRequest.reasonReference",
        "path" : "MedicationRequest.reasonReference",
        "short" : "Indikasjon (diagnose) for legemiddelrekvireringen",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition"
            ]
          }
        ]
      },
      {
        "id" : "MedicationRequest.basedOn",
        "path" : "MedicationRequest.basedOn",
        "max" : "0"
      },
      {
        "id" : "MedicationRequest.courseOfTherapyType",
        "path" : "MedicationRequest.courseOfTherapyType",
        "short" : "continuous | acute | seasonal"
      },
      {
        "id" : "MedicationRequest.insurance",
        "path" : "MedicationRequest.insurance",
        "max" : "0"
      },
      {
        "id" : "MedicationRequest.note",
        "path" : "MedicationRequest.note",
        "max" : "0"
      },
      {
        "id" : "MedicationRequest.dosageInstruction.text",
        "path" : "MedicationRequest.dosageInstruction.text",
        "max" : "0"
      },
      {
        "id" : "MedicationRequest.dosageInstruction.patientInstruction",
        "path" : "MedicationRequest.dosageInstruction.patientInstruction",
        "max" : "0"
      },
      {
        "id" : "MedicationRequest.dispenseRequest",
        "path" : "MedicationRequest.dispenseRequest",
        "max" : "0"
      },
      {
        "id" : "MedicationRequest.priorPrescription",
        "path" : "MedicationRequest.priorPrescription",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"
            ]
          }
        ]
      },
      {
        "id" : "MedicationRequest.detectedIssue",
        "path" : "MedicationRequest.detectedIssue",
        "max" : "0"
      },
      {
        "id" : "MedicationRequest.eventHistory",
        "path" : "MedicationRequest.eventHistory",
        "max" : "0"
      }
    ]
  }
}

```
