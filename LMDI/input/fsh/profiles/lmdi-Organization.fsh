// Hoveddefinisjon av organisasjonsprofil
Profile: Organisasjon
Parent: NoBasisOrganization
Id: lmdi-organization
Title: "Organisasjon"
Description: "Organisasjoner i norsk helse- og omsorgstjeneste, som post, avdeling, klinikk, sykehus og sykehjem. Basert på no-basis-Organization."
* ^status = #draft
* ^date = "2025-09-30"
* ^publisher = "Folkehelseinstituttet"
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Organization"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "Organizations in the Norwegian health and care service, such as ward, department, clinic, hospital and nursing home. Based on no-basis-Organization."

// Sikkerhetsinvariant: minst ENH eller RSH identifier
* obeys lmdi-org-identifier

// Deaktiverte felter
* text 0..0
* active 0..0
* telecom 0..0
* contact 0..0
* endpoint 0..0
* address.text 0..0
* address.line 0..0
* address.city 0..0
* address.postalCode 0..0

// Identifikatorer - bruker no-basis sine eksisterende slices (arver slicing fra parent)
* identifier 0..* MS
* identifier ^short = "ID fra Nasjonalt register for enheter i spesialisthelsetjenesten (RESH) eller Organisasjonsnummeret i Enhetsregister"
* identifier ^comment = "Der aktiviteten har skjedd."
* identifier ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* identifier ^short.extension[=].extension[+].url = "lang"
* identifier ^short.extension[=].extension[=].valueCode = #en
* identifier ^short.extension[=].extension[+].url = "content"
* identifier ^short.extension[=].extension[=].valueString = "ID from the Register for Units in Specialist Health Services (RESH) or the organization number in the Register of Legal Entities"
* identifier ^comment.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* identifier ^comment.extension[=].extension[+].url = "lang"
* identifier ^comment.extension[=].extension[=].valueCode = #en
* identifier ^comment.extension[=].extension[+].url = "content"
* identifier ^comment.extension[=].extension[=].valueString = "Where the activity took place."

* identifier[ENH] ^short = "Organisasjonsnummer fra Enhetsregisteret (ENH)"
* identifier[ENH] ^comment = "Identifikatorer skal angis på laveste relevante virksomhetsnivå i henhold til SSBs retningslinjer. For kommunale tjenester betyr dette på institusjonsnivå (f.eks sykehjem) der egen organisatorisk enhet er etablert, ikke på overordnet kommunenivå."
* identifier[ENH] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* identifier[ENH] ^short.extension[=].extension[+].url = "lang"
* identifier[ENH] ^short.extension[=].extension[=].valueCode = #en
* identifier[ENH] ^short.extension[=].extension[+].url = "content"
* identifier[ENH] ^short.extension[=].extension[=].valueString = "Organization number from the Register of Legal Entities (ENH)"
* identifier[ENH] ^comment.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* identifier[ENH] ^comment.extension[=].extension[+].url = "lang"
* identifier[ENH] ^comment.extension[=].extension[=].valueCode = #en
* identifier[ENH] ^comment.extension[=].extension[+].url = "content"
* identifier[ENH] ^comment.extension[=].extension[=].valueString = "Identifiers shall be specified at the lowest relevant organizational level according to Statistics Norway's guidelines. For municipal services, this means at institutional level (for example a nursing home) where a separate organizational unit is established, not at the overarching municipality level."

* identifier[RSH] ^short = "ID fra Register for enheter i spesialisthelsetjenesten (RESH)"
* identifier[RSH] ^comment = "Det nivået aktiviteten har skjedd på."
* identifier[RSH] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* identifier[RSH] ^short.extension[=].extension[+].url = "lang"
* identifier[RSH] ^short.extension[=].extension[=].valueCode = #en
* identifier[RSH] ^short.extension[=].extension[+].url = "content"
* identifier[RSH] ^short.extension[=].extension[=].valueString = "ID from the Register for Units in Specialist Health Services (RESH)"
* identifier[RSH] ^comment.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* identifier[RSH] ^comment.extension[=].extension[+].url = "lang"
* identifier[RSH] ^comment.extension[=].extension[=].valueCode = #en
* identifier[RSH] ^comment.extension[=].extension[+].url = "content"
* identifier[RSH] ^comment.extension[=].extension[=].valueString = "The level at which the activity took place."

