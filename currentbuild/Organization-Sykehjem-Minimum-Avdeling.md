# Sykehjem-Minimum-Avdeling - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Sykehjem-Minimum-Avdeling**

## Example Organization: Sykehjem-Minimum-Avdeling



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "Sykehjem-Minimum-Avdeling",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.102",
    "value" : "7100001"
  }],
  "name" : "Avdeling 2B, Soltoppen sykehjem",
  "partOf" : {
    "reference" : "Organization/Sykehjem-Minimum-Sykehjem"
  }
}

```
