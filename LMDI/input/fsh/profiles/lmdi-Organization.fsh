// Hoveddefinisjon av organisasjonsprofil
Profile: Organisasjon
Parent: NoBasisOrganization
Id: lmdi-organization
Title: "Organisasjon"
Description: """
Organisasjoner i norsk helse- og omsorgstjeneste, som post, avdeling, klinikk, sykehus og sykehjem, basert på no-basis-Organization.

Denne profilen av Organization benyttes for å beskrive helseinstitusjoner og skal representere organisasjonen på lavest mulig nivå i organisasjonshierarkiet (f.eks. en avdeling eller klinikk eller post). For organisasjonen som er del av en større organisasjon, skal dette angis ved hjelp av partOf-relasjonen.

Det er ønskelig at minimum følgende inngår i "organisasjonshierarkiet":
- organisasjonen på lavest mulig nivå (dvs. post, enhet, avdeling eller lignende)
- organisasjonen på høyre nivå
     - sykehus, Helseforetak og Regionalt Helseforetak
     - sykehjem, kommune
- minst ett organisasjonsnummer fra enten Enhetsregisteret (identifier:ENH) eller Register for enheter i spesialisthelsetjenesten (identifier:RSH)
"""
* ^status = #draft
* ^date = "2025-09-30"
* ^publisher = "Folkehelseinstituttet"
* ^title.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* ^title.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Organization"
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = """Organizations in Norwegian health and care services, such as wards, departments, clinics, hospitals, and nursing homes, based on no-basis-Organization.

This Organization profile is used to describe healthcare institutions and shall represent the organization at the lowest possible level in the organizational hierarchy (for example a department, clinic, or ward). If the organization is part of a larger organization, this shall be represented using the partOf relationship.

It is desirable that the following are included at minimum in the organizational hierarchy:
- the organization at the lowest possible level (i.e. ward, unit, department, or similar)
- the organization at the next level
     - hospital, Health Trust, and Regional Health Trust
     - nursing home, municipality
- at least one organization number from either the Register of Legal Entities (identifier:ENH) or the Register for Units in Specialist Health Services (identifier:RSH)
"""

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
* identifier ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* identifier ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "ID from the Register for Units in Specialist Health Services (RESH) or the organization number in the Register of Legal Entities"
* identifier ^comment.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* identifier ^comment.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Where the activity took place."

* identifier[ENH] ^short = "Organisasjonsnummer fra Enhetsregisteret (ENH)"
* identifier[ENH] ^comment = "Identifikatorer skal angis på laveste relevante virksomhetsnivå i henhold til SSBs retningslinjer. For kommunale tjenester betyr dette på institusjonsnivå (f.eks sykehjem) der egen organisatorisk enhet er etablert, ikke på overordnet kommunenivå."
* identifier[ENH] ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* identifier[ENH] ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Organization number from the Register of Legal Entities (ENH)"
* identifier[ENH] ^comment.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* identifier[ENH] ^comment.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Identifiers shall be specified at the lowest relevant organizational level according to Statistics Norway's guidelines. For municipal services, this means at institutional level (for example a nursing home) where a separate organizational unit is established, not at the overarching municipality level."

* identifier[RSH] ^short = "ID fra Register for enheter i spesialisthelsetjenesten (RESH)"
* identifier[RSH] ^comment = "Det nivået aktiviteten har skjedd på."
* identifier[RSH] ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* identifier[RSH] ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "ID from the Register for Units in Specialist Health Services (RESH)"
* identifier[RSH] ^comment.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* identifier[RSH] ^comment.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "The level at which the activity took place."

// Organisasjonstype og navn - bruker no-basis slices
* type 0..*
* type ^short = "Organisasjonstype"
* type ^definition = "Type organisasjon (f.eks. sykehus, avdeling, klinikk)"
* type ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* type ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Organization type"
* type ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* type ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Type of organization (for example hospital, department, clinic)"
* type[organisatoriskNiva] 0..0
// LMDI deaktiverer organisatoriskNiva fordi kodeverket (OID 8628) ikke lenger er i bruk.
// organisatoriskBetegnelse beholdes fra no-basis og brukes i eksemplene.
* type[organisatoriskBetegnelse] ^short = "Organisatorisk betegnelse. Kodeverk \"Organisatorisk betegnelse\" (OID 8624)"
* type[organisatoriskBetegnelse] ^definition = "Kode fra kodeverk \"Organisatorisk betegnelse\" (OID 8624) som beskriver type organisatorisk enhet (f.eks. sykehus, avdeling, klinikk)"
* type[organisatoriskBetegnelse] ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* type[organisatoriskBetegnelse] ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Organizational designation. Code system \"Organizational designation\" (OID 8624)"
* type[organisatoriskBetegnelse] ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* type[organisatoriskBetegnelse] ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Code from the \"Organizational designation\" code system (OID 8624) describing the type of organizational unit (for example hospital, department, clinic)"

* name 1..1 MS
* name ^short = "Organisasjonsnavn"
* name ^definition = "Offisielt navn på organisasjonen"
* name ^comment = "Kan være navn på post, avdelingsnavn, klinikknavn, sykehusnavn eller sykehjemsnavn"
* name ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* name ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Organization name"
* name ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* name ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Official name of the organization"
* name ^comment.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* name ^comment.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Can be the name of a ward, department, clinic, hospital, or nursing home"

