Profile: Legemiddel
Parent:   Medication
Id:       lmdi-medication
Title:    "Legemiddel"
Description: "Beskrivelse av legemiddel."
* ^status = #draft
* ^date = "2025-09-30"
* ^publisher = "Folkehelseinstituttet"

* manufacturer 0..0
* text 0..0

* code.text 0..0
* code from LegemiddelKoder (extensible)
* code ^short = "Identifikator fra FEST, SNOMED CT eller LokalLegemiddelkatalog. Hvis ikke fylt ut, skal ingredient ha verdi. Hvis LokaltLegemiddel er fylt ut bør ingredient ha verdi."
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains FestLegemiddeldose 0..1
    and FestLmrLopenr 0..1
    and FestLegemiddelMerkevare 0..1
    and FestLegemiddelpakning 0..1
    and Varenummer 0..1
    and FestVirkestoff 0..1
    and LokaltLegemiddel 0..1
    and SCT 0..1

* code.coding[FestLegemiddeldose].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelDose"
* code.coding[FestLmrLopenr].system = "http://dmp.no/fhir/NamingSystem/lmrLopenummer"
* code.coding[FestLegemiddelMerkevare].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare"
* code.coding[FestLegemiddelpakning].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning"
* code.coding[Varenummer].system = "http://dmp.no/fhir/NamingSystem/fest-varenummer"
* code.coding[FestVirkestoff].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff"
* code.coding[SCT].system = "http://snomed.info/sct"
* code.coding[LokaltLegemiddel].system = "http://fh.no/fhir/NamingSystem/lokaltVirkemiddel"

* code.coding[FestLegemiddeldose] ^short = "FEST-id for legemiddeldose"
* code.coding[FestLmrLopenr] ^short = "Fest-løpenummer som identifiserer legemiddeldose"
* code.coding[FestLegemiddelMerkevare] ^short = "FEST-id for LegemiddelMerkevare"
* code.coding[FestLegemiddelpakning] ^short = "FEST-id for legemiddelpakning"
* code.coding[Varenummer] ^short = "Varenummer - Unikt produktnummer for legemiddelpakninger"
* code.coding[FestVirkestoff] ^short = "FEST-id for legemiddel virkestoff"
* code.coding[LokaltLegemiddel] ^short = "Legemiddel fra lokal katalog"
* code.coding[SCT] ^short = "SNOMED CT-kode for legemiddel"

* code.coding[FestLegemiddeldose] ^definition = "Unik identifikator (legemiddeldose-id) for minste plukkbare enhet av en bestemt merkevare, f.eks. 1 tablett eller 1 ampulle."
* code.coding[FestLmrLopenr]     ^definition = "LMR-nummer brukt til å identifisere en endose/minste enhet som kan utleveres; overtatt fra Sykehusapotekenes Legemiddelregister."
* code.coding[FestLegemiddelMerkevare]     ^definition = "Unik identifikator for en bestemt styrke og legemiddelform av en merkevare (branded product) i FEST."
* code.coding[FestLegemiddelpakning] ^definition = "Unik identifikator for en konkret pakning av en merkevare i katalogen LegemiddelPakningMerkevare."
* code.coding[Varenummer]    ^definition = "Varenummeret for legemiddelpakningen; brukes som unikt produktnummer blant annet i resept- og apotekkjeden."
* code.coding[FestVirkestoff]    ^definition = "Unik identifikator (LegemiddelVirkestoff_ID) for rekvirering på virkestoffnivå i FEST."
* code.coding[LokaltLegemiddel]  ^definition = "Skal kun benyttes for legemidler fra lokal legemiddelkatalog/legemiddelregister. Hvis LokaltLegemiddel benyttes skal det avtales med FHI hvordan LMR skal få tilgang til legemiddelkatalogen for å hente informasjon om det lokale legemidlet. "
* code.coding[SCT]               ^definition = "SNOMED CT-kode for legemiddel eller substans, for semantisk klassifisering og gruppering."

* code.coding[FestLegemiddeldose].code ^short = "Identifikator fra FEST"
* code.coding[FestLmrLopenr].code ^short = "7‑sifret nummer"
* code.coding[FestLegemiddelMerkevare].code ^short = "Identifikator fra FEST"
* code.coding[FestLegemiddelpakning].code ^short = "Identifikator fra FEST"
* code.coding[Varenummer].code ^short = "Varenummer"
* code.coding[FestVirkestoff].code ^short = "Identifikator fra FEST"
* code.coding[LokaltLegemiddel].code ^short = "Identifikator fra lokal legemiddelkatalog/legemiddelregister"
* code.coding[SCT].code ^short = "SNOMED CT-koden skal være et underbegrep av 'Legemiddel (product)' [763158003] eller 'Substans (substance)' [105590001]."

* code.coding[FestLegemiddeldose].code 1..1
* code.coding[FestLmrLopenr].code 1..1
* code.coding[FestLegemiddelMerkevare].code 1..1
* code.coding[FestLegemiddelpakning].code 1..1
* code.coding[Varenummer].code 1..1
* code.coding[FestVirkestoff].code 1..1
* code.coding[LokaltLegemiddel].code 1..1
* code.coding[SCT].code 1..1

