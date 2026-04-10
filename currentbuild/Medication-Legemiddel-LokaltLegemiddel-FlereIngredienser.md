# Legemiddel-LokaltLegemiddel-FlereIngredienser - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Legemiddel-LokaltLegemiddel-FlereIngredienser**

## Example Medication: Legemiddel-LokaltLegemiddel-FlereIngredienser



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Legemiddel-LokaltLegemiddel-FlereIngredienser",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
  },
  "code" : {
    "coding" : [{
      "system" : "http://fhi.no/fhir/NamingSystem/lokaltLegemiddel",
      "code" : "lokal-ketamin-haloperidol-klonidin-midazolam",
      "display" : "Lokalt legemiddel med ketamin, haloperidol, klonidin og midazolam"
    }]
  },
  "ingredient" : [{
    "itemCodeableConcept" : {
      "coding" : [{
        "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare",
        "code" : "ID_28C1C9F5-0D9C-4F5F-9823-A0BC8643CFE9",
        "display" : "Ketamin Abcur inj, oppl 10 mg/ml"
      }]
    },
    "strength" : {
      "numerator" : {
        "value" : 2,
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      },
      "denominator" : {
        "value" : 1,
        "system" : "http://unitsofmeasure.org",
        "code" : "mL"
      }
    }
  },
  {
    "itemCodeableConcept" : {
      "coding" : [{
        "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare",
        "code" : "ID_5B77F59F-8C66-4C5F-80F7-1EB54FB5E66C",
        "display" : "Haldol inj, oppl 5 mg/ml"
      }]
    },
    "strength" : {
      "numerator" : {
        "value" : 0.5,
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      },
      "denominator" : {
        "value" : 1,
        "system" : "http://unitsofmeasure.org",
        "code" : "mL"
      }
    }
  },
  {
    "itemCodeableConcept" : {
      "coding" : [{
        "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning",
        "code" : "ID_F19264C9-4802-4AE7-93FB-4A1D26D18A8F",
        "display" : "Catapresan øresund inj, oppl 150 mikrog/ml"
      }]
    },
    "strength" : {
      "numerator" : {
        "value" : 1.5,
        "system" : "http://unitsofmeasure.org",
        "code" : "ug"
      },
      "denominator" : {
        "value" : 1,
        "system" : "http://unitsofmeasure.org",
        "code" : "mL"
      }
    }
  },
  {
    "itemCodeableConcept" : {
      "coding" : [{
        "system" : "http://dmp.no/fhir/NamingSystem/fest-varenummer",
        "code" : "156660",
        "display" : "Midazolam Accordpharma inj/inf, oppl 1 mg/ml"
      }]
    },
    "strength" : {
      "numerator" : {
        "value" : 0.2,
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      },
      "denominator" : {
        "value" : 1,
        "system" : "http://unitsofmeasure.org",
        "code" : "mL"
      }
    }
  }]
}

```
