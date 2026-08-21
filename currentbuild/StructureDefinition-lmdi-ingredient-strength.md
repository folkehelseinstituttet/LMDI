# Mengde ingrediens - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.3

* [Hjem](index.md)
* [Informasjonsmodell](informasjonsmodell.md)
* [Integrasjon](integrasjon.md)
* [FHIR-profiler](profiler.md)
* [Nedlastinger](nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Mengde ingrediens**

## Extension: Mengde ingrediens 

| | |
| :--- | :--- |
| *Official URL*:http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-ingredient-strength **  | *Version*:1.1.3 **  |
| Draft as of 2026-08-18 | *Computable Name*:IngrediensStyrke |

Mengde ingrediens i det rekvirerte/administrerte legemidlet, angitt som Quantity eller som CodeableConcept.

Ved Quantity: Enten mengden virkestoff av ingrediensen i det rekvirerte/administrerte legemidlet (f.eks. 100 mg) eller hvilket volum av ingrediensen som er brukt for å produsere det rekvirerte/administrerte legemidlet (f.eks. 10 mL). Når volum benyttes skal ingredient.item angi «utgangslegemidlet» som ble brukt for å produsere det rekvirerte/administrerte legemidlet på en slik måte at «utgangslegemidlets» styrke kan utledes. Dette er nødvendig for å kunne beregne mengde virkestoff og styrke av ingrediensen i det rekvirerte/administrerte legemidlet.

Ved CodeableConcept: Kodet verdi som angir mengden ingrediens, f.eks. qs eller trace. F.eks. fra kodeverk “Angi at bestanddel i legemiddelblanding ikke har eksakt mengde” (OID 7502) eller “Medication-ingredientstrength” http://hl7.org/fhir/CodeSystem/medication-ingredientstrength

**Context of Use**

This extension may be used on the following element(s):

* Element ID Medication.ingredient.strength

**Usage info**

**Usages:**

* Use this Extension: [Legemiddel](StructureDefinition-lmdi-medication.md)
* Examples for this Extension: [Medication/Legemiddel-Smerteblanding](Medication-Legemiddel-Smerteblanding.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/hl7.fhir.no.lmdi|current/StructureDefinition/StructureDefinition-lmdi-ingredient-strength.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-lmdi-ingredient-strength.csv), [Excel](StructureDefinition-lmdi-ingredient-strength.xlsx), [Schematron](StructureDefinition-lmdi-ingredient-strength.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "lmdi-ingredient-strength",
  "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-ingredient-strength",
  "version" : "1.1.3",
  "name" : "IngrediensStyrke",
  "title" : "Mengde ingrediens",
  "_title" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Amount of ingredient"
      }],
      "url" : "http://hl7.org/fhir/StructureDefinition/translation"
    }]
  },
  "status" : "draft",
  "date" : "2026-08-18",
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
  "description" : "Mengde ingrediens i det rekvirerte/administrerte legemidlet, angitt som Quantity eller som CodeableConcept.\n\nVed Quantity: Enten mengden virkestoff av ingrediensen i det rekvirerte/administrerte legemidlet (f.eks. 100 mg) eller hvilket volum av ingrediensen som er brukt for å produsere det rekvirerte/administrerte legemidlet (f.eks. 10 mL). Når volum benyttes skal ingredient.item angi «utgangslegemidlet» som ble brukt for å produsere det rekvirerte/administrerte legemidlet på en slik måte at «utgangslegemidlets» styrke kan utledes. Dette er nødvendig for å kunne beregne mengde virkestoff og styrke av ingrediensen i det rekvirerte/administrerte legemidlet.\n\nVed CodeableConcept: Kodet verdi som angir mengden ingrediens, f.eks. qs eller trace. F.eks. fra kodeverk \"Angi at bestanddel i legemiddelblanding ikke har eksakt mengde\" (OID 7502) eller \"Medication-ingredientstrength\" http://hl7.org/fhir/CodeSystem/medication-ingredientstrength",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Amount of the ingredient in the requested/administered medication, expressed as a Quantity or as a CodeableConcept.\n\nFor Quantity: Either the amount of active ingredient in the requested/administered medication (e.g. 100 mg), or the volume of the ingredient used to produce the requested/administered medication (e.g. 10 mL). When volume is used, ingredient.item shall specify the “starting medication” used to produce the requested/administered medication in such a way that the strength of the “starting medication” can be derived. This is necessary to calculate the amount of active ingredient and the strength of the ingredient in the requested/administered medication.\n\nFor CodeableConcept: A coded value specifying the amount of the ingredient, e.g. qs or trace. For example from the Norwegian code system for components of a medication mixture without an exact amount (OID 7502), or \"Medication-ingredientstrength\" http://hl7.org/fhir/CodeSystem/medication-ingredientstrength"
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
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Medication.ingredient.strength"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Mengde ingrediens",
      "definition" : "Mengde ingrediens i det rekvirerte/administrerte legemidlet, angitt som Quantity eller som CodeableConcept.\n\nVed Quantity: Enten mengden virkestoff av ingrediensen i det rekvirerte/administrerte legemidlet (f.eks. 100 mg) eller hvilket volum av ingrediensen som er brukt for å produsere det rekvirerte/administrerte legemidlet (f.eks. 10 mL). Når volum benyttes skal ingredient.item angi «utgangslegemidlet» som ble brukt for å produsere det rekvirerte/administrerte legemidlet på en slik måte at «utgangslegemidlets» styrke kan utledes. Dette er nødvendig for å kunne beregne mengde virkestoff og styrke av ingrediensen i det rekvirerte/administrerte legemidlet.\n\nVed CodeableConcept: Kodet verdi som angir mengden ingrediens, f.eks. qs eller trace. F.eks. fra kodeverk \"Angi at bestanddel i legemiddelblanding ikke har eksakt mengde\" (OID 7502) eller \"Medication-ingredientstrength\" http://hl7.org/fhir/CodeSystem/medication-ingredientstrength"
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-ingredient-strength"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "comment" : "Ved kodet mengde anbefales det norske kodeverket med OID 2.16.578.1.12.4.1.1.7502, eller kodeverket medication-ingredientstrength fra FHIR R5 (kodene qs og trace).",
      "_comment" : {
        "extension" : [{
          "extension" : [{
            "url" : "lang",
            "valueCode" : "en"
          },
          {
            "url" : "content",
            "valueString" : "For a coded amount, the recommended code systems are the Norwegian code system with OID 2.16.578.1.12.4.1.1.7502, or the FHIR R5 code system medication-ingredientstrength (codes qs and trace)."
          }],
          "url" : "http://hl7.org/fhir/StructureDefinition/translation"
        }]
      },
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "Quantity"
      }]
    }]
  }
}

```