// Organisasjonstype og navn - bruker no-basis slices
* type 0..*
* type ^short = "Organisasjonstype"
* type ^definition = "Type organisasjon (f.eks. sykehus, avdeling, klinikk)"
* type ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* type ^short.extension[=].extension[+].url = "lang"
* type ^short.extension[=].extension[=].valueCode = #en
* type ^short.extension[=].extension[+].url = "content"
* type ^short.extension[=].extension[=].valueString = "Organization type"
* type ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* type ^definition.extension[=].extension[+].url = "lang"
* type ^definition.extension[=].extension[=].valueCode = #en
* type ^definition.extension[=].extension[+].url = "content"
* type ^definition.extension[=].extension[=].valueString = "Type of organization (for example hospital, department, clinic)"
* type[organisatoriskNiva] 0..0
// LMDI deaktiverer organisatoriskNiva fordi kodeverket (OID 8628) ikke lenger er i bruk.
// organisatoriskBetegnelse beholdes fra no-basis og brukes i eksemplene.
* type[organisatoriskBetegnelse] ^short = "Organisatorisk betegnelse. Kodeverk \"Organisatorisk betegnelse\" (OID 8624)"
* type[organisatoriskBetegnelse] ^definition = "Kode fra kodeverk \"Organisatorisk betegnelse\" (OID 8624) som beskriver type organisatorisk enhet (f.eks. sykehus, avdeling, klinikk)"
* type[organisatoriskBetegnelse] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* type[organisatoriskBetegnelse] ^short.extension[=].extension[+].url = "lang"
* type[organisatoriskBetegnelse] ^short.extension[=].extension[=].valueCode = #en
* type[organisatoriskBetegnelse] ^short.extension[=].extension[+].url = "content"
* type[organisatoriskBetegnelse] ^short.extension[=].extension[=].valueString = "Organizational designation. Code system \"Organizational designation\" (OID 8624)"
* type[organisatoriskBetegnelse] ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* type[organisatoriskBetegnelse] ^definition.extension[=].extension[+].url = "lang"
* type[organisatoriskBetegnelse] ^definition.extension[=].extension[=].valueCode = #en
* type[organisatoriskBetegnelse] ^definition.extension[=].extension[+].url = "content"
* type[organisatoriskBetegnelse] ^definition.extension[=].extension[=].valueString = "Code from the \"Organizational designation\" code system (OID 8624) describing the type of organizational unit (for example hospital, department, clinic)"

* name 1..1 MS
* name ^short = "Organisasjonsnavn"
* name ^definition = "Offisielt navn på organisasjonen"
* name ^comment = "Kan være navn på post, avdelingsnavn, klinikknavn, sykehusnavn eller sykehjemsnavn"
* name ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* name ^short.extension[=].extension[+].url = "lang"
* name ^short.extension[=].extension[=].valueCode = #en
* name ^short.extension[=].extension[+].url = "content"
* name ^short.extension[=].extension[=].valueString = "Organization name"
* name ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* name ^definition.extension[=].extension[+].url = "lang"
* name ^definition.extension[=].extension[=].valueCode = #en
* name ^definition.extension[=].extension[+].url = "content"
* name ^definition.extension[=].extension[=].valueString = "Official name of the organization"
* name ^comment.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* name ^comment.extension[=].extension[+].url = "lang"
* name ^comment.extension[=].extension[=].valueCode = #en
* name ^comment.extension[=].extension[+].url = "content"
* name ^comment.extension[=].extension[=].valueString = "Can be the name of a ward, department, clinic, hospital, or nursing home"

// Hierarkisk struktur
* partOf MS
* partOf ^short = "Organisasjonen er del av (overordnet organisasjon)"
* partOf ^definition = "Organisasjonen er del av (overordnet organisasjon)"
* partOf ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* partOf ^short.extension[=].extension[+].url = "lang"
* partOf ^short.extension[=].extension[=].valueCode = #en
* partOf ^short.extension[=].extension[+].url = "content"
* partOf ^short.extension[=].extension[=].valueString = "The organization is part of (parent organization)"
* partOf ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* partOf ^definition.extension[=].extension[+].url = "lang"
* partOf ^definition.extension[=].extension[=].valueCode = #en
* partOf ^definition.extension[=].extension[+].url = "content"
* partOf ^definition.extension[=].extension[=].valueString = "The organization is part of (parent organization)"
* partOf only Reference(Organisasjon)

// Adresse
* address MS
* address ^short = "Gjeldende fysisk adresse"
* address ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* address ^short.extension[=].extension[+].url = "lang"
* address ^short.extension[=].extension[=].valueCode = #en
* address ^short.extension[=].extension[+].url = "content"
* address ^short.extension[=].extension[=].valueString = "Current physical address"
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

* address.district ^short = "Municipality"
* address.district ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* address.district ^short.extension[=].extension[+].url = "lang"
* address.district ^short.extension[=].extension[=].valueCode = #en
* address.district ^short.extension[=].extension[+].url = "content"
* address.district ^short.extension[=].extension[=].valueString = "Municipality"
// Bruker no-basis-municipalitycode extension som allerede er definert
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

* address.state ^short = "County name"
* address.state ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* address.state ^short.extension[=].extension[+].url = "lang"
* address.state ^short.extension[=].extension[=].valueCode = #en
* address.state ^short.extension[=].extension[+].url = "content"
* address.state ^short.extension[=].extension[=].valueString = "County name"
* address.country 0..0

