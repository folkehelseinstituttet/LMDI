# Rekvirering-Scenario-Kjemoterapi-Full-Gjeldende - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rekvirering-Scenario-Kjemoterapi-Full-Gjeldende**

## Example MedicationRequest: Rekvirering-Scenario-Kjemoterapi-Full-Gjeldende



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Rekvirering-Scenario-Kjemoterapi-Full-Gjeldende",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest"]
  },
  "extension" : [{
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-prosentvis-doseendring",
    "valueQuantity" : {
      "value" : 80,
      "unit" : "%",
      "system" : "http://unitsofmeasure.org",
      "code" : "%"
    }
  },
  {
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-del-av-behandlingsregime",
    "valueString" : "FOLFOX6"
  },
  {
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-klinisk-studie",
    "valueBoolean" : true
  }],
  "identifier" : [{
    "system" : "http://example.org/rekvirering-id",
    "value" : "KJEMO-2025-002"
  }],
  "status" : "active",
  "intent" : "order",
  "reportedBoolean" : false,
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-Scenario-Kjemoterapi-Full-Oksaliplatin-LokalKatalog"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Scenario-Kjemoterapi-Full-Med-FNR"
  },
  "encounter" : {
    "reference" : "Encounter/Episode-Scenario-Kjemoterapi-Full-Innleggelse"
  },
  "authoredOn" : "2025-03-10",
  "requester" : {
    "reference" : "Practitioner/Helsepersonell-Scenario-Kjemoterapi-Full-Rekvirent"
  },
  "reasonReference" : [{
    "reference" : "Condition/Diagnose-Scenario-Kjemoterapi-Full-Kreftdiagnose"
  }],
  "courseOfTherapyType" : {
    "text" : "Kjemoterapikur"
  },
  "priorPrescription" : {
    "reference" : "MedicationRequest/Rekvirering-Scenario-Kjemoterapi-Full-Forrige"
  }
}

```
