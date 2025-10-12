# Pasient-2-FNR - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Pasient-2-FNR**

## Example Patient: Pasient-2-FNR

Profile: [Pasient](StructureDefinition-lmdi-patient.md)

Anonymous Patient (no stated gender), DoB Unknown ( urn:oid:2.16.578.1.12.4.1.4.1#13031353453)

-------

| | |
| :--- | :--- |
| Contact Detail |  |



## Resource Content

```json
{
  "resourceType" : "Patient",
  "id" : "Pasient-2-FNR",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient"
    ]
  },
  "identifier" : [
    {
      "system" : "urn:oid:2.16.578.1.12.4.1.4.1",
      "value" : "13031353453"
    }
  ],
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