* address.extension[urbanDistrict] ^short = "Encoded value for urban district. Code system \"Urban district numbers\" (OID 3403)"
* address.extension[urbanDistrict] ^definition = "Encoded value for urban district. Codes from the code system \"Urban district numbers\" (OID 3403) shall be used."
* address.extension[urbanDistrict] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* address.extension[urbanDistrict] ^short.extension[=].extension[+].url = "lang"
* address.extension[urbanDistrict] ^short.extension[=].extension[=].valueCode = #en
* address.extension[urbanDistrict] ^short.extension[=].extension[+].url = "content"
* address.extension[urbanDistrict] ^short.extension[=].extension[=].valueString = "Encoded value for urban district. Code system \"Urban district numbers\" (OID 3403)"
* address.extension[urbanDistrict] ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* address.extension[urbanDistrict] ^definition.extension[=].extension[+].url = "lang"
* address.extension[urbanDistrict] ^definition.extension[=].extension[=].valueCode = #en
* address.extension[urbanDistrict] ^definition.extension[=].extension[+].url = "content"
* address.extension[urbanDistrict] ^definition.extension[=].extension[=].valueString = "Encoded value for urban district. Codes from the code system \"Urban district numbers\" (OID 3403) shall be used."

// EKSEMPLER

Instance: Organisasjon-Kommune
InstanceOf: Organisasjon
Description: "Eksempel på kommune i primærhelsetjenesten"
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "942110464"
* name = "TRONDHEIM KOMMUNE"
* address.type = #physical
* address.district = "Trondheim"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#5001 "Trondheim - Tråante"

Instance: Organisasjon-Sykehjem
InstanceOf: Organisasjon
Description: "Eksempel på sykehjem i primærhelsetjenesten"
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "985626154"
* name = "BYNESET OG NYPANTUNET HELSE- OG VELFERDSSENTER SYKEHJEM"
* partOf = Reference(Organisasjon-Kommune)
* address.type = #physical
* address.district = "Trondheim"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#5001 "Trondheim - Tråante"

Instance: Organisasjon-HF
InstanceOf: Organisasjon
Description: "Eksempel på Helseforetak"
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "993467049"
* identifier[RSH].system = "urn:oid:2.16.578.1.12.4.1.4.102"
* identifier[RSH].value = "4001031"
* name = "Oslo universitetssykehus HF"

Instance: Organisasjon-Sykehus
InstanceOf: Organisasjon
Description: "Eksempel på sykehusorganisasjon"
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "974705761"
* name = "OSLO UNIVERSITETSSYKEHUS HF SPESIALSYKEHUSET FOR EPILEPSI SSE - SOMATIKK"
* type[organisatoriskBetegnelse].coding = $organisatoriskBetegnelse#01 "Sykehus"
* partOf = Reference(Organisasjon-HF)
* address.type = #physical
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#3201 "Bærum"

Instance: Organisasjon-Sykehusavdeling
InstanceOf: Organisasjon
Description: "Eksempel på spesialistavdeling"
* identifier[RSH].system = "urn:oid:2.16.578.1.12.4.1.4.102"
* identifier[RSH].value = "4208723"
* name = "Avdeling for epilepsi, poliklinikk"
* type[organisatoriskBetegnelse].coding = $organisatoriskBetegnelse#05 "Avdeling"
* partOf = Reference(Organisasjon-Sykehus)
* address.type = #physical
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#3201 "Bærum"

Instance: Organisasjon-HF-2
InstanceOf: Organisasjon
Description: "Eksempel på Helseforetak (Helse Møre og Romsdal HF)"
* identifier[RSH].system = "urn:oid:2.16.578.1.12.4.1.4.102"
* identifier[RSH].value = "4201115"
* name = "Helse Møre og Romsdal HF"

Instance: Organisasjon-Sykehus-2
InstanceOf: Organisasjon
Description: "Eksempel på sykehusorganisasjon under Helse Møre og Romsdal HF"
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "974747138"
* name = "Helse Møre og Romsdal HF Ålesund sjukehus - Somatikk"
* type[organisatoriskBetegnelse].coding = $organisatoriskBetegnelse#01 "Sykehus"
* partOf = Reference(Organisasjon-HF-2)

Instance: Organisasjon-Seksjon
InstanceOf: Organisasjon
Description: "Eksempel på seksjonsnivå i organisasjonshierarkiet"
* identifier[RSH].system = "urn:oid:2.16.578.1.12.4.1.4.102"
* identifier[RSH].value = "4223264"
* name = "Kreft og blodsykdommer sengepost Ålesund"
* type[organisatoriskBetegnelse].coding = $organisatoriskBetegnelse#06 "Seksjon"
* partOf = Reference(Organisasjon-Sykehus-2)

Instance: Organisasjon-Post
InstanceOf: Organisasjon
Description: "Eksempel på post – laveste nivå i organisasjonshierarkiet"
* identifier[RSH].system = "urn:oid:2.16.578.1.12.4.1.4.102"
* identifier[RSH].value = "102683"
* name = "HMR ÅLE SH Kreft og blodsjukdommar sengepost"
* type[organisatoriskBetegnelse].coding = $organisatoriskBetegnelse#08 "Post"
* partOf = Reference(Organisasjon-Seksjon)

// Invariant definisjon
Invariant: lmdi-org-identifier
Description: "Organisasjon skal ha minst ENH eller RSH identifier"
Severity: #error
Expression: "identifier.where(system='urn:oid:2.16.578.1.12.4.1.4.101' or system='urn:oid:2.16.578.1.12.4.1.4.102').exists()"
