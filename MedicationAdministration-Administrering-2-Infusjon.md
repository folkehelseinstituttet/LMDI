# Administrering-2-Infusjon - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-2-Infusjon**

## Example MedicationAdministration: Administrering-2-Infusjon

Profile: [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md)

**status**: Completed

**medication**: [https://fhir.legemidler.example.com/legemidler/0987654321](https://simplifier.net/resolve?scope=hl7.fhir.no.basis@2.2.0&canonical=https://fhir.legemidler.example.com/legemidler/0987654321)

**subject**: [https://fhi.no/fhir/lmdi/pasient/12345678](https://simplifier.net/resolve?scope=hl7.fhir.no.basis@2.2.0&canonical=https://fhi.no/fhir/lmdi/pasient/12345678)

**context**: [https://fhi.no/fhir/lmdi/institusjonsopphold/428ff23d-7a65-4c67-8059-6a1d07d287e3](https://simplifier.net/resolve?scope=hl7.fhir.no.basis@2.2.0&canonical=https://fhi.no/fhir/lmdi/institusjonsopphold/428ff23d-7a65-4c67-8059-6a1d07d287e3)

**effective**: 2024-06-13 14:26:01+0200 --> 2024-06-13 14:48:47+0200

### Dosages

| | | | |
| :--- | :--- | :--- | :--- |
| - | **Route** | **Dose** | **Rate[x]** |
| * | Intravenous route (qualifier value) | 4500 mg(Details: UCUM codemg = 'mg') | 8 ml(Details: UCUM codeml = 'ml')/1 min(Details: UCUM codemin = 'min') |



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-2-Infusjon",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
    ]
  },
  "status" : "completed",
  "medicationReference" : {
    "reference" : "https://fhir.legemidler.example.com/legemidler/0987654321"
  },
  "subject" : {
    "reference" : "https://fhi.no/fhir/lmdi/pasient/12345678"
  },
  "context" : {
    "reference" : "https://fhi.no/fhir/lmdi/institusjonsopphold/428ff23d-7a65-4c67-8059-6a1d07d287e3"
  },
  "effectivePeriod" : {
    "start" : "2024-06-13T14:26:01+02:00",
    "end" : "2024-06-13T14:48:47+02:00"
  },
  "dosage" : {
    "route" : {
      "coding" : [
        {
          "system" : "http://snomed.info/sct",
          "code" : "47625008",
          "display" : "Intravenous route (qualifier value)"
        }
      ]
    },
    "dose" : {
      "value" : 4500,
      "unit" : "mg",
      "system" : "http://unitsofmeasure.org",
      "code" : "mg"
    },
    "rateRatio" : {
      "numerator" : {
        "value" : 8,
        "system" : "http://unitsofmeasure.org",
        "code" : "ml"
      },
      "denominator" : {
        "value" : 1,
        "system" : "http://unitsofmeasure.org",
        "code" : "min"
      }
    }
  }
}

```
