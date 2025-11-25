# Legemiddeladministrering - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Legemiddeladministrering**

## Resource Profile: Legemiddeladministrering 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration** | *Version*:1.0.7** |
| Draft as of 2025-09-12 | *Computable Name*:Legemiddeladministrering |

 
Beskriver administrering av legemiddel til pasient på institusjon. 
Dette er kjerneressursen for denne implementasjonsguiden. Den peker videre legemiddelet som ble gitt, pasienten som har fått administrert legemiddel, på hvilken institusjon det skjedde, tidspunkt for administrering, hvem som utførte den (helsepersonell eller rolle ved institusjon) og dose med eventuell administrasjonsvei. 

**Usages:**

* Examples for this Profile: [MedicationAdministration/Administrering-1-Oralt](MedicationAdministration-Administrering-1-Oralt.md), [MedicationAdministration/Administrering-10](MedicationAdministration-Administrering-10.md) and [MedicationAdministration/Administrering-2-Infusjon](MedicationAdministration-Administrering-2-Infusjon.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.no.lmdi|current/StructureDefinition/lmdi-medicationadministration)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-medicationadministration.csv), [Excel](StructureDefinition-lmdi-medicationadministration.xlsx), [Schematron](StructureDefinition-lmdi-medicationadministration.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-medicationadministration",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration",
  "version" : "1.0.7",
  "name" : "Legemiddeladministrering",
  "title" : "Legemiddeladministrering",
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
  "description" : "Beskriver administrering av legemiddel til pasient på institusjon.\n\nDette er kjerneressursen for denne implementasjonsguiden. Den peker videre legemiddelet som ble gitt, pasienten som har fått administrert legemiddel, på hvilken institusjon det skjedde, tidspunkt for administrering, hvem som utførte den (helsepersonell eller rolle ved institusjon) og dose med eventuell administrasjonsvei.",
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
    },
    {
      "identity" : "w3c.prov",
      "uri" : "http://www.w3.org/ns/prov",
      "name" : "W3C PROV"
    }
  ],
  "kind" : "resource",
  "abstract" : false,
  "type" : "MedicationAdministration",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/MedicationAdministration",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "MedicationAdministration",
        "path" : "MedicationAdministration"
      },
      {
        "id" : "MedicationAdministration.text",
        "path" : "MedicationAdministration.text",
        "max" : "0"
      },
      {
        "id" : "MedicationAdministration.partOf",
        "path" : "MedicationAdministration.partOf",
        "max" : "0"
      },
      {
        "id" : "MedicationAdministration.status",
        "path" : "MedicationAdministration.status",
        "short" : "Status administrering (completed | entered-in-error)",
        "definition" : "Status administrering. Skal vanligvis settes til 'Gjennomført' (completed), men 'Feilregistrert' (entered-in-error) MÅ benyttes hvis registreringen inneholder en alvorlig feil og skal slettes.",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://hl7.no/fhir/ig/lmdi/ValueSet/lmdi-medicationadministrationstatus"
        }
      },
      {
        "id" : "MedicationAdministration.medication[x]",
        "path" : "MedicationAdministration.medication[x]",
        "short" : "Legemiddel",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"
            ]
          }
        ]
      },
      {
        "id" : "MedicationAdministration.subject",
        "path" : "MedicationAdministration.subject",
        "short" : "Hvem fikk legemidlet (pasient)",
        "definition" : "Det skal alltid være en referanse til pasienten som har blitt administrert legemiddel.",
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
        "id" : "MedicationAdministration.context",
        "path" : "MedicationAdministration.context",
        "short" : "Episoden (f.eks. konsultasjonen/innleggelsen) som legemidlet ble administrert i forbindelse med.",
        "definition" : "Referanse til hvilket institusjonsopphold eller avtale pasienten var på da legemiddelet ble administrert.",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "MedicationAdministration.supportingInformation",
        "path" : "MedicationAdministration.supportingInformation",
        "max" : "0"
      },
      {
        "id" : "MedicationAdministration.effective[x]",
        "path" : "MedicationAdministration.effective[x]",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "type",
              "path" : "$this"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        },
        "short" : "Tidspunktet eller periode legemidlet ble administrert"
      },
      {
        "id" : "MedicationAdministration.effective[x]:effectiveDateTime",
        "path" : "MedicationAdministration.effective[x]",
        "sliceName" : "effectiveDateTime",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "dateTime"
          }
        ],
        "constraint" : [
          {
            "key" : "time-required",
            "severity" : "error",
            "human" : "Må inneholde tidspunkt for administrering.",
            "expression" : "$this.toString().matches('^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}.*$')",
            "source" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
          }
        ]
      },
      {
        "id" : "MedicationAdministration.effective[x]:effectivePeriod",
        "path" : "MedicationAdministration.effective[x]",
        "sliceName" : "effectivePeriod",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Period"
          }
        ]
      },
      {
        "id" : "MedicationAdministration.effective[x]:effectivePeriod.start",
        "path" : "MedicationAdministration.effective[x].start",
        "min" : 1,
        "constraint" : [
          {
            "key" : "time-required",
            "severity" : "error",
            "human" : "Må inneholde tidspunkt for administrering.",
            "expression" : "$this.toString().matches('^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}.*$')",
            "source" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
          }
        ]
      },
      {
        "id" : "MedicationAdministration.effective[x]:effectivePeriod.end",
        "path" : "MedicationAdministration.effective[x].end",
        "min" : 1,
        "constraint" : [
          {
            "key" : "time-required",
            "severity" : "error",
            "human" : "Må inneholde tidspunkt for administrering.",
            "expression" : "$this.toString().matches('^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}.*$')",
            "source" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
          }
        ]
      },
      {
        "id" : "MedicationAdministration.performer",
        "path" : "MedicationAdministration.performer",
        "max" : "0"
      },
      {
        "id" : "MedicationAdministration.reasonCode",
        "path" : "MedicationAdministration.reasonCode",
        "short" : "Årsak til utført administrering (Given as Ordered, Emergency, None)"
      },
      {
        "id" : "MedicationAdministration.reasonReference",
        "path" : "MedicationAdministration.reasonReference",
        "short" : "Indikasjon (diagnose) for legemiddeladministreringen",
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
        "id" : "MedicationAdministration.request",
        "path" : "MedicationAdministration.request",
        "short" : "Referanse til rekivreringen",
        "definition" : "Referanse til rekivreringen som denne administreringen er basert på.",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"
            ]
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "MedicationAdministration.device",
        "path" : "MedicationAdministration.device",
        "max" : "0"
      },
      {
        "id" : "MedicationAdministration.note",
        "path" : "MedicationAdministration.note",
        "max" : "0"
      },
      {
        "id" : "MedicationAdministration.dosage.text",
        "path" : "MedicationAdministration.dosage.text",
        "max" : "0"
      },
      {
        "id" : "MedicationAdministration.dosage.route",
        "path" : "MedicationAdministration.dosage.route",
        "short" : "Administrasjonsvei",
        "definition" : "Administrasjonsvei. Er begrenset til foreslått koding fra SNOMED CT-verdisettet til HL7 og Volven-kodeverket Administrasjonsvei (OID=7477) fra eResept.",
        "comment" : "TODO #22 Diskuter om det bør være 0..1 hvis man ikke har registret administrasjonsvei.",
        "mustSupport" : true
      },
      {
        "id" : "MedicationAdministration.dosage.route.coding",
        "path" : "MedicationAdministration.dosage.route.coding",
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
        "id" : "MedicationAdministration.dosage.route.coding:SCT",
        "path" : "MedicationAdministration.dosage.route.coding",
        "sliceName" : "SCT",
        "short" : "SNOMED CT",
        "definition" : "Administrasjonsvei kodet med SNOMED CT, hentet fra verdisett foreslått av HL7.",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "MedicationAdministration.dosage.route.coding:SCT.system",
        "path" : "MedicationAdministration.dosage.route.coding.system",
        "min" : 1,
        "patternUri" : "http://snomed.info/sct"
      },
      {
        "id" : "MedicationAdministration.dosage.route.coding:SCT.code",
        "path" : "MedicationAdministration.dosage.route.coding.code",
        "binding" : {
          "strength" : "required",
          "valueSet" : "http://hl7.org/fhir/ValueSet/route-codes"
        }
      },
      {
        "id" : "MedicationAdministration.dosage.route.coding:7477",
        "path" : "MedicationAdministration.dosage.route.coding",
        "sliceName" : "7477",
        "short" : "Administrasjonsvei (OID=7477)",
        "definition" : "Administrasjonsvei (OID=7477) fra kodeverkssamling Resept.",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "MedicationAdministration.dosage.route.coding:7477.system",
        "path" : "MedicationAdministration.dosage.route.coding.system",
        "min" : 1,
        "patternUri" : "urn:oid:2.16.578.1.12.4.1.1.7477"
      },
      {
        "id" : "MedicationAdministration.dosage.route.coding:7477.code",
        "path" : "MedicationAdministration.dosage.route.coding.code",
        "short" : "Verdi fra kodeverket"
      },
      {
        "id" : "MedicationAdministration.dosage.route.coding:7477.display",
        "path" : "MedicationAdministration.dosage.route.coding.display",
        "short" : "Beskrivelse av koden (navn) fra kodeverket"
      },
      {
        "id" : "MedicationAdministration.dosage.route.text",
        "path" : "MedicationAdministration.dosage.route.text",
        "max" : "0"
      },
      {
        "id" : "MedicationAdministration.dosage.dose",
        "path" : "MedicationAdministration.dosage.dose",
        "short" : "Administrert mengde virkestoff",
        "definition" : "Mengde (dosering) av legemiddelets primære virkestoff.",
        "min" : 1
      },
      {
        "id" : "MedicationAdministration.dosage.rate[x]",
        "path" : "MedicationAdministration.dosage.rate[x]",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "type",
              "path" : "$this"
            }
          ],
          "ordered" : false,
          "rules" : "open"
        }
      },
      {
        "id" : "MedicationAdministration.dosage.rate[x]:rateRatio",
        "path" : "MedicationAdministration.dosage.rate[x]",
        "sliceName" : "rateRatio",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Ratio"
          }
        ],
        "mustSupport" : true
      },
      {
        "id" : "MedicationAdministration.eventHistory",
        "path" : "MedicationAdministration.eventHistory",
        "max" : "0"
      }
    ]
  }
}

```
