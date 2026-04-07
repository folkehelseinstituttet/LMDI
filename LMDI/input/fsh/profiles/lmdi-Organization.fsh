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
* type[organisatoriskNiva] 0..0
// LMDI deaktiverer organisatoriskNiva fordi kodeverket (OID 8628) ikke lenger er i bruk.
// organisatoriskBetegnelse beholdes fra no-basis og brukes i eksemplene.
* type[organisatoriskBetegnelse] ^short = "Organisatorisk betegnelse. Kodeverk \"Organisatorisk betegnelse\" (OID 8624)"
* type[organisatoriskBetegnelse] ^definition = "Kode fra kodeverk \"Organisatorisk betegnelse\" (OID 8624) som beskriver type organisatorisk enhet (f.eks. sykehus, avdeling, klinikk)"

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
* address.extension[official] 0..0
* address.extension[propertyInformation] 0..0
* address.type = #physical
* address.type from LmdiAddressType (required)
* address.type ^short = "physical"

* address.district ^short = "Kommune"
// Bruker no-basis-municipalitycode extension som allerede er definert
* address.district.extension[municipalitycode] ^short = "Kodet verdi for kommune. Kodeverk \"Kommunenummer og regionale spesialkoder\" (OID 3402)"
* address.district.extension[municipalitycode] ^definition = "Kodet verdi for kommune. Koder fra kodeverk \"Kommunenummer og regionale spesialkoder\" (OID 3402) skal benyttes"

* address.state ^short = "Fylkesnavn"
* address.country 0..0

* address.extension[urbanDistrict] ^short = "Kodet verdi for bydel. Kodeverk \"Bydelsnummer\" (OID 3403)"
* address.extension[urbanDistrict] ^definition = "Kodet verdi for bydel. Koder fra kodeverk \"Bydelsnummer\" (OID 3403) skal benyttes"

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
