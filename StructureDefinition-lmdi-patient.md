# Pasient - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Pasient**

## Resource Profile: Pasient 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient** | *Version*:1.0.7** |
| Draft as of 2025-09-30 | *Computable Name*:Pasient |

 
Pasienten som har fått rekvirert eller administrert legemiddel, basert på no-basis-Patient 

**Usages:**

* Refer to this Profile: [Diagnose](StructureDefinition-lmdi-condition.md), [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md) and [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.md)
* Examples for this Profile: [Patient/Pasient-1-Uten-FNR](Patient-Pasient-1-Uten-FNR.md) and [Patient/Pasient-2-FNR](Patient-Pasient-2-FNR.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.no.lmdi|current/StructureDefinition/lmdi-patient)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-patient.csv), [Excel](StructureDefinition-lmdi-patient.xlsx), [Schematron](StructureDefinition-lmdi-patient.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-patient",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient",
  "version" : "1.0.7",
  "name" : "Pasient",
  "title" : "Pasient",
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
  "description" : "Pasienten som har fått rekvirert eller administrert legemiddel, basert på no-basis-Patient",
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
  "kind" : "resource",
  "abstract" : false,
  "type" : "Patient",
  "baseDefinition" : "http://hl7.no/fhir/StructureDefinition/no-basis-Patient",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
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
        "definition" : "Identifikator for pasienten. Skal være fødselsnummer (FNR) eller D-nummer (DNR).",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:FNR",
        "path" : "Patient.identifier",
        "sliceName" : "FNR",
        "short" : "Fødselsnummer",
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:FNR.value",
        "path" : "Patient.identifier.value",
        "short" : "Fødselsnummeret (11 siffer)",
        "example" : [
          {
            "label" : "Fødselsnummer",
            "valueString" : "12345678901"
          },
          {
            "label" : "Fødselsnummer",
            "valueString" : "13057444850"
          }
        ]
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
        "max" : "1",
        "mustSupport" : true
      },
      {
        "id" : "Patient.identifier:DNR.value",
        "path" : "Patient.identifier.value",
        "short" : "D-nummer (11 siffer)",
        "example" : [
          {
            "label" : "D-nummer",
            "valueString" : "12345678901"
          }
        ]
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
        "definition" : "Pasientens kjønn.",
        "mustSupport" : true
      },
      {
        "id" : "Patient.birthDate",
        "path" : "Patient.birthDate",
        "short" : "Fødselsdato",
        "definition" : "Pasientens fødselsdato.",
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
        "definition" : "Kodet verdi for bydel. Koder fra kodeverk \"Bydelsnummer\" (OID 3403) skal benyttes"
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
        "definition" : "Adressetype begrenset til home, temp eller old",
        "constraint" : [
          {
            "key" : "address-use-constraint",
            "severity" : "error",
            "human" : "Kun home, temp eller old er tillatt for address.use",
            "expression" : "address.use.empty() or address.use in ('home' | 'temp' | 'old')",
            "source" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"
          }
        ],
        "binding" : {
          "strength" : "required",
          "description" : "Tillatte verdier er home, temp eller old",
          "valueSet" : "http://hl7.no/fhir/ig/lmdi/ValueSet/lmdi-address-use"
        }
      },
      {
        "id" : "Patient.address.type",
        "path" : "Patient.address.type",
        "short" : "physical",
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
        "short" : "Kommune"
      },
      {
        "id" : "Patient.address.district.extension:municipalitycode",
        "path" : "Patient.address.district.extension",
        "sliceName" : "municipalitycode",
        "short" : "Kodet verdi for kommune. Kodeverk \"Kommunenummer og regionale spesialkoder\" (OID 3402)",
        "definition" : "Kodet verdi for kommune. Koder fra kodeverk \"Kommunenummer og regionale spesialkoder\" (OID 3402) skal benyttes"
      },
      {
        "id" : "Patient.address.state",
        "path" : "Patient.address.state",
        "short" : "Fylkesnavn"
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
      }
    ]
  }
}

```
