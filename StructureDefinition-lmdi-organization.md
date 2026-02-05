# Organisasjon - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Organisasjon**

## Resource Profile: Organisasjon 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization **  | *Version*:1.0.7 **  |
| Draft as of 2025-09-30 | *Computable Name*:Organisasjon |

 
Organisasjoner i norsk helse- og omsorgstjeneste, som post, avdeling, klinikk, sykehus og sykehjem, basert på no-basis-Organization. 
Denne profilen av Organization benyttes for å beskrive helseinstitusjoner og skal representere organisasjonen på lavest mulig nivå i organisasjonshierarkiet (f.eks. en avdeling eller klinikk eller post). For organisasjonen som er del av en større organisasjon, skal dette angis ved hjelp av partOf-relasjonen. 
Det er ønskelig at minimum følgende inngår i “organisasjonshierarkiet”: 
* organisasjonen på lavest mulig nivå (dvs. post, enhet, avdeling eller lignende)
* organisasjonen på høyre nivå 
* sykehus, Helseforetak og Regionalt Helseforetak
* sykehjem, kommune
 
* minst ett organisasjonsnummer fra enten Enhetsregisteret (identifier:ENH) eller Register for enheter i spesialisthelsetjenesten (identifier:RSH)
 

**Usages:**

* Refer to this Profile: [Episode](StructureDefinition-lmdi-encounter.md) and [Organisasjon](StructureDefinition-lmdi-organization.md)
* Examples for this Profile: [Lykkedalen sykehjem](Organization-Organisasjon-1-Sykehjem.md), [Avdeling for epilepsi, poliklinikk](Organization-Organisasjon-2-Avdeling.md) and [Oslo universitetssykehus HF](Organization-Organisasjon-3-Sykehus.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/hl7.fhir.no.lmdi|current/StructureDefinition/lmdi-organization)

### Formal Views of Profile Content

 [Description of Profiles, Differentials, Snapshots and how the different presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-organization.csv), [Excel](StructureDefinition-lmdi-organization.xlsx), [Schematron](StructureDefinition-lmdi-organization.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-organization",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization",
  "version" : "1.0.7",
  "name" : "Organisasjon",
  "title" : "Organisasjon",
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
  "description" : "Organisasjoner i norsk helse- og omsorgstjeneste, som post, avdeling, klinikk, sykehus og sykehjem, basert på no-basis-Organization.\n\nDenne profilen av Organization benyttes for å beskrive helseinstitusjoner og skal representere organisasjonen på lavest mulig nivå i organisasjonshierarkiet (f.eks. en avdeling eller klinikk eller post). For organisasjonen som er del av en større organisasjon, skal dette angis ved hjelp av partOf-relasjonen.\n\nDet er ønskelig at minimum følgende inngår i \"organisasjonshierarkiet\":\n- organisasjonen på lavest mulig nivå (dvs. post, enhet, avdeling eller lignende)\n- organisasjonen på høyre nivå\n     - sykehus, Helseforetak og Regionalt Helseforetak\n     - sykehjem, kommune\n- minst ett organisasjonsnummer fra enten Enhetsregisteret (identifier:ENH) eller Register for enheter i spesialisthelsetjenesten (identifier:RSH)",
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
  "type" : "Organization",
  "baseDefinition" : "http://hl7.no/fhir/StructureDefinition/no-basis-Organization",
  "derivation" : "constraint",
  "differential" : {
    "element" : [
      {
        "id" : "Organization",
        "path" : "Organization",
        "constraint" : [
          {
            "key" : "lmdi-org-identifier",
            "severity" : "error",
            "human" : "Organisasjon skal ha minst ENH eller RSH identifier",
            "expression" : "identifier.where(system='urn:oid:2.16.578.1.12.4.1.4.101' or system='urn:oid:2.16.578.1.12.4.1.4.102').exists()",
            "source" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"
          }
        ]
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
        "comment" : "Der aktiviteten har skjedd.",
        "mustSupport" : true
      },
      {
        "id" : "Organization.identifier:ENH",
        "path" : "Organization.identifier",
        "sliceName" : "ENH",
        "short" : "Organisasjonsnummer fra Enhetsregisteret (ENH)",
        "comment" : "Identifikatorer skal angis på laveste relevante virksomhetsnivå i henhold til SSBs retningslinjer. For kommunale tjenester betyr dette på institusjonsnivå (f.eks sykehjem) der egen organisatorisk enhet er etablert, ikke på overordnet kommunenivå."
      },
      {
        "id" : "Organization.identifier:RSH",
        "path" : "Organization.identifier",
        "sliceName" : "RSH",
        "short" : "ID fra Register for enheter i spesialisthelsetjenesten (RESH)",
        "comment" : "Det nivået aktiviteten har skjedd på."
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
        "definition" : "Type organisasjon (f.eks. sykehus, avdeling, klinikk)"
      },
      {
        "id" : "Organization.name",
        "path" : "Organization.name",
        "short" : "Organisasjonsnavn",
        "definition" : "Offisielt navn på organisasjonen",
        "comment" : "Kan være navn på post, avdelingsnavn, klinikknavn, sykehusnavn eller sykehjemsnavn",
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
        "short" : "Kodet verdi for bydel. Kodeverk \"Bydelsnummer\" (OID 3403)",
        "definition" : "Kodet verdi for bydel. Koder fra kodeverk \"Bydelsnummer\" (OID 3403) skal benyttes"
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
        "short" : "Kommune"
      },
      {
        "id" : "Organization.address.district.extension:municipalitycode",
        "path" : "Organization.address.district.extension",
        "sliceName" : "municipalitycode",
        "short" : "Kodet verdi for kommune. Kodeverk \"Kommunenummer og regionale spesialkoder\" (OID 3402)",
        "definition" : "Kodet verdi for kommune. Koder fra kodeverk \"Kommunenummer og regionale spesialkoder\" (OID 3402) skal benyttes"
      },
      {
        "id" : "Organization.address.state",
        "path" : "Organization.address.state",
        "short" : "Fylkesnavn"
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
        "definition" : "Organisasjonen er del av (overordnet organisasjon)",
        "type" : [
          {
            "extension" : [
              {
                "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-hierarchy",
                "valueBoolean" : true
              }
            ],
            "code" : "Reference",
            "targetProfile" : [
              "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"
            ]
          }
        ],
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
      }
    ]
  }
}

```
