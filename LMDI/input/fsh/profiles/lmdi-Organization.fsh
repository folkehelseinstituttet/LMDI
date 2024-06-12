Profile: LmdiOrganization
Parent: Organization
Id: lmdi-organization
Title: "Organisasjon"
Description: "Organisasjon eller organisasjonsenhet. "
* ^status = #draft
* ^date = "2024-06-12"
* ^publisher = "Folkehelseinstituttet"

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #closed
* identifier contains ENH 0..1 and RESH 0..1
* identifier 1..* 
* identifier ^short = "Unik identifikasjon av enhet basert på organisasjonsnummer eller RESH-id."
* identifier ^comment = "Skal baseres på no-basis-Organization."
* identifier[ENH] ^short = "Organisasjonsnummer fra Enhetsregisteret"
* identifier[RESH] ^short = "D-nummer"
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101" 
* identifier[RESH].system = "urn.oid:2.16.578.1.12.4.1.4.102" 
* identifier[ENH].value 1..1
* identifier[RESH].value 1..1

// Krav: Type organisasjon / organisatorisk nivå / betegnelse
* type MS
* type ^short = "Organisatorisk nivå / betegnelse"

// Krav: Navn (name)
* name MS
* name ^short = "Navn på organisasjonsenhet"
* name ^definition = "Eks. avdelingsnavn / institsjonsnavn / org navn"

// Krav: Kommune (.district.extension:municipalitycode, fra no-basis)
// TODO #8 Utvide Organisasjon med utvidelse for kommunenummer fra no-basis
* address MS
* address.district.extension contains NoBasisMunicipalitycode named municipalitycode 0..1
* address.district.extension[municipalitycode] ^short = "Coded value for municipality/county Norwegian kommune"
* address.district.extension[municipalitycode] ^definition = "Coded value for municipality/county Norwegian kommune"

// Krav: Del av organisasjon (ref:organization)
// * partOf MS <- NB! kan bare peke oppover

// Kopiert fra Thomas sin fsh-no-basis
Alias: $kommunenummer-alle = https://register.geonorge.no/subregister/sosi-kodelister/kartverket/kommunenummer-alle
Extension: NoBasisMunicipalitycode
Id: no-basis-municipalitycode
Title: "no-basis-municipalitycode"
Description: "Coded value for municipality/county Norwegian kommune"
* ^version = "2.0.16"
* ^date = "2021-04-09"
* ^context.type = #element
* ^context.expression = "Address.district"
* value[x] only Coding
* value[x] from $kommunenummer-alle (required)
* value[x].system ^definition = "All Norwegian kommunenummer/municipalitycodes are published by SSB"
* value[x].code ^short = "Actual kommunenummer"
* value[x].code ^definition = "Norwegian kommunenummer/municipalitycode"

// EKSEMPLER

Instance: Organisasjon-1-Eldrehjem
InstanceOf: LmdiOrganization
Description: "Eksempel på organisasjon - Primærhelsetjeneste"
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "1234567890"
* name = "Lykkedalen eldrehjem"
* address.district = "Sigdal"
* address.district[0].extension[NoBasisMunicipalitycode].valueCoding = #3034

Instance: Organisasjon-2-Spesialist
InstanceOf: LmdiOrganization
Description: "Eksempel på organisasjon - spesialisthelsetjenesten med RESH."
// RESH-id. Tydeligvis fortsatt lukket.
* identifier[RESH].system = "urn.oid:2.16.578.1.12.4.1.4.102"
* identifier[RESH].value = "09876-54"
* name = "Cytologisk poliklinikk, Avdeling for patologi, Oslo universitetssykehus HF" 

// Oslo universitetssykehus HF
// Avdeling for patologi
// Postboks 4953 Nydalen
// 0424 Oslo
// patologi@ous-hf.no