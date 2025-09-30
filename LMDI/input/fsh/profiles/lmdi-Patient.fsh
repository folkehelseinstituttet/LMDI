ValueSet: LmdiAddressUse
Id: lmdi-address-use
Title: "LMDI Address Use"
Description: "Tillatte verdier for address.use i LMDI: home, temp, old"
* ^status = #active
* include http://hl7.org/fhir/address-use#home
* include http://hl7.org/fhir/address-use#temp
* include http://hl7.org/fhir/address-use#old

Profile: Pasient
Id: lmdi-patient
Parent: NoBasisPatient
Title: "Pasient"
Description: "Pasienten som har fått rekvirert eller administrert legemiddel, basert på no-basis-Patient"
* ^status = #draft
* ^date = "2025-09-12"
* ^publisher = "Folkehelseinstituttet"

// Deaktiverte felter
* active 0..0
* communication 0..0
* contact 0..0
* deceased[x] 0..0
* generalPractitioner 0..0
* link 0..0
* managingOrganization 0..0
* maritalStatus 0..0
* multipleBirth[x] 0..0
* name 0..0
* photo 0..0
* telecom 0..0
* text 0..0

// Adresse - bruker no-basis-Address
* address MS
* address only NoBasisAddress
* address.city 0..0
* address.text 0..0
* address.line 0..0
* address.district ^short = "Kommune"
// Bruker no-basis propertyinformation for kommune
* address.extension contains NoBasisPropertyInformation named propertyinformation 0..1
* address.extension[propertyinformation].extension[municipality].valueCoding.system = "urn:oid:2.16.578.1.12.4.1.1.3402" (exactly)
* address.extension[propertyinformation].extension[municipality].valueCoding.code 1..1
* address.use from LmdiAddressUse (required)
* address.use ^binding.description = "Tillatte verdier er home, temp eller old"
* address.use ^short = "home | temp | old"
* address.use ^definition = "Adressetype begrenset til home, temp eller old"
* address.use obeys address-use-constraint
* address.state ^short = "Fylkesnavn"
* address.country 0..0
* address.postalCode 0..0
// Fødselsdato
* birthDate MS
* birthDate ^short = "Fødselsdato"
* birthDate ^definition = "Pasientens fødselsdato."

// Kjønn
* gender MS
* gender ^short = "Kjønn"
* gender ^definition = "Pasientens kjønn."

// Identifikatorer - bruker no-basis slices
* identifier MS
* identifier ^short = "Identifikator for pasienten."
* identifier ^definition = "Identifikator for pasienten. Skal være fødselsnummer (FNR) eller D-nummer (DNR)."

// Bruker no-basis sine eksisterende slices
* identifier[FNR] 0..1 MS
* identifier[FNR] ^short = "Fødselsnummer"
* identifier[FNR].value 1..1
* identifier[FNR].value ^short = "Fødselsnummeret (11 siffer)"
* identifier[FNR].value ^example.label = "Fødselsnummer"
* identifier[FNR].value ^example.valueString = "12345678901"

* identifier[DNR] 0..1 MS
* identifier[DNR] ^short = "D-nummer"
* identifier[DNR].value 1..1
* identifier[DNR].value ^short = "D-nummer (11 siffer)"
* identifier[DNR].value ^example.label = "D-nummer"
* identifier[DNR].value ^example.valueString = "12345678901"

// Skjul no-basis slices som LMDI ikke bruker
* identifier[FHN] 0..0
* identifier[HNR] 0..0

// EKSEMPLER
Instance: Pasient-1-Uten-FNR
InstanceOf: Pasient
Description: "Eksempel på pasient med kjønn og fødselsdato"
* gender = #female
* birthDate = "1958-09-19"
* address.district = "Bærum"
* address.extension[propertyinformation].extension[municipality].valueCoding = $kommunenummer-alle#3024 "Bærum"

Instance: Pasient-2-FNR
InstanceOf: Pasient
Description: "Eksempel på pasient med fødselsnummer"
* identifier[FNR].system = "urn:oid:2.16.578.1.12.4.1.4.1"
* identifier[FNR].value = "13031353453"
* address.district = "Bærum"
* address.extension[propertyinformation].extension[municipality].valueCoding = $kommunenummer-alle#3024 "Bærum"


Invariant: address-use-constraint
Description: "Kun home, temp eller old er tillatt for address.use"
Severity: #error
Expression: "address.use.empty() or address.use in ('home' | 'temp' | 'old')"

