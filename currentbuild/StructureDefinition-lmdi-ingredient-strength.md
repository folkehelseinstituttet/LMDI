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

Mengde ingrediens i det rekvirerte/administrerte legemidlet, angitt som Quantity eller som kode. Angir enten mengden virkestoff av ingrediensen i det rekvirerte/administrerte legemidlet (f.eks. 100 mg) eller hvilket volum av ingrediensen som er brukt for å produsere det rekvirerte/administrerte legemidlet (f.eks. 10 mL). Når volum benyttes skal ingredient.item angi «utgangslegemidlet» som ble brukt for å produsere det rekvirerte/administrerte legemidlet på en slik måte at «utgangslegemidlets» styrke kan utledes. Dette er nødvendig for å kunne beregne mengde virkestoff og styrke av ingrediensen i det rekvirerte/administrerte legemidlet.

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

#### Terminology Bindings

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
  "description" : "Mengde ingrediens i det rekvirerte/administrerte legemidlet, angitt som Quantity eller som kode. Angir enten mengden virkestoff av ingrediensen i det rekvirerte/administrerte legemidlet (f.eks. 100 mg) eller hvilket volum av ingrediensen som er brukt for å produsere det rekvirerte/administrerte legemidlet (f.eks. 10 mL). Når volum benyttes skal ingredient.item angi «utgangslegemidlet» som ble brukt for å produsere det rekvirerte/administrerte legemidlet på en slik måte at «utgangslegemidlets» styrke kan utledes. Dette er nødvendig for å kunne beregne mengde virkestoff og styrke av ingrediensen i det rekvirerte/administrerte legemidlet.",
  "_description" : {
    "extension" : [{
      "extension" : [{
        "url" : "lang",
        "valueCode" : "en"
      },
      {
        "url" : "content",
        "valueString" : "Amount of the ingredient in the requested/administered medication, expressed as a Quantity or as a code. Specifies either the amount of active ingredient in the requested/administered medication (e.g. 100 mg), or the volume of the ingredient used to produce the requested/administered medication (e.g. 10 mL). When volume is used, ingredient.item shall specify the “starting medication” used to produce the requested/administered medication in such a way that the strength of the “starting medication” can be derived. This is necessary to calculate the amount of active ingredient and the strength of the ingredient in the requested/administered medication."
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
      "definition" : "Mengde ingrediens i det rekvirerte/administrerte legemidlet, angitt som Quantity eller som kode. Angir enten mengden virkestoff av ingrediensen i det rekvirerte/administrerte legemidlet (f.eks. 100 mg) eller hvilket volum av ingrediensen som er brukt for å produsere det rekvirerte/administrerte legemidlet (f.eks. 10 mL). Når volum benyttes skal ingredient.item angi «utgangslegemidlet» som ble brukt for å produsere det rekvirerte/administrerte legemidlet på en slik måte at «utgangslegemidlets» styrke kan utledes. Dette er nødvendig for å kunne beregne mengde virkestoff og styrke av ingrediensen i det rekvirerte/administrerte legemidlet."
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
      "type" : [{
        "code" : "CodeableConcept"
      },
      {
        "code" : "Quantity"
      }],
      "binding" : {
        "strength" : "preferred",
        "description" : "Medication Ingredient Strength Codes",
        "valueSet" : "http://hl7.org/fhir/ValueSet/medication-ingredientstrength"
      }
    }]
  }
}

```
