# Scenario-A-Org-Avdeling - Legemiddeldata fra institusjon til Legemiddelregisteret v1.0.8

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Scenario-A-Org-Avdeling**

## Example Organization: Scenario-A-Org-Avdeling

Profile: [Organisasjon](StructureDefinition-lmdi-organization.md)

**identifier**: `urn:oid:2.16.578.1.12.4.1.4.102`/7100001

**name**: Avdeling 2B, Soltoppen sykehjem

**partOf**: [Organization Soltoppen sykehjem](Organization-Scenario-A-Org-Sykehjem.md)



## Resource Content

```json
{
  "resourceType" : "Organization",
  "id" : "Scenario-A-Org-Avdeling",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization"]
  },
  "identifier" : [{
    "system" : "urn:oid:2.16.578.1.12.4.1.4.102",
    "value" : "7100001"
  }],
  "name" : "Avdeling 2B, Soltoppen sykehjem",
  "partOf" : {
    "reference" : "Organization/Scenario-A-Org-Sykehjem"
  }
}

```
