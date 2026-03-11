# Kjemoterapi-Full-Rekvirering - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Kjemoterapi-Full-Rekvirering**

## Example MedicationRequest: Kjemoterapi-Full-Rekvirering



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Kjemoterapi-Full-Rekvirering",
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
    "reference" : "Medication/Kjemoterapi-Full-Oksaliplatin-LokalKatalog"
  },
  "subject" : {
    "reference" : "Patient/Kjemoterapi-Full-Pasient"
  },
  "encounter" : {
    "reference" : "Encounter/Kjemoterapi-Full-Episode"
  },
  "authoredOn" : "2025-03-10",
  "requester" : {
    "reference" : "Practitioner/Kjemoterapi-Full-Helsepersonell"
  },
  "reasonReference" : [{
    "reference" : "Condition/Kjemoterapi-Full-Diagnose"
  }],
  "courseOfTherapyType" : {
    "text" : "Kjemoterapikur"
  },
  "priorPrescription" : {
    "reference" : "MedicationRequest/Kjemoterapi-Full-Forrige-Rekvirering"
  }
}

```
