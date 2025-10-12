# Administrering-1-Oralt - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-1-Oralt**

## Example MedicationAdministration: Administrering-1-Oralt

Profile: [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md)

**status**: Completed

**medication**: [https://fhir.legemidler.example.com/legemidler/123456780](https://simplifier.net/resolve?scope=hl7.fhir.no.basis@2.2.0&canonical=https://fhir.legemidler.example.com/legemidler/123456780)

**subject**: [https://fhi.no/fhir/lmdi/pasient/12345678](https://simplifier.net/resolve?scope=hl7.fhir.no.basis@2.2.0&canonical=https://fhi.no/fhir/lmdi/pasient/12345678)

**context**: [https://fhi.no/fhir/lmdi/episode/428ff23d-7a65-4c67-8059-6a1d07d287e3](https://simplifier.net/resolve?scope=hl7.fhir.no.basis@2.2.0&canonical=https://fhi.no/fhir/lmdi/episode/428ff23d-7a65-4c67-8059-6a1d07d287e3)

**effective**: 2024-05-28

### Dosages

| | | |
| :--- | :--- | :--- |
| - | **Route** | **Dose** |
| * | Swallow | 2 metric tablespoon(Details: UCUM codetsp_us = 'tsp_us') |



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-1-Oralt",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"
    ]
  },
  "status" : "completed",
  "medicationReference" : {
    "reference" : "https://fhir.legemidler.example.com/legemidler/123456780"
  },
  "subject" : {
    "reference" : "https://fhi.no/fhir/lmdi/pasient/12345678"
  },
  "context" : {
    "reference" : "https://fhi.no/fhir/lmdi/episode/428ff23d-7a65-4c67-8059-6a1d07d287e3"
  },
  "effectiveDateTime" : "2024-05-28",
  "dosage" : {
    "route" : {
      "coding" : [
        {
          "system" : "http://snomed.info/sct",
          "code" : "421521009",
          "display" : "Swallow"
        }
      ]
    },
    "dose" : {
      "value" : 2,
      "unit" : "metric tablespoon",
      "system" : "http://unitsofmeasure.org",
      "code" : "tsp_us"
    }
  }
}

```