* code.coding[LokaltLegemiddel].display 1..1
* code.coding[LokaltLegemiddel].display ^short = "Beskrivelse (f.eks. varenavn) for legemiddel fra lokal legemiddelkatalog/legemiddelregister"

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #closed
* extension contains LegemiddelClassification named classification 0..*
* extension[classification] ^short = "Klassifisering av legemidlet, fortrinnsvis ved bruk av ATC-kode fra WHO ATC kodesystem. Ett legemiddel kan ha inntil én ATC-kode."
* extension[classification] ^definition = "Klassifisering av legemidlet, fortrinnsvis ved bruk av ATC-kode fra WHO ATC kodesystem. Ett legemiddel kan ha inntil én ATC-kode."
* extension[classification] ^comment = "Denne extension brukes for å angi legemidlets klassifisering i henhold til standardiserte kodesystemer, primært ATC-koder fra WHO."

* form.text 0..0
* form ^short = "Legemiddelform"
* form.coding 1..*
* form.coding.system 1..1
* form.coding.code 1..1
* form.coding.display MS
* form.coding ^slicing.discriminator.type = #value
* form.coding ^slicing.discriminator.path = "system"
* form.coding ^slicing.rules = #closed
* form.coding contains 7448 0..1 and SCT 0..1
* form.coding 1..* 
* form.coding ^short = "Legemiddelform"
* form.coding ^comment = "Kodet legemiddelform. Inntil videre begrenset til Legemiddelform (OID: 7448) og kodesetteksempel fra HL7 basert på SNOMED CT."
* form.coding[7448] ^short = "Kodeverk Legemiddelform (OID:7448) fra FEST"
* form.coding[SCT] ^short = "SNOMED CT Form Codes"
* form.coding[7448].code 1..1
* form.coding[7448].code ^short = "Verdi fra kodeverket"
* form.coding[7448].display ^short = "Beskrivelse av koden (navn) fra kodeverket"
* form.coding[7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448" 
* form.coding[SCT].system = "http://snomed.info/sct" 

* batch MS
* batch ^short = "Batch-nummer for legemiddelet"

// Fix for targetProfile constraint error: Use type-specific constraints instead
* ingredient ^short = "Virkestoff(er) som inngår i legemiddelet. Skal fylles ut hvis code ikke har verdi. Bør fylles ut hvis code.coding[LokaltLegemiddel] har verdi."
* ingredient ^definition = "Virkestoff(er) som inngår i legemiddelet. Skal fylles ut hvis code ikke har verdi. Bør fylles ut hvis code.coding[LokaltLegemiddel] har verdi."
* ingredient ^comment = "For legemidler identifisert med FEST-koder (FestLegemiddeldose, FestLegemiddelMerkevare, FestLegemiddelpakning, FestVirkestoff, Varenummer) eller SNOMED CT er ingredient valgfritt, da virkestoffinformasjon kan hentes fra disse katalogene. For lokale legemidler anbefales det å oppgi ingredient for bedre sporbarhet."
* ingredient.item[x] only Reference or CodeableConcept
* ingredient.itemReference only Reference($LMDISubstance or $LMDIMedication)
* ingredient.itemCodeableConcept from LegemiddelKoder (preferred)


// EKSEMPLER
Alias: $ATC = http://www.whocc.no/atc

Instance: Medisin-1-LegemiddelDose-Oxycodone
InstanceOf: Legemiddel
Description: "Eksempel på legemiddel"
// "Oxycodone Orifarm mikst oppl 1 mg/ml"
* identifier.system = "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff"
* identifier.value = "C31AF94A-5D5A-4C91-9B99-BB221E26E4C9"
* extension[classification].valueCodeableConcept = $ATC#N02AA05 "Oksykodon"
* code.coding[FestVirkestoff].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff"
* code.coding[FestVirkestoff].code = #C31AF94A-5D5A-4C91-9B99-BB221E26E4C9
* code.coding[FestVirkestoff].display = "Oksykodon"

Instance: Medisin-2-Paracetamol
InstanceOf: Legemiddel
Description: "Eksempel på legemiddel - Paracetamol - UTKAST"
* identifier.system = "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare"
* identifier.value = "2ABAC272-0BCF-43F0-84BE-984074D92E15"
* extension[classification].valueCodeableConcept = $ATC#N02BE01 "Paracetamol"
* code.coding[FestLegemiddelMerkevare].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare"
* code.coding[FestLegemiddelMerkevare].code = #2ABAC272-0BCF-43F0-84BE-984074D92E15
* code.coding[FestLegemiddelMerkevare].display = "Paracetamol"

Instance: Medisin-3-LegemiddelPakning-Monoket
InstanceOf: Legemiddel
Description: "Eksempel på legemiddel - paking"
* identifier.system = "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning"
* identifier.value = "0003602E-315E-4CDE-9EB0-6756BE9CD120"
* extension[classification].valueCodeableConcept = $ATC#C01DA14 "Isosorbid mononitrat"
* code.coding[FestLegemiddelpakning].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning"
* code.coding[FestLegemiddelpakning].code = #0003602E-315E-4CDE-9EB0-6756BE9CD120
* code.coding[FestLegemiddelpakning].display = "Monoket"
