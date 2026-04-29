# Legemiddel-FestLegemiddelpakning - Legemiddeldata fra institusjon til Legemiddelregisteret v1.1.0

*  [Hjem](index.md) 
*  [Informasjonsmodell](informasjonsmodell.md) 
*  [Integrasjon](integrasjon.md) 
*  [FHIR-profiler](profiler.md) 
*  [Nedlastinger](nedlastinger.md) 

* [Home](en-index.md)
* [Information Model](en-informasjonsmodell.md)
* [Integration](en-integrasjon.md) 
* [Protocol](en-protokoll.md)
* [SignedEncryptedBundle](en-SignertKryptertBundle.md)
* [C# Example Code](en-eksempelkode_cs.md)
* [PowerShell Example Code](en-eksempelkode_ps1.md)
 
* [FHIR Profiles](en-profiler.md)
* [Downloads](en-nedlastinger.md)

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Legemiddel-FestLegemiddelpakning**

## Example Medication: Legemiddel-FestLegemiddelpakning



## Resource Content

```json
{
  "resourceType" : "Medication",
  "id" : "Legemiddel-FestLegemiddelpakning",
  "meta" : {
    "profile" : ["http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"]
  },
  "extension" : [{
    "url" : "http://hl7.no/fhir/ig/lmdi/StructureDefinition/legemiddel-classification",
    "valueCodeableConcept" : {
      "coding" : [{
        "system" : "http://www.whocc.no/atc",
        "code" : "C01DA14",
        "display" : "isosorbide mononitrate"
      }]
    }
  }],
  "code" : {
    "coding" : [{
      "system" : "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning",
      "code" : "ID_40EB7069-EFEC-41C9-8CEF-7D21BD18539C",
      "display" : "Monoket retard depottab 50 mg"
    }]
  },
  "form" : {
    "coding" : [{
      "system" : "urn:oid:2.16.578.1.12.4.1.1.7448",
      "code" : "25",
      "display" : "Depottablett"
    }]
  }
}

```
