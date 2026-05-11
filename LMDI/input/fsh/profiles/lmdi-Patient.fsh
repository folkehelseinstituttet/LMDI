Profile: Pasient
Id: lmdi-patient
Parent: NoBasisPatient
Title: "Pasient"
Description: "Pasienten som har fått rekvirert eller administrert legemiddel, basert på no-basis-Patient"
* ^status = #draft
* ^date = "2025-09-30"
* ^publisher = "Folkehelseinstituttet"
* ^title.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* ^title.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Patient"
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "The patient who has been prescribed or administered medication, based on no-basis-Patient"

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
* address.type ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* address.type ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "physical"
* address.city 0..0
* address.text 0..0
* address.line 0..0
* address.district ^short = "Municipality"
* address.district ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* address.district ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Municipality"
// Bruker no-basis-municipalitycode extension
* address.district.extension[municipalitycode] ^short = "Kodet verdi for kommune. Kodeverk \"Kommunenummer og regionale spesialkoder\" (OID 3402)"
* address.district.extension[municipalitycode] ^definition = "Kodet verdi for kommune. Koder fra kodeverk \"Kommunenummer og regionale spesialkoder\" (OID 3402) skal benyttes"
* address.district.extension[municipalitycode] ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* address.district.extension[municipalitycode] ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Encoded municipality value. Code system \"Municipality numbers and regional special codes\" (OID 3402)"
* address.district.extension[municipalitycode] ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* address.district.extension[municipalitycode] ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Encoded municipality value. Codes from the code system \"Municipality numbers and regional special codes\" (OID 3402) shall be used."
* address.use from LmdiAddressUse (required)
* address.use ^binding.description = "Tillatte verdier er home, temp eller old"
* address.use ^binding.description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* address.use ^binding.description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Allowed values are home, temp, or old"
* address.use ^short = "home | temp | old"
* address.use ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* address.use ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "home | temp | old"
* address.use ^definition = "Adressetype begrenset til home, temp eller old"
* address.use ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* address.use ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Address type limited to home, temp, or old"
* address.state ^short = "County name"
* address.state ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* address.state ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "County name"
* address.country 0..0
* address.postalCode 0..0

* address.extension[urbanDistrict] ^short = "Encoded value for urban district. Code system \"Urban district numbers\" (OID 3403)"
* address.extension[urbanDistrict] ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* address.extension[urbanDistrict] ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Encoded value for urban district. Code system \"Urban district numbers\" (OID 3403)"
* address.extension[urbanDistrict] ^definition = "Encoded value for urban district. Codes from code system \"Urban district numbers\" (OID 3403) shall be used."
* address.extension[urbanDistrict] ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* address.extension[urbanDistrict] ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Encoded value for urban district. Codes from code system \"Urban district numbers\" (OID 3403) shall be used."
// Fødselsdato
* birthDate MS
* birthDate ^short = "Fødselsdato"
* birthDate ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* birthDate ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Date of birth"
* birthDate ^definition = "Pasientens fødselsdato."
* birthDate ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* birthDate ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "The patient's date of birth."

// Kjønn
* gender MS
* gender ^short = "Kjønn"
* gender ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* gender ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Gender"
* gender ^definition = "Pasientens kjønn."
* gender ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* gender ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "The patient's gender."

// Identifikatorer - bruker no-basis slices
* identifier MS
* identifier ^short = "Identifikator for pasienten."
* identifier ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* identifier ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Patient identifier."
* identifier ^definition = "Identifikator for pasienten. Bør være fødselsnummer (FNR) eller D-nummer (DNR) når tilgjengelig."
* identifier ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* identifier ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Patient identifier. Should be national identity number (FNR) or D-number (DNR) when available."

// Bruker no-basis sine eksisterende slices
* identifier[FNR] 0..1 MS
* identifier[FNR] ^short = "National identity number"
* identifier[FNR] ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* identifier[FNR] ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "National identity number"
* identifier[FNR].value 1..1
* identifier[FNR].value ^short = "National identity number (11 digits)"
* identifier[FNR].value ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* identifier[FNR].value ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "National identity number (11 digits)"
* identifier[FNR].value ^example[0].label = "National identity number"
* identifier[FNR].value ^example[0].valueString = "12345678901"

* identifier[DNR] 0..1 MS
* identifier[DNR] ^short = "D-number"
* identifier[DNR] ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* identifier[DNR] ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "D-number"
* identifier[DNR].value 1..1
* identifier[DNR].value ^short = "D-number (11 digits)"
* identifier[DNR].value ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* identifier[DNR].value ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "D-number (11 digits)"
* identifier[DNR].value ^example[0].label = "D-number"
* identifier[DNR].value ^example[0].valueString = "12345678901"

// Skjul no-basis slices som LMDI ikke bruker
* identifier[FHN] 0..0
* identifier[HNR] 0..0

// EKSEMPLER
Instance: Pasient-Uten-Personidentifikator
InstanceOf: Pasient
Description: "Eksempel på pasient uten personidentifikator"
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Example of a patient without a personal identifier"
* gender = #female
* birthDate = "1958-09-19"
* address.district = "Bærum"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#3024 "Bærum"

Instance: Pasient-Med-FNR
InstanceOf: Pasient
Description: "Eksempel på pasient med fødselsnummer"
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Example of a patient with a national identity number"
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
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Example of a patient with a D-number"
* identifier[DNR].system = "urn:oid:2.16.578.1.12.4.1.4.2"
* identifier[DNR].value = "41667987421"
* birthDate = "1979-01-01"
* address.state = "Vestland"

