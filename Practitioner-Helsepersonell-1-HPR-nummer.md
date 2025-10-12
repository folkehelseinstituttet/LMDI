# Helsepersonell-1-HPR-nummer - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.7

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Helsepersonell-1-HPR-nummer**

## Example Practitioner: Helsepersonell-1-HPR-nummer

Profile: [Helsepersonell](StructureDefinition-lmdi-practitioner.md)

**identifier**: `urn:oid:2.16.578.1.12.4.1.4.4`/9144900



## Resource Content

```json
{
  "resourceType" : "Practitioner",
  "id" : "Helsepersonell-1-HPR-nummer",
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
