# Legemiddel - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Legemiddel**

## Resource Profile: Legemiddel 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication **  | *Version*:1.0.7 **  |
| Draft as of 2025-09-30 | *Computable Name*:Legemiddel |

 
Beskrivelse av legemiddel. 

**Usages:**

* Refer to this Profile: [Legemiddel](StructureDefinition-lmdi-medication.md), [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md) and [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)
* Examples for this Profile: [Medication/Medisin-1-LegemiddelDose-Oxycodone](Medication-Medisin-1-LegemiddelDose-Oxycodone.md), [Medication/Medisin-2-Paracetamol](Medication-Medisin-2-Paracetamol.md) and [Medication/Medisin-3-LegemiddelPakning-Monoket](Medication-Medisin-3-LegemiddelPakning-Monoket.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.no.lmdi|current/StructureDefinition/lmdi-medication)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-medication.csv), [Excel](StructureDefinition-lmdi-medication.xlsx), [Schematron](StructureDefinition-lmdi-medication.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-medication",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication",
  "version" : "1.0.7",
  "name" : "Legemiddel",
  "title" : "Legemiddel",
  "status" : "draft",
  "date" : "2025-09-30",
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
  "description" : "Beskrivelse av legemiddel.",
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
  "type" : "Medication",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Medication",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Medication",
        "path" : "Medication"
      },
      {
        "id" : "Medication.text",
        "path" : "Medication.text",
        "max" : "0"
      },
      {
        "id" : "Medication.extension",
        "path" : "Medication.extension",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "url"
            }
          ],
          "rules" : "closed"
        }
      },
      {
        "id" : "Medication.extension:classification",
        "path" : "Medication.extension",
        "sliceName" : "classification",
        "short" : "Klassifisering av legemidlet, fortrinnsvis ved bruk av ATC-kode fra WHO ATC kodesystem. Ett legemiddel kan ha inntil én ATC-kode.",
        "definition" : "Klassifisering av legemidlet, fortrinnsvis ved bruk av ATC-kode fra WHO ATC kodesystem. Ett legemiddel kan ha inntil én ATC-kode.",
        "comment" : "Denne extension brukes for å angi legemidlets klassifisering i henhold til standardiserte kodesystemer, primært ATC-koder fra WHO.",
        "min" : 0,
        "max" : "*",
        "type" : [
          {
            "code" : "Extension",
            "profile" : [
              "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification"
            ]
          }
        ]
      },
      {
        "id" : "Medication.code",
        "path" : "Medication.code",
        "short" : "Identifikator fra FEST, SNOMED CT eller LokalLegemiddelkatalog. Hvis ikke fylt ut, skal ingredient ha verdi. Hvis LokaltLegemiddel er fylt ut bør ingredient ha verdi.",
        "binding" : {
          "strength" : "extensible",
          "valueSet" : "http://hl7.no/fhir/ig/lmdi/ValueSet/legemiddel-koder"
        }
      },
      {
        "id" : "Medication.code.coding",
        "path" : "Medication.code.coding",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "system"
            }
          ],
          "rules" : "open"
        }
      },
      {
        "id" : "Medication.code.coding:FestLegemiddeldose",
        "path" : "Medication.code.coding",
        "sliceName" : "FestLegemiddeldose",
        "short" : "FEST-id for legemiddeldose",
        "definition" : "Unik identifikator (legemiddeldose-id) for minste plukkbare enhet av en bestemt merkevare, f.eks. 1 tablett eller 1 ampulle.",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Medication.code.coding:FestLegemiddeldose.system",
        "path" : "Medication.code.coding.system",
        "min" : 1,
        "patternUri" : "http://dmp.no/fhir/NamingSystem/festLegemiddelDose"
      },
      {
        "id" : "Medication.code.coding:FestLegemiddeldose.code",
        "path" : "Medication.code.coding.code",
        "short" : "Identifikator fra FEST",
        "min" : 1
      },
      {
        "id" : "Medication.code.coding:FestLmrLopenr",
        "path" : "Medication.code.coding",
        "sliceName" : "FestLmrLopenr",
        "short" : "Fest-løpenummer som identifiserer legemiddeldose",
        "definition" : "LMR-nummer brukt til å identifisere en endose/minste enhet som kan utleveres; overtatt fra Sykehusapotekenes Legemiddelregister.",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Medication.code.coding:FestLmrLopenr.system",
        "path" : "Medication.code.coding.system",
        "min" : 1,
        "patternUri" : "http://dmp.no/fhir/NamingSystem/lmrLopenummer"
      },
      {
        "id" : "Medication.code.coding:FestLmrLopenr.code",
        "path" : "Medication.code.coding.code",
        "short" : "7‑sifret nummer",
        "min" : 1
      },
      {
        "id" : "Medication.code.coding:FestLegemiddelMerkevare",
        "path" : "Medication.code.coding",
        "sliceName" : "FestLegemiddelMerkevare",
        "short" : "FEST-id for LegemiddelMerkevare",
        "definition" : "Unik identifikator for en bestemt styrke og legemiddelform av en merkevare (branded product) i FEST.",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Medication.code.coding:FestLegemiddelMerkevare.system",
        "path" : "Medication.code.coding.system",
        "min" : 1,
        "patternUri" : "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare"
      },
      {
        "id" : "Medication.code.coding:FestLegemiddelMerkevare.code",
        "path" : "Medication.code.coding.code",
        "short" : "Identifikator fra FEST",
        "min" : 1
      },
      {
        "id" : "Medication.code.coding:FestLegemiddelpakning",
        "path" : "Medication.code.coding",
        "sliceName" : "FestLegemiddelpakning",
        "short" : "FEST-id for legemiddelpakning",
        "definition" : "Unik identifikator for en konkret pakning av en merkevare i katalogen LegemiddelPakningMerkevare.",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Medication.code.coding:FestLegemiddelpakning.system",
        "path" : "Medication.code.coding.system",
        "min" : 1,
        "patternUri" : "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning"
      },
      {
        "id" : "Medication.code.coding:FestLegemiddelpakning.code",
        "path" : "Medication.code.coding.code",
        "short" : "Identifikator fra FEST",
        "min" : 1
      },
      {
        "id" : "Medication.code.coding:Varenummer",
        "path" : "Medication.code.coding",
        "sliceName" : "Varenummer",
        "short" : "Varenummer - Unikt produktnummer for legemiddelpakninger",
        "definition" : "Varenummeret for legemiddelpakningen; brukes som unikt produktnummer blant annet i resept- og apotekkjeden.",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Medication.code.coding:Varenummer.system",
        "path" : "Medication.code.coding.system",
        "min" : 1,
        "patternUri" : "http://dmp.no/fhir/NamingSystem/fest-varenummer"
      },
      {
        "id" : "Medication.code.coding:Varenummer.code",
        "path" : "Medication.code.coding.code",
        "short" : "Varenummer",
        "min" : 1
      },
      {
        "id" : "Medication.code.coding:FestVirkestoff",
        "path" : "Medication.code.coding",
        "sliceName" : "FestVirkestoff",
        "short" : "FEST-id for legemiddel virkestoff",
        "definition" : "Unik identifikator (LegemiddelVirkestoff_ID) for rekvirering på virkestoffnivå i FEST.",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Medication.code.coding:FestVirkestoff.system",
        "path" : "Medication.code.coding.system",
        "min" : 1,
        "patternUri" : "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff"
      },
      {
        "id" : "Medication.code.coding:FestVirkestoff.code",
        "path" : "Medication.code.coding.code",
        "short" : "Identifikator fra FEST",
        "min" : 1
      },
      {
        "id" : "Medication.code.coding:LokaltLegemiddel",
        "path" : "Medication.code.coding",
        "sliceName" : "LokaltLegemiddel",
        "short" : "Legemiddel fra lokal katalog",
        "definition" : "Skal kun benyttes for legemidler fra lokal legemiddelkatalog/legemiddelregister. Hvis LokaltLegemiddel benyttes skal det avtales med FHI hvordan LMR skal få tilgang til legemiddelkatalogen for å hente informasjon om det lokale legemidlet. ",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Medication.code.coding:LokaltLegemiddel.system",
        "path" : "Medication.code.coding.system",
        "min" : 1,
        "patternUri" : "http://fh.no/fhir/NamingSystem/lokaltVirkemiddel"
      },
      {
        "id" : "Medication.code.coding:LokaltLegemiddel.code",
        "path" : "Medication.code.coding.code",
        "short" : "Identifikator fra lokal legemiddelkatalog/legemiddelregister",
        "min" : 1
      },
      {
        "id" : "Medication.code.coding:LokaltLegemiddel.display",
        "path" : "Medication.code.coding.display",
        "short" : "Beskrivelse (f.eks. varenavn) for legemiddel fra lokal legemiddelkatalog/legemiddelregister",
        "min" : 1
      },
      {
        "id" : "Medication.code.coding:SCT",
        "path" : "Medication.code.coding",
        "sliceName" : "SCT",
        "short" : "SNOMED CT-kode for legemiddel",
        "definition" : "SNOMED CT-kode for legemiddel eller substans, for semantisk klassifisering og gruppering.",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Medication.code.coding:SCT.system",
        "path" : "Medication.code.coding.system",
        "min" : 1,
        "patternUri" : "http://snomed.info/sct"
      },
      {
        "id" : "Medication.code.coding:SCT.code",
        "path" : "Medication.code.coding.code",
        "short" : "SNOMED CT-koden skal være et underbegrep av 'Legemiddel (product)' [763158003] eller 'Substans (substance)' [105590001].",
        "min" : 1
      },
      {
        "id" : "Medication.code.text",
        "path" : "Medication.code.text",
        "max" : "0"
      },
      {
        "id" : "Medication.manufacturer",
        "path" : "Medication.manufacturer",
        "max" : "0"
      },
      {
        "id" : "Medication.form",
        "path" : "Medication.form",
        "short" : "Legemiddelform"
      },
      {
        "id" : "Medication.form.coding",
        "path" : "Medication.form.coding",
        "slicing" : {
          "discriminator" : [
            {
              "type" : "value",
              "path" : "system"
            }
          ],
          "rules" : "closed"
        },
        "short" : "Legemiddelform",
        "comment" : "Kodet legemiddelform. Inntil videre begrenset til Legemiddelform (OID: 7448) og kodesetteksempel fra HL7 basert på SNOMED CT.",
        "min" : 1
      },
      {
        "id" : "Medication.form.coding.system",
        "path" : "Medication.form.coding.system",
        "min" : 1
      },
      {
        "id" : "Medication.form.coding.code",
        "path" : "Medication.form.coding.code",
        "min" : 1
      },
      {
        "id" : "Medication.form.coding.display",
        "path" : "Medication.form.coding.display",
        "mustSupport" : true
      },
      {
        "id" : "Medication.form.coding:7448",
        "path" : "Medication.form.coding",
        "sliceName" : "7448",
        "short" : "Kodeverk Legemiddelform (OID:7448) fra FEST",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Medication.form.coding:7448.system",
        "path" : "Medication.form.coding.system",
        "patternUri" : "urn:oid:2.16.578.1.12.4.1.1.7448"
      },
      {
        "id" : "Medication.form.coding:7448.code",
        "path" : "Medication.form.coding.code",
        "short" : "Verdi fra kodeverket"
      },
      {
        "id" : "Medication.form.coding:7448.display",
        "path" : "Medication.form.coding.display",
        "short" : "Beskrivelse av koden (navn) fra kodeverket"
      },
      {
        "id" : "Medication.form.coding:SCT",
        "path" : "Medication.form.coding",
        "sliceName" : "SCT",
        "short" : "SNOMED CT Form Codes",
        "min" : 0,
        "max" : "1"
      },
      {
        "id" : "Medication.form.coding:SCT.system",
        "path" : "Medication.form.coding.system",
        "patternUri" : "http://snomed.info/sct"
      },
      {
        "id" : "Medication.form.text",
        "path" : "Medication.form.text",
        "max" : "0"
      },
      {
        "id" : "Medication.ingredient",
        "path" : "Medication.ingredient",
        "short" : "Virkestoff(er) som inngår i legemiddelet. Skal fylles ut hvis code ikke har verdi. Bør fylles ut hvis code.coding[LokaltLegemiddel] har verdi.",
        "definition" : "Virkestoff(er) som inngår i legemiddelet. Skal fylles ut hvis code ikke har verdi. Bør fylles ut hvis code.coding[LokaltLegemiddel] har verdi.",
        "comment" : "For legemidler identifisert med FEST-koder (FestLegemiddeldose, FestLegemiddelMerkevare, FestLegemiddelpakning, FestVirkestoff, Varenummer) eller SNOMED CT er ingredient valgfritt, da virkestoffinformasjon kan hentes fra disse katalogene. For lokale legemidler anbefales det å oppgi ingredient for bedre sporbarhet."
      },
      {
        "id" : "Medication.ingredient.item[x]",
        "path" : "Medication.ingredient.item[x]",
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
        "id" : "Medication.ingredient.item[x]:itemReference",
        "path" : "Medication.ingredient.item[x]",
        "sliceName" : "itemReference",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-substance",
              "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"
            ]
          }
        ]
      },
      {
        "id" : "Medication.ingredient.item[x]:itemCodeableConcept",
        "path" : "Medication.ingredient.item[x]",
        "sliceName" : "itemCodeableConcept",
        "min" : 0,
        "max" : "1",
        "type" : [
          {
            "code" : "CodeableConcept"
          }
        ],
        "binding" : {
          "strength" : "preferred",
          "valueSet" : "http://hl7.no/fhir/ig/lmdi/ValueSet/legemiddel-koder"
        }
      },
      {
        "id" : "Medication.batch",
        "path" : "Medication.batch",
        "short" : "Batch-nummer for legemiddelet",
        "mustSupport" : true
      }
    ]
  }
}

```
