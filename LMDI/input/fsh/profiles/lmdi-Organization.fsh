// Hoveddefinisjon av organisasjonsprofil
Profile: Organisasjon
Parent: NoBasisOrganization
Id: lmdi-organization
Title: "Organisasjon"
Description: """
Organisasjoner i norsk helse- og omsorgstjeneste, som post, avdeling, klinikk, sykehus og sykehjem, basert på no-basis-Organization.

Denne profilen av Organization benyttes for å beskrive helseinstitusjoner og skal representere organisasjonen på lavest mulig nivå i organisasjonshierarkiet (f.eks. en avdeling eller klinikk eller post).

For organisasjonen som er del av en større organisasjon, skal dette angis ved hjelp av partOf-relasjonen. Alle "organisasjonshierarki" skal inkludere minst et organisasjonsnummer fra Enhetsregisteret (identifier:ENH)
"""
* ^version = "1.0.7"
* ^status = #draft
* ^date = "2025-09-30"
* ^publisher = "Folkehelseinstituttet"

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

* identifier[ENH] ^short = "Organisasjonsnummer fra Enhetsregisteret (ENH)"
* identifier[ENH] ^comment = "Identifikatorer skal angis på laveste relevante virksomhetsnivå i henhold til SSBs retningslinjer. For kommunale tjenester betyr dette på institusjonsnivå (f.eks sykehjem) der egen organisatorisk enhet er etablert, ikke på overordnet kommunenivå."

* identifier[RSH] ^short = "ID fra Register for enheter i spesialisthelsetjenesten (RESH)"
* identifier[RSH] ^comment = "Det nivået aktiviteten har skjedd på."

// Organisasjonstype og navn - bruker no-basis slices
* type 0..*
* type ^short = "Organisasjonstype"
* type ^definition = "Type organisasjon (f.eks. sykehus, avdeling, klinikk)"
// no-basis definerer slices: organisatoriskNiva og organisatoriskBetegnelse med required bindings

* name 1..1 MS 
* name ^short = "Organisasjonsnavn"
* name ^definition = "Offisielt navn på organisasjonen"
* name ^comment = "Kan være navn på post, avdelingsnavn, klinikknavn, sykehusnavn eller sykehjemsnavn"

// Hierarkisk struktur
* partOf MS
* partOf ^short = "Organisasjonen er del av (overordnet organisasjon)"
* partOf ^definition = "Organisasjonen er del av (overordnet organisasjon)"
* partOf only Reference(Organisasjon)

// Adresse
* address MS
* address ^short = "Gjeldende fysisk adresse"
* address.type = #physical

* address.district ^short = "Kommune"
// Bruker no-basis-municipalitycode extension som allerede er definert
* address.district.extension[municipalitycode] ^short = "Kodet verdi for kommune. Kodeverk \"Kommunenummer og regionale spesialkoder\" (OID 3402)"
* address.district.extension[municipalitycode] ^definition = "Kodet verdi for kommune. Koder fra kodeverk \"Kommunenummer og regionale spesialkoder\" (OID 3402) skal benyttes"

* address.state ^short = "Fylkesnavn"
* address.country 0..0

* address.extension contains LmdiUrbanDistrict named lmdiUrbanDistrict 0..1
* address.extension[lmdiUrbanDistrict] ^short = "Kodet verdi for bydel. Kodeverk \"Bydelsnummer\" (OID 3403)"

// EKSEMPLER
Instance: Organisasjon-1-Sykehjem
InstanceOf: Organisasjon
Description: "Eksempel på sykehjem i primærhelsetjenesten"
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "1234567890"
* name = "Lykkedalen sykehjem"
// Midlertidig fjernet type for testing - kan legges tilbake med no-basis slices
* address.type = #physical
* address.district = "Sigdal"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#3025 "Sigdal"

Instance: Organisasjon-2-Avdeling
InstanceOf: Organisasjon
Description: "Eksempel på spesialistavdeling"
* identifier[RSH].system = "urn:oid:2.16.578.1.12.4.1.4.102"
* identifier[RSH].value = "4208723"
* name = "Avdeling for epilepsi, poliklinikk"
// Midlertidig fjernet type for testing
* partOf = Reference(Organisasjon-3-Sykehus)

Instance: Organisasjon-3-Sykehus
InstanceOf: Organisasjon
Description: "Eksempel på sykehusorganisasjon"
* identifier[ENH].system = "urn:oid:2.16.578.1.12.4.1.4.101"
* identifier[ENH].value = "993467049"
* identifier[RSH].system = "urn:oid:2.16.578.1.12.4.1.4.102"
* identifier[RSH].value = "4001031"
* name = "Oslo universitetssykehus HF"
// Midlertidig fjernet type for testing
* address.type = #physical
* address.district = "Oslo"
* address.district.extension[municipalitycode].valueCoding = $kommunenummer-alle#0301 "Oslo"
* address.extension[lmdiUrbanDistrict].valueCoding = $VsLmdiUrbanDistrict#01 "Gamle Oslo"

// Invariant definisjon
Invariant: lmdi-org-identifier
Description: "Organisasjon skal ha minst ENH eller RSH identifier"
Severity: #error
Expression: "identifier.where(system='urn:oid:2.16.578.1.12.4.1.4.101' or system='urn:oid:2.16.578.1.12.4.1.4.102').exists()"
