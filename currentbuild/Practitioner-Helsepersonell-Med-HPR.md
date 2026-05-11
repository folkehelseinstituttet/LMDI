# Helsepersonell-Med-HPR - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Helsepersonell-Med-HPR**

## Example Practitioner: Helsepersonell-Med-HPR

Profile: [Helsepersonell](StructureDefinition-lmdi-practitioner.md)

**identifier**: `urn:oid:2.16.578.1.12.4.1.4.4`/9144900



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "Helsepersonell-Med-HPR",
  "meta" : {
    "profile" : [
      "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-practitioner"
    ]
  },
  "identifier" : [
    {
      "system" : "urn:oid:2.16.578.1.12.4.1.4.4",
      "value" : "9144900"
    }
  ]
}

```
