# Legemiddel-Lokalt-Med-Flere-Ingredienser - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Legemiddel-Lokalt-Med-Flere-Ingredienser**

## Example Medication: Legemiddel-Lokalt-Med-Flere-Ingredienser



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Legemiddel-Lokalt-Med-Flere-Ingredienser",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
  },
  "code" : {
    "coding" : [{
      "system" : "http://fhi.no/fhir/NamingSystem/lokaltLegemiddel",
      "code" : "lokal-ketamin-deksametason-haloperidol-klonidin-midazolam-ondansetron",
      "display" : "Lokalt legemiddel med ketamin, deksametason, haloperidol, klonidin, midazolam og ondansetron"
    }]
  },
  "ingredient" : [{
    "itemCodeableConcept" : {
      "text" : "Ketamin"
    },
    "strength" : {
      "numerator" : {
        "value" : 10,
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      },
      "denominator" : {
        "value" : 1,
        "system" : "http://unitsofmeasure.org",
        "code" : "1"
      }
    }
  },
  {
    "itemCodeableConcept" : {
      "text" : "Deksametason"
    },
    "strength" : {
      "numerator" : {
        "value" : 4,
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      },
      "denominator" : {
        "value" : 1,
        "system" : "http://unitsofmeasure.org",
        "code" : "1"
      }
    }
  },
  {
    "itemCodeableConcept" : {
      "text" : "Haloperidol"
    },
    "strength" : {
      "numerator" : {
        "value" : 5,
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      },
      "denominator" : {
        "value" : 1,
        "system" : "http://unitsofmeasure.org",
        "code" : "1"
      }
    }
  },
  {
    "itemCodeableConcept" : {
      "text" : "Klonidin"
    },
    "strength" : {
      "numerator" : {
        "value" : 150,
        "system" : "http://unitsofmeasure.org",
        "code" : "ug"
      },
      "denominator" : {
        "value" : 1,
        "system" : "http://unitsofmeasure.org",
        "code" : "1"
      }
    }
  },
  {
    "itemCodeableConcept" : {
      "text" : "Midazolam"
    },
    "strength" : {
      "numerator" : {
        "value" : 5,
        "system" : "http://unitsofmeasure.org",
        "code" : "mg"
      },
      "denominator" : {
        "value" : 1,
        "system" : "http://unitsofmeasure.org",
        "code" : "1"
      }
    }
  },
  {
    "itemCodeableConcept" : {
      "text" : "Ondansetron"
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
        "code" : "1"
      }
    }
  }]
}

```
