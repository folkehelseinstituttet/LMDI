# Pasient-1-Uten-FNR - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Pasient-1-Uten-FNR**

## Example Patient: Pasient-1-Uten-FNR

Profile: [Pasient](StructureDefinition-lmdi-patient.md)

Anonymous Patient Female, DoB: 1958-09-19

-------

| | |
| :--- | :--- |
| Contact Detail |  |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Pasient-1-Uten-FNR",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"
    ]
  },
  "gender" : "female",
  "birthDate" : "1958-09-19",
  "address" : [
    {
      "district" : "Bærum",
      "_district" : {
        "extension" : [
          {
            "url" : "http://hl7.no/fhir/StructureDefinition/no-basis-municipalitycode",
            "valueCoding" : {
              "system" : "urn:oid:2.16.578.1.12.4.1.1.3402",
              "code" : "3024",
              "display" : "Bærum"
            }
          }
        ]
      }
    }
  ]
}

```
