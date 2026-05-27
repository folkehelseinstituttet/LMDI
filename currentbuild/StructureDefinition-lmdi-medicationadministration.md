# Legemiddeladministrering - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Legemiddeladministrering**

## Resource Profile: Legemiddeladministrering 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration **  | *Version*:1.1.0 **  |
| Draft as of 2025-09-12 | *Computable Name*:Legemiddeladministrering |

 
Beskriver administrering av legemiddel til pasient på institusjon. Dette er kjerneressursen for denne implementasjonsguiden. Den peker videre til legemiddelet som ble gitt, pasienten som har fått administrert legemiddel, episoden administreringen skjedde i løpet av (som igjen peker på hvilken institusjon det skjedde ved), rekvireringen administreringen var basert på og årsaken (diagnosen) til at legemidlet ble gitt. 

**Usages:**

* Examples for this Profile: [MedicationAdministration/Administrering-Cellegift](MedicationAdministration-Administrering-Cellegift.md), [MedicationAdministration/Administrering-EnteredInError](MedicationAdministration-Administrering-EnteredInError.md), [MedicationAdministration/Administrering-Infusjon](MedicationAdministration-Administrering-Infusjon.md), [MedicationAdministration/Administrering-MedDiagnoseICD10](MedicationAdministration-Administrering-MedDiagnoseICD10.md)... Show 3 more, [MedicationAdministration/Administrering-MedDiagnoseSCT](MedicationAdministration-Administrering-MedDiagnoseSCT.md), [MedicationAdministration/Administrering-Oral](MedicationAdministration-Administrering-Oral.md) and [MedicationAdministration/Administrering-Selvadministrert](MedicationAdministration-Administrering-Selvadministrert.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/hl7.fhir.no.lmdi|current/StructureDefinition/StructureDefinition-lmdi-medicationadministration.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-medicationadministration.csv), [Excel](StructureDefinition-lmdi-medicationadministration.xlsx), [Schematron](StructureDefinition-lmdi-medicationadministration.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-medicationadministration",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration",
  "version" : "1.1.0",
  "name" : "Legemiddeladministrering",
  "title" : "Legemiddeladministrering",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Medication Administration"
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
  "description" : "Beskriver administrering av legemiddel til pasient på institusjon. Dette er kjerneressursen for denne implementasjonsguiden. Den peker videre til legemiddelet som ble gitt, pasienten som har fått administrert legemiddel, episoden administreringen skjedde i løpet av (som igjen peker på hvilken institusjon det skjedde ved), rekvireringen administreringen var basert på og årsaken (diagnosen) til at legemidlet ble gitt.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Describes the administration of a medicinal product to a patient in an institution. This is the core resource for this implementation guide. It references the medicinal product that was administered, the patient who received the administration, the episode during which the administration took place, which in turn references the institution where it occurred, the prescription/order on which the administration was based, and the reason, diagnosis, for which the medicinal product was given."
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
  },
  {
    "identity" : "w3c.prov",
    "uri" : "http://www.w3.org/ns/prov",
    "name" : "W3C PROV"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "MedicationAdministration",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/MedicationAdministration",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
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
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Administration status (completed | entered-in-error)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Status administrering. Skal vanligvis settes til 'Gjennomført' (completed), men 'Feilregistrert' (entered-in-error) MÅ benyttes hvis registreringen inneholder en alvorlig feil og skal slettes.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Administration status. It should usually be set to 'completed', but 'entered-in-error' MUST be used if the record contains a serious error and shall be deleted."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://hl7.no/fhir/ig/lmdi/ValueSet/lmdi-medicationadministrationstatus"
      }
    },
    {
      "id" : "MedicationAdministration.category",
      "path" : "MedicationAdministration.category",
      "short" : "Kategori (inneliggende | poliklinisk | selvadministrert | utskrivelse)",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Category (inpatient | outpatient | self-administered | discharge)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kategoriserer administreringskonteksten. Bruk 'community' for selvadministrering — pasienten tar legemidlet selv, men det er utdelt av institusjonen.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Categorizes the administration context. Use 'community' for self-administration - the patient takes the medication themselves, but it is dispensed by the institution."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "http://hl7.org/fhir/ValueSet/medication-admin-category"
      }
    },
    {
      "id" : "MedicationAdministration.medication[x]",
      "path" : "MedicationAdministration.medication[x]",
      "short" : "Legemiddel",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Medication"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
      }]
    },
    {
      "id" : "MedicationAdministration.subject",
      "path" : "MedicationAdministration.subject",
      "short" : "Hvem fikk legemidlet (pasient)",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Who received the medication (patient)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Det skal alltid være en referanse til pasienten som har blitt administrert legemiddel.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "There shall always be a reference to the patient who received the medication."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"]
      }]
    },
    {
      "id" : "MedicationAdministration.context",
      "path" : "MedicationAdministration.context",
      "short" : "Episoden (f.eks. konsultasjonen/innleggelsen) som legemidlet ble administrert i forbindelse med.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "The episode (for example the consultation or admission) associated with the medication administration."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referanse til hvilket institusjonsopphold eller avtale pasienten var på da legemiddelet ble administrert.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reference to which institutional stay or appointment the patient was in when the medication was administered."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter"]
      }],
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
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
        "ordered" : false,
        "rules" : "open"
      },
      "short" : "Tidspunktet eller periode legemidlet ble administrert",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "The time or period when the medication was administered"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "MedicationAdministration.effective[x]:effectiveDateTime",
      "path" : "MedicationAdministration.effective[x]",
      "sliceName" : "effectiveDateTime",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "dateTime"
      }],
      "constraint" : [{
        "key" : "time-required",
        "severity" : "error",
        "human" : "Må inneholde tidspunkt for administrering.",
        "expression" : "$this.toString().matches('^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}.*$')",
        "source" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
      }]
    },
    {
      "id" : "MedicationAdministration.effective[x]:effectivePeriod",
      "path" : "MedicationAdministration.effective[x]",
      "sliceName" : "effectivePeriod",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Period"
      }]
    },
    {
      "id" : "MedicationAdministration.effective[x]:effectivePeriod.start",
      "path" : "MedicationAdministration.effective[x].start",
      "min" : 1,
      "constraint" : [{
        "key" : "time-required",
        "severity" : "error",
        "human" : "Må inneholde tidspunkt for administrering.",
        "expression" : "$this.toString().matches('^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}.*$')",
        "source" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
      }]
    },
    {
      "id" : "MedicationAdministration.effective[x]:effectivePeriod.end",
      "path" : "MedicationAdministration.effective[x].end",
      "min" : 1,
      "constraint" : [{
        "key" : "time-required",
        "severity" : "error",
        "human" : "Må inneholde tidspunkt for administrering.",
        "expression" : "$this.toString().matches('^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}.*$')",
        "source" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
      }]
    },
    {
      "id" : "MedicationAdministration.performer",
      "path" : "MedicationAdministration.performer",
      "max" : "0"
    },
    {
      "id" : "MedicationAdministration.reasonCode",
      "path" : "MedicationAdministration.reasonCode",
      "short" : "Årsak til utført administrering (Given as Ordered, Emergency, None)",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reason for the administration (Given as Ordered, Emergency, None)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "MedicationAdministration.reasonReference",
      "path" : "MedicationAdministration.reasonReference",
      "short" : "Indikasjon (diagnose) for legemiddeladministreringen",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Indication (diagnosis) for the medication administration"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition"]
      }]
    },
    {
      "id" : "MedicationAdministration.request",
      "path" : "MedicationAdministration.request",
      "short" : "Referanse til rekvireringen",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reference to the request"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Referanse til rekvireringen som denne administreringen er basert på.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Reference to the request on which this administration is based."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"]
      }],
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
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Route of administration"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Administrasjonsvei. Er begrenset til foreslått koding fra SNOMED CT-verdisettet til HL7 og Volven-kodeverket Administrasjonsvei (OID=7477) fra eResept.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Route of administration. Restricted to the proposed coding from HL7's SNOMED CT value set and the ePrescription code system Route of Administration (OID=7477)."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "comment" : "Administrasjonsvei benyttes for å angi hvordan legemiddelet ble gitt.",
      "_comment" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Route of administration is used to indicate how the medication was given."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "MedicationAdministration.dosage.route.coding",
      "path" : "MedicationAdministration.dosage.route.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "pattern",
          "path" : "system"
        }],
        "rules" : "closed"
      },
      "min" : 1
    },
    {
      "id" : "MedicationAdministration.dosage.route.coding:SCT",
      "path" : "MedicationAdministration.dosage.route.coding",
      "sliceName" : "SCT",
      "short" : "SNOMED CT",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "SNOMED CT"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Administrasjonsvei kodet med SNOMED CT, hentet fra verdisett foreslått av HL7.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Route of administration coded with SNOMED CT, taken from the HL7-proposed value set."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
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
      "min" : 1,
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://hl7.org/fhir/ValueSet/route-codes"
      }
    },
    {
      "id" : "MedicationAdministration.dosage.route.coding:OID7477",
      "path" : "MedicationAdministration.dosage.route.coding",
      "sliceName" : "OID7477",
      "short" : "Administrasjonsvei (OID=7477)",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Route of administration (OID=7477)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Administrasjonsvei (OID=7477) fra kodeverkssamling Resept.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Route of administration (OID=7477) from the prescription code system collection."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "MedicationAdministration.dosage.route.coding:OID7477.system",
      "path" : "MedicationAdministration.dosage.route.coding.system",
      "min" : 1,
      "patternUri" : "urn:oid:2.16.578.1.12.4.1.1.7477"
    },
    {
      "id" : "MedicationAdministration.dosage.route.coding:OID7477.code",
      "path" : "MedicationAdministration.dosage.route.coding.code",
      "short" : "Verdi fra kodeverket",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Value from the code system"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1
    },
    {
      "id" : "MedicationAdministration.dosage.route.coding:OID7477.display",
      "path" : "MedicationAdministration.dosage.route.coding.display",
      "short" : "Beskrivelse av koden (navn) fra kodeverket",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Description of the code (name) from the code system"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
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
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Administered amount of substance"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Mengde (dosering) av legemiddelets primære virkestoff.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Amount (dosage) of the medication's primary substance."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1
    },
    {
      "id" : "MedicationAdministration.dosage.rate[x]",
      "path" : "MedicationAdministration.dosage.rate[x]",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        }],
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
      "type" : [{
        "code" : "Ratio"
      }],
      "mustSupport" : true
    },
    {
      "id" : "MedicationAdministration.eventHistory",
      "path" : "MedicationAdministration.eventHistory",
      "max" : "0"
    }]
  }
}

```
