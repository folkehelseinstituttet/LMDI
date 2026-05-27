# Organisasjon - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Organisasjon**

## Resource Profile: Organisasjon 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization **  | *Version*:1.1.0 **  |
| Draft as of 2025-09-30 | *Computable Name*:Organisasjon |

 
Organisasjoner i norsk helse- og omsorgstjeneste, som post, avdeling, klinikk, sykehus og sykehjem. Basert på no-basis-Organization. 

**Usages:**

* Refer to this Profile: [Episode](StructureDefinition-lmdi-encounter.md) and [Organisasjon](StructureDefinition-lmdi-organization.md)
* Examples for this Profile: [Helse Møre og Romsdal HF](Organization-Organisasjon-HF-2.md), [Oslo universitetssykehus HF](Organization-Organisasjon-HF.md), [TRONDHEIM KOMMUNE](Organization-Organisasjon-Kommune.md), [HMR ÅLE SH Kreft og blodsjukdommar sengepost](Organization-Organisasjon-Post.md)... Show 5 more, [Kreft og blodsykdommer sengepost Ålesund](Organization-Organisasjon-Seksjon.md), [BYNESET OG NYPANTUNET HELSE- OG VELFERDSSENTER SYKEHJEM](Organization-Organisasjon-Sykehjem.md), [Helse Møre og Romsdal HF Ålesund sjukehus - Somatikk](Organization-Organisasjon-Sykehus-2.md), [OSLO UNIVERSITETSSYKEHUS HF SPESIALSYKEHUSET FOR EPILEPSI SSE - SOMATIKK](Organization-Organisasjon-Sykehus.md) and [Avdeling for epilepsi, poliklinikk](Organization-Organisasjon-Sykehusavdeling.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/hl7.fhir.no.lmdi|current/StructureDefinition/StructureDefinition-lmdi-organization.json)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-organization.csv), [Excel](StructureDefinition-lmdi-organization.xlsx), [Schematron](StructureDefinition-lmdi-organization.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-organization",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization",
  "version" : "1.1.0",
  "name" : "Organisasjon",
  "title" : "Organisasjon",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Organization"
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
  "description" : "Organisasjoner i norsk helse- og omsorgstjeneste, som post, avdeling, klinikk, sykehus og sykehjem. Basert på no-basis-Organization.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Organizations in the Norwegian health and care service, such as ward, department, clinic, hospital and nursing home. Based on no-basis-Organization."
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
  "type" : "Organization",
  "baseDefinition" : "http://hl7.no/fhir/StructureDefinition/no-basis-Organization",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Organization",
      "path" : "Organization",
      "constraint" : [{
        "key" : "lmdi-org-identifier",
        "severity" : "error",
        "human" : "Organisasjon skal ha minst ENH eller RSH identifier",
        "expression" : "identifier.where(system='urn:oid:2.16.578.1.12.4.1.4.101' or system='urn:oid:2.16.578.1.12.4.1.4.102').exists()",
        "source" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"
      }]
    },
    {
      "id" : "Organization.text",
      "path" : "Organization.text",
      "max" : "0"
    },
    {
      "id" : "Organization.identifier",
      "path" : "Organization.identifier",
      "short" : "ID fra Nasjonalt register for enheter i spesialisthelsetjenesten (RESH) eller Organisasjonsnummeret i Enhetsregister",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "ID from the Register for Units in Specialist Health Services (RESH) or the organization number in the Register of Legal Entities"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "comment" : "Der aktiviteten har skjedd.",
      "_comment" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Where the activity took place."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Organization.identifier:ENH",
      "path" : "Organization.identifier",
      "sliceName" : "ENH",
      "short" : "Organisasjonsnummer fra Enhetsregisteret (ENH)",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Organization number from the Register of Legal Entities (ENH)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "comment" : "Identifikatorer skal angis på laveste relevante virksomhetsnivå i henhold til SSBs retningslinjer. For kommunale tjenester betyr dette på institusjonsnivå (f.eks sykehjem) der egen organisatorisk enhet er etablert, ikke på overordnet kommunenivå.",
      "_comment" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Identifiers shall be specified at the lowest relevant organizational level according to Statistics Norway's guidelines. For municipal services, this means at institutional level (for example a nursing home) where a separate organizational unit is established, not at the overarching municipality level."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Organization.identifier:RSH",
      "path" : "Organization.identifier",
      "sliceName" : "RSH",
      "short" : "ID fra Register for enheter i spesialisthelsetjenesten (RESH)",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "ID from the Register for Units in Specialist Health Services (RESH)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "comment" : "Det nivået aktiviteten har skjedd på.",
      "_comment" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "The level at which the activity took place."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Organization.active",
      "path" : "Organization.active",
      "max" : "0"
    },
    {
      "id" : "Organization.type",
      "path" : "Organization.type",
      "short" : "Organisasjonstype",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Organization type"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Type organisasjon (f.eks. sykehus, avdeling, klinikk)",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Type of organization (for example hospital, department, clinic)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Organization.type:organisatoriskNiva",
      "path" : "Organization.type",
      "sliceName" : "organisatoriskNiva",
      "max" : "0"
    },
    {
      "id" : "Organization.type:organisatoriskBetegnelse",
      "path" : "Organization.type",
      "sliceName" : "organisatoriskBetegnelse",
      "short" : "Organisatorisk betegnelse. Kodeverk \"Organisatorisk betegnelse\" (OID 8624)",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Organizational designation. Code system \"Organizational designation\" (OID 8624)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Kode fra kodeverk \"Organisatorisk betegnelse\" (OID 8624) som beskriver type organisatorisk enhet (f.eks. sykehus, avdeling, klinikk)",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Code from the \"Organizational designation\" code system (OID 8624) describing the type of organizational unit (for example hospital, department, clinic)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Organization.name",
      "path" : "Organization.name",
      "short" : "Organisasjonsnavn",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Organization name"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Offisielt navn på organisasjonen",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Official name of the organization"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "comment" : "Kan være navn på post, avdelingsnavn, klinikknavn, sykehusnavn eller sykehjemsnavn",
      "_comment" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Can be the name of a ward, department, clinic, hospital, or nursing home"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "min" : 1,
      "mustSupport" : true
    },
    {
      "id" : "Organization.telecom",
      "path" : "Organization.telecom",
      "max" : "0"
    },
    {
      "id" : "Organization.address",
      "path" : "Organization.address",
      "short" : "Gjeldende fysisk adresse",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Current physical address"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "mustSupport" : true
    },
    {
      "id" : "Organization.address.extension:official",
      "path" : "Organization.address.extension",
      "sliceName" : "official",
      "max" : "0"
    },
    {
      "id" : "Organization.address.extension:urbanDistrict",
      "path" : "Organization.address.extension",
      "sliceName" : "urbanDistrict",
      "short" : "Encoded value for urban district. Code system \"Urban district numbers\" (OID 3403)",
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
      "definition" : "Encoded value for urban district. Codes from the code system \"Urban district numbers\" (OID 3403) shall be used.",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "Encoded value for urban district. Codes from the code system \"Urban district numbers\" (OID 3403) shall be used."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      }
    },
    {
      "id" : "Organization.address.extension:propertyInformation",
      "path" : "Organization.address.extension",
      "sliceName" : "propertyInformation",
      "max" : "0"
    },
    {
      "id" : "Organization.address.type",
      "path" : "Organization.address.type",
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
      "id" : "Organization.address.text",
      "path" : "Organization.address.text",
      "max" : "0"
    },
    {
      "id" : "Organization.address.line",
      "path" : "Organization.address.line",
      "max" : "0"
    },
    {
      "id" : "Organization.address.city",
      "path" : "Organization.address.city",
      "max" : "0"
    },
    {
      "id" : "Organization.address.district",
      "path" : "Organization.address.district",
      "short" : "Municipality",
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
      "id" : "Organization.address.district.extension:municipalitycode",
      "path" : "Organization.address.district.extension",
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
      "id" : "Organization.address.state",
      "path" : "Organization.address.state",
      "short" : "County name",
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
      "id" : "Organization.address.postalCode",
      "path" : "Organization.address.postalCode",
      "max" : "0"
    },
    {
      "id" : "Organization.address.country",
      "path" : "Organization.address.country",
      "max" : "0"
    },
    {
      "id" : "Organization.partOf",
      "path" : "Organization.partOf",
      "short" : "Organisasjonen er del av (overordnet organisasjon)",
      "_short" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "The organization is part of (parent organization)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "definition" : "Organisasjonen er del av (overordnet organisasjon)",
      "_definition" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "The organization is part of (parent organization)"
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-hierarchy",
          "valueBoolean" : true
        }],
        "code" : "Reference",
        "targetProfile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Organization.contact",
      "path" : "Organization.contact",
      "max" : "0"
    },
    {
      "id" : "Organization.endpoint",
      "path" : "Organization.endpoint",
      "max" : "0"
    }]
  }
}

```
