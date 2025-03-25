Profile: LegemiddelregisterBundle
Parent: Bundle
Id: lmdi-bundle
Title: "LegemiddelregisterBundle"
Description: "Profil av Bundle for Legemiddelregisteret. Støtter bare transaction-type og POST-operasjoner, med begrensninger på tillatte ressurstyper."

// Påkrevde felter
* identifier 1..1 MS
* timestamp 1..1 MS
* type 1..1 MS
* type = #transaction (exactly)
* type ^short = "Må være av type transaction"
* type ^definition = "Angir at bundle må være av type transaction"

// Deaktiverte elementer
* total 0..0
* link 0..0

// Entry-elementer
* entry 1..* MS
* entry ^short = "Innholdselementer i bundle"
* entry ^definition = "Inneholder ressursene som skal sendes inn til registeret"

* entry.request 1..1 MS
* entry.request.method 1..1 MS
* entry.request.method = #POST (exactly)
* entry.request.method ^short = "Må være Transaction"
* entry.request.method ^definition = "Angir at alle forespørsler i bundle må være av type POST"

* entry.resource 1..1 MS

// Invariant for tillatte ressurstyper
* obeys lr-allowed-resources

Invariant: lr-allowed-resources
Description: "Bundle kan bare inneholde følgende profilerte ressurstyper: Diagnose, Helsepersonell, Episode, Legemiddel, LegemiddelAdministrasjon, Legemiddelrekvirering, Organisasjon, Pasient"
Severity: #error
Expression: "entry.all(
  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-condition').exists() or 
  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-practitioner').exists() or 
  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-encounter').exists() or 
  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication').exists() or 
  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationadministration').exists() or 
  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medicationrequest').exists() or 
  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-organization').exists() or 
  resource.meta.profile.where($this = 'http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-patient').exists()
)"

// EKSEMPEL
Instance: LegemiddelregisterBundle-1
InstanceOf: LegemiddelregisterBundle
Usage: #example
Title: "Eksempel på LegemiddelregisterBundle med administreringer"
Description: "Eksempel på en batch-bundle som inneholder to legemiddeladministreringer"

* identifier.system = "urn:oid:2.16.578.1.34.10.3"
* identifier.value = "bundle-001"
* timestamp = "2024-02-07T13:28:17.239+02:00"
* type = #transaction

// Ressurser i bundle
* entry[0].resource = Pasient-20
* entry[0].request.method = #POST
* entry[0].request.url = "Patient"

* entry[1].resource = Medisin-10
* entry[1].request.method = #POST
* entry[1].request.url = "Medication"

* entry[2].resource = Helsepersonell-10
* entry[2].request.method = #POST
* entry[2].request.url = "Practitioner"

* entry[3].resource = Episode-2-Sykehjem
* entry[3].request.method = #POST
* entry[3].request.url = "EpisodeOfCare"

* entry[4].resource = Organisasjon-2-Eldrehjem
* entry[4].request.method = #POST
* entry[4].request.url = "Organization"

* entry[5].resource = Administrering-10
* entry[5].request.method = #POST
* entry[5].request.url = "MedicationAdministration"