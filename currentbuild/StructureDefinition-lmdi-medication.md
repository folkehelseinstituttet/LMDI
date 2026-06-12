# Legemiddel - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.2

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Legemiddel**

## Resource Profile: Legemiddel 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication **  | *Version*:1.1.2 **  |
| Draft as of 2025-09-30 | *Computable Name*:Legemiddel |

 
Beskrivelse av legemiddel. 

**Usages:**

* Refer to this Profile: [Legemiddel](StructureDefinition-lmdi-medication.md), [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md) and [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)
* Examples for this Profile: [Medication/Legemiddel-FestLegemiddelMerkevare](Medication-Legemiddel-FestLegemiddelMerkevare.md), [Medication/Legemiddel-FestLegemiddelVirkestoff-2](Medication-Legemiddel-FestLegemiddelVirkestoff-2.md), [Medication/Legemiddel-FestLegemiddelVirkestoff](Medication-Legemiddel-FestLegemiddelVirkestoff.md), [Medication/Legemiddel-FestLegemiddeldose](Medication-Legemiddel-FestLegemiddeldose.md)... Show 8 more, [Medication/Legemiddel-FestLegemiddelpakning](Medication-Legemiddel-FestLegemiddelpakning.md), [Medication/Legemiddel-FestLmrLopenr](Medication-Legemiddel-FestLmrLopenr.md), [Medication/Legemiddel-Legemiddeldose-SmofKabiven](Medication-Legemiddel-Legemiddeldose-SmofKabiven.md), [Medication/Legemiddel-LokaltLegemiddel-FlereIngredienser](Medication-Legemiddel-LokaltLegemiddel-FlereIngredienser.md), [Medication/Legemiddel-SCT](Medication-Legemiddel-SCT.md), [Medication/Legemiddel-UtenCoding](Medication-Legemiddel-UtenCoding.md), [Medication/Legemiddel-Varenummer](Medication-Legemiddel-Varenummer.md) and [Medication/Lokalt-legemiddel-cellegift](Medication-Lokalt-legemiddel-cellegift.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/hl7.fhir.no.lmdi|current/StructureDefinition/StructureDefinition-lmdi-medication.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-medication.csv), [Excel](StructureDefinition-lmdi-medication.xlsx), [Schematron](StructureDefinition-lmdi-medication.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-medication",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication",
  "version" : "1.1.2",
  "name" : "Legemiddel",
  "title" : "Legemiddel",
  "_title" : {
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
  "status" : "draft",
  "date" : "2025-09-30",
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
  "description" : "Beskrivelse av legemiddel.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Description of a medication."
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
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Medication",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Medication",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Medication",
      "path" : "Medication",
      "constraint" : [{
        "key" : "lmdi-medication-code-or-ingredient",
        "severity" : "error",
        "human" : "Medication skal ha code.coding eller ingredient",
        "expression" : "code.coding.exists() or ingredient.exists()",
        "source" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"
      }]
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
        "discriminator" : [{
          "type" : "value",
          "path" : "url"
        }],
        "rules" : "closed"
      }
    },
    {
      "id" : "Medication.extension:classification",
      "path" : "Medication.extension",
      "sliceName" : "classification",
      "short" : "Klassifisering av legemidlet ved bruk av ATC-kode fra WHO ATC kodesystem.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Classification of the medication using an ATC code from the WHO ATC code system."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Klassifisering av legemidlet ved bruk av ATC-kode fra WHO ATC kodesystem. Et legemiddel har i utgangspunktet kun én ATC-kode.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Classification of the medication using an ATC code from the WHO ATC code system. A medication normally has only one ATC code."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "comment" : "Denne extension brukes for å angi legemidlets klassifisering i henhold til standardiserte kodesystemer, primært ATC-koder fra WHO.",
      "_comment" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "This extension is used to specify the medication's classification according to standardized code systems, primarily WHO ATC codes."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "*",
      "type" : [{
        "code" : "Extension",
        "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification"]
      }]
    },
    {
      "id" : "Medication.code",
      "path" : "Medication.code",
      "short" : "Identifikator fra FEST, SNOMED CT eller LokalLegemiddelkatalog. Hvis ikke fylt ut, skal ingredient ha verdi. Hvis LokaltLegemiddel er fylt ut bør ingredient ha verdi.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Identifier from FEST, SNOMED CT, or the local medication catalog. If not populated, ingredient shall have a value. If LokaltLegemiddel is populated, ingredient should have a value."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "binding" : {
        "strength" : "extensible",
        "valueSet" : "http://hl7.no/fhir/ig/lmdi/ValueSet/legemiddel-koder"
      }
    },
    {
      "id" : "Medication.code.coding",
      "path" : "Medication.code.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "Medication.code.coding:FestLegemiddeldose",
      "path" : "Medication.code.coding",
      "sliceName" : "FestLegemiddeldose",
      "short" : "FEST-id for legemiddeldose",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "FEST ID for medication dose"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Unik identifikator (legemiddeldose-id) for minste plukkbare enhet av en bestemt merkevare, f.eks. 1 tablett eller 1 ampulle.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Unique identifier (medication dose ID) for the smallest dispensable unit of a specific branded product, for example one tablet or one ampoule."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
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
      "id" : "Medication.code.coding:FestLegemiddeldose.display",
      "path" : "Medication.code.coding.display",
      "short" : "NavnFormStyrke fra FEST",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Name, form, and strength from FEST"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Medication.code.coding:FestLmrLopenr",
      "path" : "Medication.code.coding",
      "sliceName" : "FestLmrLopenr",
      "short" : "Fest-løpenummer som identifiserer legemiddeldose",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "FEST sequence number identifying the medication dose"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "LMR-nummer brukt til å identifisere en endose/minste enhet som kan utleveres; overtatt fra Sykehusapotekenes Legemiddelregister.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "LMR number used to identify a single dose or smallest dispensable unit; inherited from the Hospital Pharmacy Medication Register."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
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
      "id" : "Medication.code.coding:FestLmrLopenr.display",
      "path" : "Medication.code.coding.display",
      "short" : "NavnFormStyrke fra FEST",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Name, form, and strength from FEST"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Medication.code.coding:FestLegemiddelMerkevare",
      "path" : "Medication.code.coding",
      "sliceName" : "FestLegemiddelMerkevare",
      "short" : "FEST-id for LegemiddelMerkevare",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "FEST ID for branded medication"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Unik identifikator for en bestemt styrke og legemiddelform av en merkevare (branded product) i FEST.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Unique identifier for a specific strength and form of a branded product in FEST."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
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
      "id" : "Medication.code.coding:FestLegemiddelMerkevare.display",
      "path" : "Medication.code.coding.display",
      "short" : "Varenavn eller NavnFormStyrke fra FEST",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Product name or name, form, and strength from FEST"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Medication.code.coding:FestLegemiddelpakning",
      "path" : "Medication.code.coding",
      "sliceName" : "FestLegemiddelpakning",
      "short" : "FEST-id for legemiddelpakning",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "FEST ID for medication package"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Unik identifikator for en konkret pakning av en merkevare i katalogen LegemiddelPakningMerkevare.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Unique identifier for a specific package of a branded product in the LegemiddelPakningMerkevare catalog."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
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
      "id" : "Medication.code.coding:FestLegemiddelpakning.display",
      "path" : "Medication.code.coding.display",
      "short" : "Varenavn eller NavnFormStyrke fra FEST",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Product name or name, form, and strength from FEST"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Medication.code.coding:Varenummer",
      "path" : "Medication.code.coding",
      "sliceName" : "Varenummer",
      "short" : "Varenummer - Unikt produktnummer for legemiddelpakninger",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Item number - unique product number for medication packages"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Varenummeret for legemiddelpakningen; brukes som unikt produktnummer blant annet i resept- og apotekkjeden.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "The item number for the medication package; used as a unique product number in the prescription and pharmacy chain."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
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
      "id" : "Medication.code.coding:Varenummer.display",
      "path" : "Medication.code.coding.display",
      "short" : "Varenavn eller NavnFormStyrke fra FEST",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Product name or name, form, and strength from FEST"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Medication.code.coding:FestLegemiddelVirkestoff",
      "path" : "Medication.code.coding",
      "sliceName" : "FestLegemiddelVirkestoff",
      "short" : "FEST-id for legemiddel virkestoff",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "FEST ID for medication substance"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Unik identifikator (LegemiddelVirkestoff_ID) for rekvirering på virkestoffnivå i FEST.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Unique identifier (LegemiddelVirkestoff_ID) for substance-based prescribing in FEST."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Medication.code.coding:FestLegemiddelVirkestoff.system",
      "path" : "Medication.code.coding.system",
      "min" : 1,
      "patternUri" : "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff"
    },
    {
      "id" : "Medication.code.coding:FestLegemiddelVirkestoff.code",
      "path" : "Medication.code.coding.code",
      "short" : "Identifikator fra FEST",
      "min" : 1
    },
    {
      "id" : "Medication.code.coding:FestLegemiddelVirkestoff.display",
      "path" : "Medication.code.coding.display",
      "short" : "NavnFormStyrke fra FEST",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Name, form, and strength from FEST"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Medication.code.coding:LokaltLegemiddel",
      "path" : "Medication.code.coding",
      "sliceName" : "LokaltLegemiddel",
      "short" : "Legemiddel fra lokal katalog",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Medication from a local catalog"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Skal kun benyttes for legemidler fra lokal legemiddelkatalog/legemiddelregister. Hvis LokaltLegemiddel benyttes skal det avtales med FHI hvordan LMR skal få tilgang til legemiddelkatalogen for å hente informasjon om det lokale legemidlet. ",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Should only be used for medications from a local medication catalog or medication register. If LokaltLegemiddel is used, FHI should agree on how LMR will access the medication catalog to retrieve information about the local medication."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Medication.code.coding:LokaltLegemiddel.system",
      "path" : "Medication.code.coding.system",
      "min" : 1,
      "patternUri" : "http://fhi.no/fhir/NamingSystem/lokaltLegemiddel"
    },
    {
      "id" : "Medication.code.coding:LokaltLegemiddel.code",
      "path" : "Medication.code.coding.code",
      "short" : "Identifikator fra lokal legemiddelkatalog/legemiddelregister",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Identifier from the local medication catalog or medication register"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1
    },
    {
      "id" : "Medication.code.coding:LokaltLegemiddel.display",
      "path" : "Medication.code.coding.display",
      "short" : "Beskrivelse (f.eks. varenavn) for legemiddel fra lokal legemiddelkatalog/legemiddelregister",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Description (for example, product name) for a medication from the local medication catalog or register"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1
    },
    {
      "id" : "Medication.code.coding:SCT",
      "path" : "Medication.code.coding",
      "sliceName" : "SCT",
      "short" : "SNOMED CT-kode for legemiddel",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "SNOMED CT code for medication"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "SNOMED CT-kode for legemiddel eller substans, for semantisk klassifisering og gruppering.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "SNOMED CT code for medication or substance, used for semantic classification and grouping."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
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
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "The SNOMED CT code shall be a subtype of 'Medication (product)' [763158003] or 'Substance' [105590001]."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
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
      "short" : "Legemiddelform",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Medication form"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Medication.form.coding",
      "path" : "Medication.form.coding",
      "slicing" : {
        "discriminator" : [{
          "type" : "value",
          "path" : "system"
        }],
        "rules" : "closed"
      },
      "short" : "Legemiddelform",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Medication form"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "comment" : "Kodet legemiddelform. Inntil videre begrenset til Legemiddelform (OID: 7448) og kodesetteksempel fra HL7 basert på SNOMED CT.",
      "_comment" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Coded medication form. Currently limited to medication form (OID: 7448) and the HL7 SNOMED CT example code set."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
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
      "id" : "Medication.form.coding:OID7448",
      "path" : "Medication.form.coding",
      "sliceName" : "OID7448",
      "short" : "Kodeverk Legemiddelform (OID:7448) fra FEST",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Medication form code system (OID:7448) from FEST"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 0,
      "max" : "1"
    },
    {
      "id" : "Medication.form.coding:OID7448.system",
      "path" : "Medication.form.coding.system",
      "patternUri" : "urn:oid:2.16.578.1.12.4.1.1.7448"
    },
    {
      "id" : "Medication.form.coding:OID7448.code",
      "path" : "Medication.form.coding.code",
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
      }
    },
    {
      "id" : "Medication.form.coding:OID7448.display",
      "path" : "Medication.form.coding.display",
      "short" : "Beskrivelse av koden (navn) fra kodeverket",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Code description (name) from the code system"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
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
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Ingredient(s) in the medication. Shall be populated if code has no value. Should be populated if code.coding[LokaltLegemiddel] has a value."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Virkestoff(er) som inngår i legemiddelet. Skal fylles ut hvis code ikke har verdi. Bør fylles ut hvis code.coding[LokaltLegemiddel] har verdi.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Ingredient(s) in the medication. Shall be populated if code has no value. Should be populated if code.coding[LokaltLegemiddel] has a value."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "comment" : "For legemidler identifisert med FEST-koder (FestLegemiddeldose, FestLegemiddelMerkevare, FestLegemiddelpakning, FestLegemiddelVirkestoff, Varenummer) eller SNOMED CT er ingredient valgfritt, da virkestoffinformasjon kan hentes fra disse katalogene. For lokale legemidler anbefales det å oppgi ingredient for bedre sporbarhet.",
      "_comment" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "For medications identified with FEST codes (FestLegemiddeldose, FestLegemiddelMerkevare, FestLegemiddelpakning, FestLegemiddelVirkestoff, Varenummer) or SNOMED CT, ingredient is optional because substance information can be retrieved from those catalogs. For local medications, it is recommended to specify ingredient for better traceability."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Medication.ingredient.item[x]",
      "path" : "Medication.ingredient.item[x]",
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
      "id" : "Medication.ingredient.item[x]:itemReference",
      "path" : "Medication.ingredient.item[x]",
      "sliceName" : "itemReference",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-substance",
        "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
      }]
    },
    {
      "id" : "Medication.ingredient.item[x]:itemCodeableConcept",
      "path" : "Medication.ingredient.item[x]",
      "sliceName" : "itemCodeableConcept",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }],
      "binding" : {
        "strength" : "preferred",
        "valueSet" : "http://hl7.no/fhir/ig/lmdi/ValueSet/legemiddel-koder"
      }
    },
    {
      "id" : "Medication.batch",
      "path" : "Medication.batch",
      "short" : "Batch-nummer for legemiddelet",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Batch number for the medication"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    }]
  }
}

```
