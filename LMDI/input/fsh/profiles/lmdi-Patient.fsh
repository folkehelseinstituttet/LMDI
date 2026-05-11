Profile: Pasient
Id: lmdi-patient
Parent: NoBasisPatient
Title: "Pasient"
Description: "Pasienten som har fått rekvirert eller administrert legemiddel, basert på no-basis-Patient"
* ^status = #draft
* ^date = "2025-09-30"
* ^publisher = "Folkehelseinstituttet"
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Patient"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "The patient who has been prescribed or administered medication, based on no-basis-Patient"

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
* address.type ^short = "physical"
* address.type ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* address.type ^short.extension[=].extension[+].url = "lang"
* address.type ^short.extension[=].extension[=].valueCode = #en
* address.type ^short.extension[=].extension[+].url = "content"
* address.type ^short.extension[=].extension[=].valueString = "physical"
* address.city 0..0
* address.text 0..0
* address.line 0..0
* address.district ^short = "Municipality"
* address.district ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* address.district ^short.extension[=].extension[+].url = "lang"
* address.district ^short.extension[=].extension[=].valueCode = #en
* address.district ^short.extension[=].extension[+].url = "content"
* address.district ^short.extension[=].extension[=].valueString = "Municipality"
// Bruker no-basis-municipalitycode extension
* address.district.extension[municipalitycode] ^short = "Kodet verdi for kommune. Kodeverk \"Kommunenummer og regionale spesialkoder\" (OID 3402)"
* address.district.extension[municipalitycode] ^definition = "Kodet verdi for kommune. Koder fra kodeverk \"Kommunenummer og regionale spesialkoder\" (OID 3402) skal benyttes"
* address.district.extension[municipalitycode] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* address.district.extension[municipalitycode] ^short.extension[=].extension[+].url = "lang"
* address.district.extension[municipalitycode] ^short.extension[=].extension[=].valueCode = #en
* address.district.extension[municipalitycode] ^short.extension[=].extension[+].url = "content"
* address.district.extension[municipalitycode] ^short.extension[=].extension[=].valueString = "Encoded municipality value. Code system \"Municipality numbers and regional special codes\" (OID 3402)"
* address.district.extension[municipalitycode] ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* address.district.extension[municipalitycode] ^definition.extension[=].extension[+].url = "lang"
* address.district.extension[municipalitycode] ^definition.extension[=].extension[=].valueCode = #en
* address.district.extension[municipalitycode] ^definition.extension[=].extension[+].url = "content"
* address.district.extension[municipalitycode] ^definition.extension[=].extension[=].valueString = "Encoded municipality value. Codes from the code system \"Municipality numbers and regional special codes\" (OID 3402) shall be used."
* address.use from LmdiAddressUse (required)
* address.use ^binding.description = "Tillatte verdier er home, temp eller old"
* address.use ^binding.description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* address.use ^binding.description.extension[=].extension[+].url = "lang"
* address.use ^binding.description.extension[=].extension[=].valueCode = #en
* address.use ^binding.description.extension[=].extension[+].url = "content"
* address.use ^binding.description.extension[=].extension[=].valueString = "Allowed values are home, temp, or old"
* address.use ^short = "home | temp | old"
* address.use ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* address.use ^short.extension[=].extension[+].url = "lang"
* address.use ^short.extension[=].extension[=].valueCode = #en
* address.use ^short.extension[=].extension[+].url = "content"
* address.use ^short.extension[=].extension[=].valueString = "home | temp | old"
* address.use ^definition = "Adressetype begrenset til home, temp eller old"
* address.use ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* address.use ^definition.extension[=].extension[+].url = "lang"
* address.use ^definition.extension[=].extension[=].valueCode = #en
* address.use ^definition.extension[=].extension[+].url = "content"
* address.use ^definition.extension[=].extension[=].valueString = "Address type limited to home, temp, or old"
* address.state ^short = "County name"
* address.state ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* address.state ^short.extension[=].extension[+].url = "lang"
* address.state ^short.extension[=].extension[=].valueCode = #en
* address.state ^short.extension[=].extension[+].url = "content"
* address.state ^short.extension[=].extension[=].valueString = "County name"
* address.country 0..0
* address.postalCode 0..0

* address.extension[urbanDistrict] ^short = "Encoded value for urban district. Code system \"Urban district numbers\" (OID 3403)"
* address.extension[urbanDistrict] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* address.extension[urbanDistrict] ^short.extension[=].extension[+].url = "lang"
* address.extension[urbanDistrict] ^short.extension[=].extension[=].valueCode = #en
* address.extension[urbanDistrict] ^short.extension[=].extension[+].url = "content"
* address.extension[urbanDistrict] ^short.extension[=].extension[=].valueString = "Encoded value for urban district. Code system \"Urban district numbers\" (OID 3403)"
* address.extension[urbanDistrict] ^definition = "Encoded value for urban district. Codes from code system \"Urban district numbers\" (OID 3403) shall be used."
* address.extension[urbanDistrict] ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* address.extension[urbanDistrict] ^definition.extension[=].extension[+].url = "lang"
* address.extension[urbanDistrict] ^definition.extension[=].extension[=].valueCode = #en
* address.extension[urbanDistrict] ^definition.extension[=].extension[+].url = "content"
* address.extension[urbanDistrict] ^definition.extension[=].extension[=].valueString = "Encoded value for urban district. Codes from code system \"Urban district numbers\" (OID 3403) shall be used."
// Fødselsdato
* birthDate MS
* birthDate ^short = "Fødselsdato"
* birthDate ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* birthDate ^short.extension[=].extension[+].url = "lang"
* birthDate ^short.extension[=].extension[=].valueCode = #en
* birthDate ^short.extension[=].extension[+].url = "content"
* birthDate ^short.extension[=].extension[=].valueString = "Date of birth"
* birthDate ^definition = "Pasientens fødselsdato."
* birthDate ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* birthDate ^definition.extension[=].extension[+].url = "lang"
* birthDate ^definition.extension[=].extension[=].valueCode = #en
* birthDate ^definition.extension[=].extension[+].url = "content"
* birthDate ^definition.extension[=].extension[=].valueString = "The patient's date of birth."

