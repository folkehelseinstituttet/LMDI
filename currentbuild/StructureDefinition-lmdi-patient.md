# Pasient - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.2

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Pasient**

## Resource Profile: Pasient 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient **  | *Version*:1.1.2 **  |
| Draft as of 2025-09-30 | *Computable Name*:Pasient |

 
Pasienten som har fått rekvirert eller administrert legemiddel, basert på no-basis-Patient 

**Usages:**

* Refer to this Profile: [Diagnose](StructureDefinition-lmdi-condition.md), [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md) and [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)
* Examples for this Profile: [Patient/Pasient-Med-DNR](Patient-Pasient-Med-DNR.md), [Patient/Pasient-Med-FNR](Patient-Pasient-Med-FNR.md) and [Patient/Pasient-Uten-Personidentifikator](Patient-Pasient-Uten-Personidentifikator.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/hl7.fhir.no.lmdi|current/StructureDefinition/StructureDefinition-lmdi-patient.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-patient.csv), [Excel](StructureDefinition-lmdi-patient.xlsx), [Schematron](StructureDefinition-lmdi-patient.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-patient",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient",
  "version" : "1.1.2",
  "name" : "Pasient",
  "title" : "Pasient",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Patient"
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
  "description" : "Pasienten som har fått rekvirert eller administrert legemiddel, basert på no-basis-Patient",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "The patient who has been prescribed or administered medication, based on no-basis-Patient"
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
  "kind" : "resource",
  "abstract" : false,
  "type" : "Patient",
  "baseDefinition" : "http://hl7.no/fhir/StructureDefinition/no-basis-Patient",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Patient",
      "path" : "Patient"
    },
    {
      "id" : "Patient.text",
      "path" : "Patient.text",
      "max" : "0"
    },
    {
      "id" : "Patient.extension:citizenship",
      "path" : "Patient.extension",
      "sliceName" : "citizenship",
      "max" : "0"
    },
    {
      "id" : "Patient.identifier",
      "path" : "Patient.identifier",
      "short" : "Identifikator for pasienten.",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Patient identifier."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Identifikator for pasienten. Bør være fødselsnummer (FNR) eller D-nummer (DNR) når tilgjengelig.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Patient identifier. Should be national identity number (FNR) or D-number (DNR) when available."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:FNR",
      "path" : "Patient.identifier",
      "sliceName" : "FNR",
      "short" : "Fødselsnummer",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "National identity number"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:FNR.value",
      "path" : "Patient.identifier.value",
      "short" : "Fødselsnummeret (11 siffer)",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "National identity number (11 digits)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "example" : [{
        "label" : "Fødselsnummer",
        "valueString" : "12345678901"
      },
      {
        "label" : "Fødselsnummer",
        "valueString" : "13057444850"
      }]
    },
    {
      "id" : "Patient.identifier:FHN",
      "path" : "Patient.identifier",
      "sliceName" : "FHN",
      "max" : "0"
    },
    {
      "id" : "Patient.identifier:DNR",
      "path" : "Patient.identifier",
      "sliceName" : "DNR",
      "short" : "D-nummer",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "D-number"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "max" : "1",
      "mustSupport" : true
    },
    {
      "id" : "Patient.identifier:DNR.value",
      "path" : "Patient.identifier.value",
      "short" : "D-nummer (11 siffer)",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "D-number (11 digits)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "example" : [{
        "label" : "D-nummer",
        "valueString" : "12345678901"
      }]
    },
    {
      "id" : "Patient.identifier:HNR",
      "path" : "Patient.identifier",
      "sliceName" : "HNR",
      "max" : "0"
    },
    {
      "id" : "Patient.active",
      "path" : "Patient.active",
      "max" : "0"
    },
    {
      "id" : "Patient.name",
      "path" : "Patient.name",
      "max" : "0"
    },
    {
      "id" : "Patient.telecom",
      "path" : "Patient.telecom",
      "max" : "0"
    },
    {
      "id" : "Patient.gender",
      "path" : "Patient.gender",
      "short" : "Kjønn",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Gender"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Pasientens kjønn.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "The patient's gender."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.birthDate",
      "path" : "Patient.birthDate",
      "short" : "Fødselsdato",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Date of birth"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Pasientens fødselsdato.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "The patient's date of birth."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Patient.deceased[x]",
      "path" : "Patient.deceased[x]",
      "max" : "0"
    },
    {
      "id" : "Patient.address",
      "path" : "Patient.address",
      "mustSupport" : true
    },
    {
      "id" : "Patient.address.extension:official",
      "path" : "Patient.address.extension",
      "sliceName" : "official",
      "max" : "0"
    },
    {
      "id" : "Patient.address.extension:urbanDistrict",
      "path" : "Patient.address.extension",
      "sliceName" : "urbanDistrict",
      "short" : "Kodet verdi for bydel. Kodeverk \"Bydelsnummer\" (OID 3403)",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Encoded value for urban district. Code system \"Urban district numbers\" (OID 3403)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kodet verdi for bydel. Koder fra kodeverk \"Bydelsnummer\" (OID 3403) skal benyttes",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Encoded value for urban district. Codes from code system \"Urban district numbers\" (OID 3403) shall be used."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Patient.address.extension:propertyInformation",
      "path" : "Patient.address.extension",
      "sliceName" : "propertyInformation",
      "max" : "0"
    },
    {
      "id" : "Patient.address.use",
      "path" : "Patient.address.use",
      "short" : "home | temp | old",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "home | temp | old"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Adressetype begrenset til home, temp eller old",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Address type limited to home, temp, or old"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "binding" : {
        "strength" : "required",
        "description" : "Tillatte verdier er home, temp eller old",
        "_description" : {
          "extension" : [{
            "extension" : [{
              "url" : "lang",
              "valueCode" : "en"
            },
            {
              "url" : "content",
              "valueString" : "Allowed values are home, temp, or old"
            }],
            "url" : "http://hl7.org/fhir/StructureDefinition/translation"
          }]
        },
        "valueSet" : "http://hl7.no/fhir/ig/lmdi/ValueSet/lmdi-address-use"
      }
    },
    {
      "id" : "Patient.address.type",
      "path" : "Patient.address.type",
      "short" : "physical",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "physical"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "patternCode" : "physical",
      "binding" : {
        "strength" : "required",
        "valueSet" : "http://hl7.no/fhir/ig/lmdi/ValueSet/lmdi-address-type"
      }
    },
    {
      "id" : "Patient.address.text",
      "path" : "Patient.address.text",
      "max" : "0"
    },
    {
      "id" : "Patient.address.line",
      "path" : "Patient.address.line",
      "max" : "0"
    },
    {
      "id" : "Patient.address.city",
      "path" : "Patient.address.city",
      "max" : "0"
    },
    {
      "id" : "Patient.address.district",
      "path" : "Patient.address.district",
      "short" : "Kommune",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Municipality"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Patient.address.district.extension:municipalitycode",
      "path" : "Patient.address.district.extension",
      "sliceName" : "municipalitycode",
      "short" : "Kodet verdi for kommune. Kodeverk \"Kommunenummer og regionale spesialkoder\" (OID 3402)",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Encoded municipality value. Code system \"Municipality numbers and regional special codes\" (OID 3402)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kodet verdi for kommune. Koder fra kodeverk \"Kommunenummer og regionale spesialkoder\" (OID 3402) skal benyttes",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Encoded municipality value. Codes from the code system \"Municipality numbers and regional special codes\" (OID 3402) shall be used."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Patient.address.state",
      "path" : "Patient.address.state",
      "short" : "Fylkesnavn",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "County name"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Patient.address.postalCode",
      "path" : "Patient.address.postalCode",
      "max" : "0"
    },
    {
      "id" : "Patient.address.country",
      "path" : "Patient.address.country",
      "max" : "0"
    },
    {
      "id" : "Patient.maritalStatus",
      "path" : "Patient.maritalStatus",
      "max" : "0"
    },
    {
      "id" : "Patient.multipleBirth[x]",
      "path" : "Patient.multipleBirth[x]",
      "max" : "0"
    },
    {
      "id" : "Patient.photo",
      "path" : "Patient.photo",
      "max" : "0"
    },
    {
      "id" : "Patient.contact",
      "path" : "Patient.contact",
      "max" : "0"
    },
    {
      "id" : "Patient.communication",
      "path" : "Patient.communication",
      "max" : "0"
    },
    {
      "id" : "Patient.generalPractitioner",
      "path" : "Patient.generalPractitioner",
      "max" : "0"
    },
    {
      "id" : "Patient.managingOrganization",
      "path" : "Patient.managingOrganization",
      "max" : "0"
    },
    {
      "id" : "Patient.link",
      "path" : "Patient.link",
      "max" : "0"
    }]
  }
}

```