// Hierarkisk struktur
* partOf MS
* partOf ^short = "Organisasjonen er del av (overordnet organisasjon)"
* partOf ^definition = "Organisasjonen er del av (overordnet organisasjon)"
* partOf ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* partOf ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "The organization is part of (parent organization)"
* partOf ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* partOf ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "The organization is part of (parent organization)"
* partOf only Reference(Organisasjon)

// Adresse
* address MS
* address ^short = "Gjeldende fysisk adresse"
* address ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* address ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Current physical address"
* address.extension[official] 0..0
* address.extension[propertyInformation] 0..0
* address.type = #physical
* address.type from LmdiAddressType (required)
* address.type ^short = "physical"
* address.type ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* address.type ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "physical"

* address.district ^short = "Municipality"
* address.district ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* address.district ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Municipality"
// Bruker no-basis-municipalitycode extension som allerede er definert
* address.district.extension[municipalitycode] ^short = "Kodet verdi for kommune. Kodeverk \"Kommunenummer og regionale spesialkoder\" (OID 3402)"
* address.district.extension[municipalitycode] ^definition = "Kodet verdi for kommune. Koder fra kodeverk \"Kommunenummer og regionale spesialkoder\" (OID 3402) skal benyttes"
* address.district.extension[municipalitycode] ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* address.district.extension[municipalitycode] ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Encoded municipality value. Code system \"Municipality numbers and regional special codes\" (OID 3402)"
* address.district.extension[municipalitycode] ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* address.district.extension[municipalitycode] ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Encoded municipality value. Codes from the code system \"Municipality numbers and regional special codes\" (OID 3402) shall be used."

* address.state ^short = "County name"
* address.state ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* address.state ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "County name"
* address.country 0..0

* address.extension[urbanDistrict] ^short = "Encoded value for urban district. Code system \"Urban district numbers\" (OID 3403)"
* address.extension[urbanDistrict] ^definition = "Encoded value for urban district. Codes from the code system \"Urban district numbers\" (OID 3403) shall be used."
* address.extension[urbanDistrict] ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* address.extension[urbanDistrict] ^short.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Encoded value for urban district. Code system \"Urban district numbers\" (OID 3403)"
* address.extension[urbanDistrict] ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* address.extension[urbanDistrict] ^definition.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Encoded value for urban district. Codes from the code system \"Urban district numbers\" (OID 3403) shall be used."

// EKSEMPLER

Instance: Organisasjon-Kommune
InstanceOf: Organisasjon
Description: "Eksempel på kommune i primærhelsetjenesten"
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Example of a municipality in primary healthcare"
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "942110464"
* name = "TRONDHEIM KOMMUNE"
* address.type = #physical
* address.district = "Trondheim"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#5001 "Trondheim - Tråante"

Instance: Organisasjon-Sykehjem
InstanceOf: Organisasjon
Description: "Eksempel på sykehjem i primærhelsetjenesten"
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Example of a nursing home in primary healthcare"
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
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Example of a health trust"
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "993467049"
* identifier[RSH].system = "urn:oid:2.16.578.1.12.4.1.4.102"
* identifier[RSH].value = "4001031"
* name = "Oslo universitetssykehus HF"

Instance: Organisasjon-Sykehus
InstanceOf: Organisasjon
Description: "Eksempel på sykehusorganisasjon"
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Example of a hospital organization"
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
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Example of a specialist department"
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
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Example of a health trust (Helse Møre og Romsdal HF)"
* identifier[RSH].system = "urn:oid:2.16.578.1.12.4.1.4.102"
* identifier[RSH].value = "4201115"
* name = "Helse Møre og Romsdal HF"

Instance: Organisasjon-Sykehus-2
InstanceOf: Organisasjon
Description: "Eksempel på sykehusorganisasjon under Helse Møre og Romsdal HF"
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Example of a hospital organization under Helse Møre og Romsdal HF"
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "974747138"
* name = "Helse Møre og Romsdal HF Ålesund sjukehus - Somatikk"
* type[organisatoriskBetegnelse].coding = $organisatoriskBetegnelse#01 "Sykehus"
* partOf = Reference(Organisasjon-HF-2)

Instance: Organisasjon-Seksjon
InstanceOf: Organisasjon
Description: "Eksempel på seksjonsnivå i organisasjonshierarkiet"
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Example of a section level in the organizational hierarchy"
* identifier[RSH].system = "urn:oid:2.16.578.1.12.4.1.4.102"
* identifier[RSH].value = "4223264"
* name = "Kreft og blodsykdommer sengepost Ålesund"
* type[organisatoriskBetegnelse].coding = $organisatoriskBetegnelse#06 "Seksjon"
* partOf = Reference(Organisasjon-Sykehus-2)

Instance: Organisasjon-Post
InstanceOf: Organisasjon
Description: "Eksempel på post – laveste nivå i organisasjonshierarkiet"
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Example of a ward - lowest level in the organizational hierarchy"
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