// Kjønn
* gender MS
* gender ^short = "Kjønn"
* gender ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* gender ^short.extension[=].extension[+].url = "lang"
* gender ^short.extension[=].extension[=].valueCode = #en
* gender ^short.extension[=].extension[+].url = "content"
* gender ^short.extension[=].extension[=].valueString = "Gender"
* gender ^definition = "Pasientens kjønn."
* gender ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* gender ^definition.extension[=].extension[+].url = "lang"
* gender ^definition.extension[=].extension[=].valueCode = #en
* gender ^definition.extension[=].extension[+].url = "content"
* gender ^definition.extension[=].extension[=].valueString = "The patient's gender."

// Identifikatorer - bruker no-basis slices
* identifier MS
* identifier ^short = "Identifikator for pasienten."
* identifier ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* identifier ^short.extension[=].extension[+].url = "lang"
* identifier ^short.extension[=].extension[=].valueCode = #en
* identifier ^short.extension[=].extension[+].url = "content"
* identifier ^short.extension[=].extension[=].valueString = "Patient identifier."
* identifier ^definition = "Identifikator for pasienten. Bør være fødselsnummer (FNR) eller D-nummer (DNR) når tilgjengelig."
* identifier ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* identifier ^definition.extension[=].extension[+].url = "lang"
* identifier ^definition.extension[=].extension[=].valueCode = #en
* identifier ^definition.extension[=].extension[+].url = "content"
* identifier ^definition.extension[=].extension[=].valueString = "Patient identifier. Should be national identity number (FNR) or D-number (DNR) when available."

// Bruker no-basis sine eksisterende slices
* identifier[FNR] 0..1 MS
* identifier[FNR] ^short = "National identity number"
* identifier[FNR] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* identifier[FNR] ^short.extension[=].extension[+].url = "lang"
* identifier[FNR] ^short.extension[=].extension[=].valueCode = #en
* identifier[FNR] ^short.extension[=].extension[+].url = "content"
* identifier[FNR] ^short.extension[=].extension[=].valueString = "National identity number"
* identifier[FNR].value 1..1
* identifier[FNR].value ^short = "National identity number (11 digits)"
* identifier[FNR].value ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* identifier[FNR].value ^short.extension[=].extension[+].url = "lang"
* identifier[FNR].value ^short.extension[=].extension[=].valueCode = #en
* identifier[FNR].value ^short.extension[=].extension[+].url = "content"
* identifier[FNR].value ^short.extension[=].extension[=].valueString = "National identity number (11 digits)"
* identifier[FNR].value ^example[0].label = "National identity number"
* identifier[FNR].value ^example[0].valueString = "12345678901"

* identifier[DNR] 0..1 MS
* identifier[DNR] ^short = "D-number"
* identifier[DNR] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* identifier[DNR] ^short.extension[=].extension[+].url = "lang"
* identifier[DNR] ^short.extension[=].extension[=].valueCode = #en
* identifier[DNR] ^short.extension[=].extension[+].url = "content"
* identifier[DNR] ^short.extension[=].extension[=].valueString = "D-number"
* identifier[DNR].value 1..1
* identifier[DNR].value ^short = "D-number (11 digits)"
* identifier[DNR].value ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* identifier[DNR].value ^short.extension[=].extension[+].url = "lang"
* identifier[DNR].value ^short.extension[=].extension[=].valueCode = #en
* identifier[DNR].value ^short.extension[=].extension[+].url = "content"
* identifier[DNR].value ^short.extension[=].extension[=].valueString = "D-number (11 digits)"
* identifier[DNR].value ^example[0].label = "D-number"
* identifier[DNR].value ^example[0].valueString = "12345678901"

// Skjul no-basis slices som LMDI ikke bruker
* identifier[FHN] 0..0
* identifier[HNR] 0..0

// EKSEMPLER
Instance: Pasient-Uten-Personidentifikator
InstanceOf: Pasient
Description: "Eksempel på pasient uten personidentifikator"
* gender = #female
* birthDate = "1958-09-19"
* address.district = "Bærum"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#3024 "Bærum"

Instance: Pasient-Med-FNR
InstanceOf: Pasient
Description: "Eksempel på pasient med fødselsnummer"
* identifier[FNR].system = "urn:oid:2.16.578.1.12.4.1.4.1"
* identifier[FNR].value = "12705825562"
* gender = #male
* birthDate = "1958-05-12"
* address.use = #home
* address.type = #physical
* address.district = "Oslo"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#0301 "Oslo"
* address.extension[urbanDistrict].valueCoding = $VsLmdiUrbanDistrict#030102 "Grünerløkka"

Instance: Pasient-Med-DNR
InstanceOf: Pasient
Description: "Eksempel på pasient med D-nummer"
* identifier[DNR].system = "urn:oid:2.16.578.1.12.4.1.4.2"
* identifier[DNR].value = "41667987421"
* birthDate = "1979-01-01"
* address.state = "Vestland"

