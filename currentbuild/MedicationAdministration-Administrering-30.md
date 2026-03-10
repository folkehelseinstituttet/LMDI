# Administrering-30 - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Administrering-30**

## Example MedicationAdministration: Administrering-30

Profile: [Legemiddeladministrering](StructureDefinition-lmdi-medicationadministration.md)

**status**: Completed

**medication**: Identifier: `uri:eu:spor:idmp:mpid:dummy`/1a38f25a8791fc3270e7c388f2031eee

**subject**: [https://fhi.no/fhir/lmdi/pasient/12345678](https://simplifier.net/resolve?scope=hl7.fhir.no.basis@2.2.0&canonical=https://fhi.no/fhir/lmdi/pasient/12345678)

**context**: [https://fhi.no/fhir/lmdi/episode/428ff23d-7a65-4c67-8059-6a1d07d287e3](https://simplifier.net/resolve?scope=hl7.fhir.no.basis@2.2.0&canonical=https://fhi.no/fhir/lmdi/episode/428ff23d-7a65-4c67-8059-6a1d07d287e3)

**effective**: 2024-05-28 14:30:00+0200

### Dosages

| | | |
| :--- | :--- | :--- |
| - | **Route** | **Dose** |
| * | Intravenous route (qualifier value) | 100 mg (Details: UCUM codemg = 'mg') |



## Resource Content

```json
{
  "resourceType" : "MedicationAdministration",
  "id" : "Administrering-30",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration"]
  },
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
  "context" : {
    "reference" : "https://fhi.no/fhir/lmdi/episode/428ff23d-7a65-4c67-8059-6a1d07d287e3"
  },
  "effectiveDateTime" : "2024-05-28T14:30:00+02:00",
  "dosage" : {
    "route" : {
      "coding" : [{
        "system" : "http://snomed.info/sct",
        "code" : "47625008",
        "display" : "Intravenous route (qualifier value)"
      }]
    },
    "dose" : {
      "value" : 100,
      "unit" : "mg",
      "system" : "http://unitsofmeasure.org",
      "code" : "mg"
    }
  }
}

```
