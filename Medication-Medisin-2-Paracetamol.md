# Medisin-2-Paracetamol - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Medisin-2-Paracetamol**

## Example Medication: Medisin-2-Paracetamol

Profile: [Legemiddel](StructureDefinition-lmdi-medication.md)

**Legemiddel Classification**: Paracetamol

**identifier**: [festLegemiddelMerkevare](NamingSystem-no-basis-fest-legemiddelmerkevare.md)/2ABAC272-0BCF-43F0-84BE-984074D92E15

**code**: Paracetamol



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Medisin-2-Paracetamol",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"
    ]
  },
  "extension" : [
    {
      "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification",
      "valueCodeableConcept" : {
        "coding" : [
          {
            "system" : "http://www.whocc.no/atc",
            "code" : "N02BE01",
            "display" : "Paracetamol"
          }
        ]
      }
    }
  ],
  "identifier" : [
    {
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare",
      "value" : "2ABAC272-0BCF-43F0-84BE-984074D92E15"
    }
  ],
  "code" : {
    "coding" : [
      {
        "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare",
        "code" : "2ABAC272-0BCF-43F0-84BE-984074D92E15",
        "display" : "Paracetamol"
      }
    ]
  }
}

```
