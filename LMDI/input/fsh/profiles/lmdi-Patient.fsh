Profile: Pasient
Id: lmdi-patient
Parent: NoBasisPatient
Title: "Pasient"
Description: "Pasienten som har fått rekvirert eller administrert legemiddel, basert på no-basis-Patient"
* ^status = #draft
* ^date = "2025-09-30"
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
* extension[citizenship] 0..0

// Adresse - bruker no-basis-Address
* address MS
* address only NoBasisAddress
* address.extension[official] 0..0
* address.extension[propertyInformation] 0..0
* address.type = #physical
* address.type from LmdiAddressType (required)
* address.city 0..0
* address.text 0..0
* address.line 0..0
* address.district ^short = "Kommune"
// Bruker no-basis-municipalitycode extension
* address.district.extension[municipalitycode] ^short = "Kodet verdi for kommune. Kodeverk \"Kommunenummer og regionale spesialkoder\" (OID 3402)"
* address.district.extension[municipalitycode] ^definition = "Kodet verdi for kommune. Koder fra kodeverk \"Kommunenummer og regionale spesialkoder\" (OID 3402) skal benyttes"
* address.use from LmdiAddressUse (required)
* address.use ^binding.description = "Tillatte verdier er home, temp eller old"
* address.use ^short = "home | temp | old"
* address.use ^definition = "Adressetype begrenset til home, temp eller old"
* address.use obeys address-use-constraint
* address.state ^short = "Fylkesnavn"
* address.country 0..0
* address.postalCode 0..0

* address.extension[urbanDistrict] ^short = "Kodet verdi for bydel. Kodeverk \"Bydelsnummer\" (OID 3403)"
* address.extension[urbanDistrict] ^definition = "Kodet verdi for bydel. Koder fra kodeverk \"Bydelsnummer\" (OID 3403) skal benyttes"
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
* identifier[FNR].value ^example[0].label = "Fødselsnummer"
* identifier[FNR].value ^example[0].valueString = "12345678901"

* identifier[DNR] 0..1 MS
* identifier[DNR] ^short = "D-nummer"
* identifier[DNR].value 1..1
* identifier[DNR].value ^short = "D-nummer (11 siffer)"
* identifier[DNR].value ^example[0].label = "D-nummer"
* identifier[DNR].value ^example[0].valueString = "12345678901"

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
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#3024 "Bærum"

Instance: Pasient-2-FNR
InstanceOf: Pasient
Description: "Eksempel på pasient med fødselsnummer"
* identifier[FNR].system = "urn:oid:2.16.578.1.12.4.1.4.1"
* identifier[FNR].value = "13031353453"
* address.district = "Bærum"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#3024 "Bærum"


Invariant: address-use-constraint
Description: "Kun home, temp eller old er tillatt for address.use"
Severity: #error
Expression: "address.use.empty() or address.use in ('home' | 'temp' | 'old')"

