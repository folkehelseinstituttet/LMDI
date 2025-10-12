# Administrering-30 - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-30**

## Example MedicationAdministration: Administrering-30

**status**: Completed

**medication**: Identifier: `uri:eu:spor:idmp:mpid:dummy`/1a38f25a8791fc3270e7c388f2031eee

**subject**: [https://fhi.no/fhir/lmdi/pasient/12345678](https://simplifier.net/resolve?scope=hl7.fhir.no.basis@2.2.0&canonical=https://fhi.no/fhir/lmdi/pasient/12345678)

**effective**: 2024-05-28

### Dosages

| | | |
| :--- | :--- | :--- |
| - | **Route** | **Dose** |
| * | Intravenous route (qualifier value) | 100 mg(Details: UCUM codemg = 'mg') |



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-30",
  "status" : "completed",
  "medicationReference" : {
    "identifier" : {
      "system" : "uri:eu:spor:idmp:mpid:dummy",
      "value" : "1a38f25a8791fc3270e7c388f2031eee"
    }
  },
  "subject" : {
    "reference" : "https://fhi.no/fhir/lmdi/pasient/12345678"
  },
  "effectiveDateTime" : "2024-05-28",
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
      "value" : 100,
      "system" : "http://unitsofmeasure.org",
      "code" : "mg"
    }
  }
}

```
