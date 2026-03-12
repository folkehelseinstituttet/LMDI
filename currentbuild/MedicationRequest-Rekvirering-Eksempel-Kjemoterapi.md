# Rekvirering-Eksempel-Kjemoterapi - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Rekvirering-Eksempel-Kjemoterapi**

## Example MedicationRequest: Rekvirering-Eksempel-Kjemoterapi



## Resource Content

```json
{
  "resourceType" : "MedicationRequest",
  "id" : "Rekvirering-Eksempel-Kjemoterapi",
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
  "status" : "active",
  "intent" : "order",
  "medicationReference" : {
    "reference" : "Medication/Legemiddel-Eksempel-Oksykodon-FEST-Virkestoff"
  },
  "subject" : {
    "reference" : "Patient/Pasient-Eksempel-Med-FNR"
  },
  "authoredOn" : "2025-03-10",
  "requester" : {
    "reference" : "Practitioner/Helsepersonell-Eksempel-Med-HPR"
  }
}

```
