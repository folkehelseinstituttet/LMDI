# Scenario-A-Pasient - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario-A-Pasient**

## Example Patient: Scenario-A-Pasient

Profile: [Pasient](StructureDefinition-lmdi-patient.md)

Anonymous Patient Female, DoB: 1945-04-12 ( urn:oid:2.16.578.1.12.4.1.4.1#12045678901)

-------

| | |
| :--- | :--- |
| Contact Detail |  |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Scenario-A-Pasient",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.1",
    "value" : "12045678901"
  }],
  "gender" : "female",
  "birthDate" : "1945-04-12",
  "address" : [{
    "district" : "Drammen",
    "_district" : {
      "extension" : [{
        "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
        "valueCoding" : {
          "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
          "code" : "3005",
          "display" : "Drammen"
        }
      }]
    }
  }]
}

```
