Profile: Legemiddel
Parent:   Medication
Id:       lmdi-medication
Title:    "Legemiddel"
Description: "Beskrivelse av legemiddel."
* ^status = #draft
* ^date = "2025-09-30"
* ^publisher = "Folkehelseinstituttet"
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Medication"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "Description of a medication."

* obeys lmdi-medication-code-or-ingredient
* manufacturer 0..0
* text 0..0

* code.text 0..0
* code from LegemiddelKoder (extensible)
* code ^short = "Identifikator fra FEST, SNOMED CT eller LokalLegemiddelkatalog. Hvis ikke fylt ut, skal ingredient ha verdi. Hvis LokaltLegemiddel er fylt ut bør ingredient ha verdi."
* code ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code ^short.extension[=].extension[+].url = "lang"
* code ^short.extension[=].extension[=].valueCode = #en
* code ^short.extension[=].extension[+].url = "content"
* code ^short.extension[=].extension[=].valueString = "Identifier from FEST, SNOMED CT, or the local medication catalog. If not populated, ingredient shall have a value. If LokaltLegemiddel is populated, ingredient should have a value."
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains FestLegemiddeldose 0..1
    and FestLmrLopenr 0..1
    and FestLegemiddelMerkevare 0..1
    and FestLegemiddelpakning 0..1
    and Varenummer 0..1
    and FestLegemiddelVirkestoff 0..1
    and LokaltLegemiddel 0..1
    and SCT 0..1

* code.coding[FestLegemiddeldose].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelDose"
* code.coding[FestLmrLopenr].system = "http://dmp.no/fhir/NamingSystem/lmrLopenummer"
* code.coding[FestLegemiddelMerkevare].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare"
* code.coding[FestLegemiddelpakning].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning"
* code.coding[Varenummer].system = "http://dmp.no/fhir/NamingSystem/fest-varenummer"
* code.coding[FestLegemiddelVirkestoff].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff"
* code.coding[SCT].system = "http://snomed.info/sct"
* code.coding[LokaltLegemiddel].system = "http://fhi.no/fhir/NamingSystem/lokaltLegemiddel"

* code.coding[FestLegemiddeldose] ^short = "FEST-id for legemiddeldose"
* code.coding[FestLegemiddeldose] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[FestLegemiddeldose] ^short.extension[=].extension[+].url = "lang"
* code.coding[FestLegemiddeldose] ^short.extension[=].extension[=].valueCode = #en
* code.coding[FestLegemiddeldose] ^short.extension[=].extension[+].url = "content"
* code.coding[FestLegemiddeldose] ^short.extension[=].extension[=].valueString = "FEST ID for medication dose"
* code.coding[FestLmrLopenr] ^short = "Fest-løpenummer som identifiserer legemiddeldose"
* code.coding[FestLmrLopenr] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[FestLmrLopenr] ^short.extension[=].extension[+].url = "lang"
* code.coding[FestLmrLopenr] ^short.extension[=].extension[=].valueCode = #en
* code.coding[FestLmrLopenr] ^short.extension[=].extension[+].url = "content"
* code.coding[FestLmrLopenr] ^short.extension[=].extension[=].valueString = "FEST sequence number identifying the medication dose"
* code.coding[FestLegemiddelMerkevare] ^short = "FEST-id for LegemiddelMerkevare"
* code.coding[FestLegemiddelMerkevare] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[FestLegemiddelMerkevare] ^short.extension[=].extension[+].url = "lang"
* code.coding[FestLegemiddelMerkevare] ^short.extension[=].extension[=].valueCode = #en
* code.coding[FestLegemiddelMerkevare] ^short.extension[=].extension[+].url = "content"
* code.coding[FestLegemiddelMerkevare] ^short.extension[=].extension[=].valueString = "FEST ID for branded medication"
* code.coding[FestLegemiddelpakning] ^short = "FEST-id for legemiddelpakning"
* code.coding[FestLegemiddelpakning] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[FestLegemiddelpakning] ^short.extension[=].extension[+].url = "lang"
* code.coding[FestLegemiddelpakning] ^short.extension[=].extension[=].valueCode = #en
* code.coding[FestLegemiddelpakning] ^short.extension[=].extension[+].url = "content"
* code.coding[FestLegemiddelpakning] ^short.extension[=].extension[=].valueString = "FEST ID for medication package"
* code.coding[Varenummer] ^short = "Varenummer - Unikt produktnummer for legemiddelpakninger"
* code.coding[Varenummer] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[Varenummer] ^short.extension[=].extension[+].url = "lang"
* code.coding[Varenummer] ^short.extension[=].extension[=].valueCode = #en
* code.coding[Varenummer] ^short.extension[=].extension[+].url = "content"
* code.coding[Varenummer] ^short.extension[=].extension[=].valueString = "Item number - unique product number for medication packages"
* code.coding[FestLegemiddelVirkestoff] ^short = "FEST-id for legemiddel virkestoff"
* code.coding[FestLegemiddelVirkestoff] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[FestLegemiddelVirkestoff] ^short.extension[=].extension[+].url = "lang"
* code.coding[FestLegemiddelVirkestoff] ^short.extension[=].extension[=].valueCode = #en
* code.coding[FestLegemiddelVirkestoff] ^short.extension[=].extension[+].url = "content"
* code.coding[FestLegemiddelVirkestoff] ^short.extension[=].extension[=].valueString = "FEST ID for medication substance"
* code.coding[LokaltLegemiddel] ^short = "Legemiddel fra lokal katalog"
* code.coding[LokaltLegemiddel] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[LokaltLegemiddel] ^short.extension[=].extension[+].url = "lang"
* code.coding[LokaltLegemiddel] ^short.extension[=].extension[=].valueCode = #en
* code.coding[LokaltLegemiddel] ^short.extension[=].extension[+].url = "content"
* code.coding[LokaltLegemiddel] ^short.extension[=].extension[=].valueString = "Medication from a local catalog"
* code.coding[SCT] ^short = "SNOMED CT-kode for legemiddel"
* code.coding[SCT] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[SCT] ^short.extension[=].extension[+].url = "lang"
* code.coding[SCT] ^short.extension[=].extension[=].valueCode = #en
* code.coding[SCT] ^short.extension[=].extension[+].url = "content"
* code.coding[SCT] ^short.extension[=].extension[=].valueString = "SNOMED CT code for medication"

* code.coding[FestLegemiddeldose] ^definition = "Unik identifikator (legemiddeldose-id) for minste plukkbare enhet av en bestemt merkevare, f.eks. 1 tablett eller 1 ampulle."
* code.coding[FestLegemiddeldose] ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[FestLegemiddeldose] ^definition.extension[=].extension[+].url = "lang"
* code.coding[FestLegemiddeldose] ^definition.extension[=].extension[=].valueCode = #en
* code.coding[FestLegemiddeldose] ^definition.extension[=].extension[+].url = "content"
* code.coding[FestLegemiddeldose] ^definition.extension[=].extension[=].valueString = "Unique identifier (medication dose ID) for the smallest dispensable unit of a specific branded product, for example one tablet or one ampoule."
* code.coding[FestLmrLopenr]     ^definition = "LMR-nummer brukt til å identifisere en endose/minste enhet som kan utleveres; overtatt fra Sykehusapotekenes Legemiddelregister."
* code.coding[FestLmrLopenr]     ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[FestLmrLopenr]     ^definition.extension[=].extension[+].url = "lang"
* code.coding[FestLmrLopenr]     ^definition.extension[=].extension[=].valueCode = #en
* code.coding[FestLmrLopenr]     ^definition.extension[=].extension[+].url = "content"
* code.coding[FestLmrLopenr]     ^definition.extension[=].extension[=].valueString = "LMR number used to identify a single dose or smallest dispensable unit; inherited from the Hospital Pharmacy Medication Register."
* code.coding[FestLegemiddelMerkevare]     ^definition = "Unik identifikator for en bestemt styrke og legemiddelform av en merkevare (branded product) i FEST."
* code.coding[FestLegemiddelpakning] ^definition = "Unik identifikator for en konkret pakning av en merkevare i katalogen LegemiddelPakningMerkevare."
* code.coding[Varenummer]    ^definition = "Varenummeret for legemiddelpakningen; brukes som unikt produktnummer blant annet i resept- og apotekkjeden."
* code.coding[FestLegemiddelVirkestoff]    ^definition = "Unik identifikator (LegemiddelVirkestoff_ID) for rekvirering på virkestoffnivå i FEST."
* code.coding[LokaltLegemiddel]  ^definition = "Skal kun benyttes for legemidler fra lokal legemiddelkatalog/legemiddelregister. Hvis LokaltLegemiddel benyttes skal det avtales med FHI hvordan LMR skal få tilgang til legemiddelkatalogen for å hente informasjon om det lokale legemidlet. "
* code.coding[SCT]               ^definition = "SNOMED CT-kode for legemiddel eller substans, for semantisk klassifisering og gruppering."
* code.coding[FestLegemiddelMerkevare]     ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[FestLegemiddelMerkevare]     ^definition.extension[=].extension[+].url = "lang"
* code.coding[FestLegemiddelMerkevare]     ^definition.extension[=].extension[=].valueCode = #en
* code.coding[FestLegemiddelMerkevare]     ^definition.extension[=].extension[+].url = "content"
* code.coding[FestLegemiddelMerkevare]     ^definition.extension[=].extension[=].valueString = "Unique identifier for a specific strength and form of a branded product in FEST."
* code.coding[FestLegemiddelpakning] ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[FestLegemiddelpakning] ^definition.extension[=].extension[+].url = "lang"
* code.coding[FestLegemiddelpakning] ^definition.extension[=].extension[=].valueCode = #en
* code.coding[FestLegemiddelpakning] ^definition.extension[=].extension[+].url = "content"
* code.coding[FestLegemiddelpakning] ^definition.extension[=].extension[=].valueString = "Unique identifier for a specific package of a branded product in the LegemiddelPakningMerkevare catalog."
* code.coding[Varenummer]    ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[Varenummer]    ^definition.extension[=].extension[+].url = "lang"
* code.coding[Varenummer]    ^definition.extension[=].extension[=].valueCode = #en
* code.coding[Varenummer]    ^definition.extension[=].extension[+].url = "content"
* code.coding[Varenummer]    ^definition.extension[=].extension[=].valueString = "The item number for the medication package; used as a unique product number in the prescription and pharmacy chain."
* code.coding[FestLegemiddelVirkestoff]    ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[FestLegemiddelVirkestoff]    ^definition.extension[=].extension[+].url = "lang"
* code.coding[FestLegemiddelVirkestoff]    ^definition.extension[=].extension[=].valueCode = #en
* code.coding[FestLegemiddelVirkestoff]    ^definition.extension[=].extension[+].url = "content"
* code.coding[FestLegemiddelVirkestoff]    ^definition.extension[=].extension[=].valueString = "Unique identifier (LegemiddelVirkestoff_ID) for substance-based prescribing in FEST."
* code.coding[LokaltLegemiddel]  ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[LokaltLegemiddel]  ^definition.extension[=].extension[+].url = "lang"
* code.coding[LokaltLegemiddel]  ^definition.extension[=].extension[=].valueCode = #en
* code.coding[LokaltLegemiddel]  ^definition.extension[=].extension[+].url = "content"
* code.coding[LokaltLegemiddel]  ^definition.extension[=].extension[=].valueString = "Should only be used for medications from a local medication catalog or medication register. If LokaltLegemiddel is used, FHI should agree on how LMR will access the medication catalog to retrieve information about the local medication."
* code.coding[SCT]               ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[SCT]               ^definition.extension[=].extension[+].url = "lang"
* code.coding[SCT]               ^definition.extension[=].extension[=].valueCode = #en
* code.coding[SCT]               ^definition.extension[=].extension[+].url = "content"
* code.coding[SCT]               ^definition.extension[=].extension[=].valueString = "SNOMED CT code for medication or substance, used for semantic classification and grouping."

* code.coding[FestLegemiddeldose].code ^short = "Identifikator fra FEST"
* code.coding[FestLmrLopenr].code ^short = "7‑sifret nummer"
* code.coding[FestLegemiddelMerkevare].code ^short = "Identifikator fra FEST"
* code.coding[FestLegemiddelpakning].code ^short = "Identifikator fra FEST"
* code.coding[Varenummer].code ^short = "Varenummer"
* code.coding[FestLegemiddelVirkestoff].code ^short = "Identifikator fra FEST"
* code.coding[LokaltLegemiddel].code ^short = "Identifikator fra lokal legemiddelkatalog/legemiddelregister"
* code.coding[LokaltLegemiddel].code ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[LokaltLegemiddel].code ^short.extension[=].extension[+].url = "lang"
* code.coding[LokaltLegemiddel].code ^short.extension[=].extension[=].valueCode = #en
* code.coding[LokaltLegemiddel].code ^short.extension[=].extension[+].url = "content"
* code.coding[LokaltLegemiddel].code ^short.extension[=].extension[=].valueString = "Identifier from the local medication catalog or medication register"
* code.coding[SCT].code ^short = "SNOMED CT-koden skal være et underbegrep av 'Legemiddel (product)' [763158003] eller 'Substans (substance)' [105590001]."
* code.coding[SCT].code ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[SCT].code ^short.extension[=].extension[+].url = "lang"
* code.coding[SCT].code ^short.extension[=].extension[=].valueCode = #en
* code.coding[SCT].code ^short.extension[=].extension[+].url = "content"
* code.coding[SCT].code ^short.extension[=].extension[=].valueString = "The SNOMED CT code shall be a subtype of 'Medication (product)' [763158003] or 'Substance' [105590001]."

* code.coding[FestLegemiddeldose].code 1..1
* code.coding[FestLmrLopenr].code 1..1
* code.coding[FestLegemiddelMerkevare].code 1..1
* code.coding[FestLegemiddelpakning].code 1..1
* code.coding[Varenummer].code 1..1
* code.coding[FestLegemiddelVirkestoff].code 1..1
* code.coding[LokaltLegemiddel].code 1..1
* code.coding[SCT].code 1..1

* code.coding[LokaltLegemiddel].display 1..1
* code.coding[LokaltLegemiddel].display ^short = "Beskrivelse (f.eks. varenavn) for legemiddel fra lokal legemiddelkatalog/legemiddelregister"
* code.coding[LokaltLegemiddel].display ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[LokaltLegemiddel].display ^short.extension[=].extension[+].url = "lang"
* code.coding[LokaltLegemiddel].display ^short.extension[=].extension[=].valueCode = #en
* code.coding[LokaltLegemiddel].display ^short.extension[=].extension[+].url = "content"
* code.coding[LokaltLegemiddel].display ^short.extension[=].extension[=].valueString = "Description (for example, product name) for a medication from the local medication catalog or register"
* code.coding[FestLegemiddeldose].display ^short = "NavnFormStyrke fra FEST"
* code.coding[FestLegemiddeldose].display ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[FestLegemiddeldose].display ^short.extension[=].extension[+].url = "lang"
* code.coding[FestLegemiddeldose].display ^short.extension[=].extension[=].valueCode = #en
* code.coding[FestLegemiddeldose].display ^short.extension[=].extension[+].url = "content"
* code.coding[FestLegemiddeldose].display ^short.extension[=].extension[=].valueString = "Name, form, and strength from FEST"
* code.coding[FestLmrLopenr].display ^short = "NavnFormStyrke fra FEST"
* code.coding[FestLmrLopenr].display ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[FestLmrLopenr].display ^short.extension[=].extension[+].url = "lang"
* code.coding[FestLmrLopenr].display ^short.extension[=].extension[=].valueCode = #en
* code.coding[FestLmrLopenr].display ^short.extension[=].extension[+].url = "content"
* code.coding[FestLmrLopenr].display ^short.extension[=].extension[=].valueString = "Name, form, and strength from FEST"
* code.coding[FestLegemiddelMerkevare].display ^short = "Varenavn eller NavnFormStyrke fra FEST"
* code.coding[FestLegemiddelMerkevare].display ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[FestLegemiddelMerkevare].display ^short.extension[=].extension[+].url = "lang"
* code.coding[FestLegemiddelMerkevare].display ^short.extension[=].extension[=].valueCode = #en
* code.coding[FestLegemiddelMerkevare].display ^short.extension[=].extension[+].url = "content"
* code.coding[FestLegemiddelMerkevare].display ^short.extension[=].extension[=].valueString = "Product name or name, form, and strength from FEST"
* code.coding[FestLegemiddelpakning].display ^short = "Varenavn eller NavnFormStyrke fra FEST"
* code.coding[FestLegemiddelpakning].display ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[FestLegemiddelpakning].display ^short.extension[=].extension[+].url = "lang"
* code.coding[FestLegemiddelpakning].display ^short.extension[=].extension[=].valueCode = #en
* code.coding[FestLegemiddelpakning].display ^short.extension[=].extension[+].url = "content"
* code.coding[FestLegemiddelpakning].display ^short.extension[=].extension[=].valueString = "Product name or name, form, and strength from FEST"
* code.coding[Varenummer].display ^short = "Varenavn eller NavnFormStyrke fra FEST"
* code.coding[Varenummer].display ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[Varenummer].display ^short.extension[=].extension[+].url = "lang"
* code.coding[Varenummer].display ^short.extension[=].extension[=].valueCode = #en
* code.coding[Varenummer].display ^short.extension[=].extension[+].url = "content"
* code.coding[Varenummer].display ^short.extension[=].extension[=].valueString = "Product name or name, form, and strength from FEST"
* code.coding[FestLegemiddelVirkestoff].display ^short = "NavnFormStyrke fra FEST"
* code.coding[FestLegemiddelVirkestoff].display ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* code.coding[FestLegemiddelVirkestoff].display ^short.extension[=].extension[+].url = "lang"
* code.coding[FestLegemiddelVirkestoff].display ^short.extension[=].extension[=].valueCode = #en
* code.coding[FestLegemiddelVirkestoff].display ^short.extension[=].extension[+].url = "content"
* code.coding[FestLegemiddelVirkestoff].display ^short.extension[=].extension[=].valueString = "Name, form, and strength from FEST"

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #closed
* extension contains LegemiddelClassification named classification 0..*
* extension[classification] ^short = "Klassifisering av legemidlet ved bruk av ATC-kode fra WHO ATC kodesystem."
* extension[classification] ^definition = "Klassifisering av legemidlet ved bruk av ATC-kode fra WHO ATC kodesystem. Et legemiddel har i utgangspunktet kun én ATC-kode."
* extension[classification] ^comment = "Denne extension brukes for å angi legemidlets klassifisering i henhold til standardiserte kodesystemer, primært ATC-koder fra WHO."
* extension[classification] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* extension[classification] ^short.extension[=].extension[+].url = "lang"
* extension[classification] ^short.extension[=].extension[=].valueCode = #en
* extension[classification] ^short.extension[=].extension[+].url = "content"
* extension[classification] ^short.extension[=].extension[=].valueString = "Classification of the medication using an ATC code from the WHO ATC code system."
* extension[classification] ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* extension[classification] ^definition.extension[=].extension[+].url = "lang"
* extension[classification] ^definition.extension[=].extension[=].valueCode = #en
* extension[classification] ^definition.extension[=].extension[+].url = "content"
* extension[classification] ^definition.extension[=].extension[=].valueString = "Classification of the medication using an ATC code from the WHO ATC code system. A medication normally has only one ATC code."
* extension[classification] ^comment.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* extension[classification] ^comment.extension[=].extension[+].url = "lang"
* extension[classification] ^comment.extension[=].extension[=].valueCode = #en
* extension[classification] ^comment.extension[=].extension[+].url = "content"
* extension[classification] ^comment.extension[=].extension[=].valueString = "This extension is used to specify the medication's classification according to standardized code systems, primarily WHO ATC codes."

* form.text 0..0
* form ^short = "Legemiddelform"
* form ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* form ^short.extension[=].extension[+].url = "lang"
* form ^short.extension[=].extension[=].valueCode = #en
* form ^short.extension[=].extension[+].url = "content"
* form ^short.extension[=].extension[=].valueString = "Medication form"
* form.coding 1..*
* form.coding.system 1..1
* form.coding.code 1..1
* form.coding.display MS
* form.coding ^slicing.discriminator.type = #value
* form.coding ^slicing.discriminator.path = "system"
* form.coding ^slicing.rules = #closed
* form.coding contains OID7448 0..1 and SCT 0..1
* form.coding ^short = "Legemiddelform"
* form.coding ^comment = "Kodet legemiddelform. Inntil videre begrenset til Legemiddelform (OID: 7448) og kodesetteksempel fra HL7 basert på SNOMED CT."
* form.coding ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* form.coding ^short.extension[=].extension[+].url = "lang"
* form.coding ^short.extension[=].extension[=].valueCode = #en
* form.coding ^short.extension[=].extension[+].url = "content"
* form.coding ^short.extension[=].extension[=].valueString = "Medication form"
* form.coding ^comment.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* form.coding ^comment.extension[=].extension[+].url = "lang"
* form.coding ^comment.extension[=].extension[=].valueCode = #en
* form.coding ^comment.extension[=].extension[+].url = "content"
* form.coding ^comment.extension[=].extension[=].valueString = "Coded medication form. Currently limited to medication form (OID: 7448) and the HL7 SNOMED CT example code set."
* form.coding[OID7448] ^short = "Kodeverk Legemiddelform (OID:7448) fra FEST"
* form.coding[OID7448] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* form.coding[OID7448] ^short.extension[=].extension[+].url = "lang"
* form.coding[OID7448] ^short.extension[=].extension[=].valueCode = #en
* form.coding[OID7448] ^short.extension[=].extension[+].url = "content"
* form.coding[OID7448] ^short.extension[=].extension[=].valueString = "Medication form code system (OID:7448) from FEST"
* form.coding[SCT] ^short = "SNOMED CT Form Codes"
* form.coding[OID7448].code 1..1
* form.coding[OID7448].code ^short = "Verdi fra kodeverket"
* form.coding[OID7448].code ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* form.coding[OID7448].code ^short.extension[=].extension[+].url = "lang"
* form.coding[OID7448].code ^short.extension[=].extension[=].valueCode = #en
* form.coding[OID7448].code ^short.extension[=].extension[+].url = "content"
* form.coding[OID7448].code ^short.extension[=].extension[=].valueString = "Value from the code system"
* form.coding[OID7448].display ^short = "Beskrivelse av koden (navn) fra kodeverket"
* form.coding[OID7448].display ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* form.coding[OID7448].display ^short.extension[=].extension[+].url = "lang"
* form.coding[OID7448].display ^short.extension[=].extension[=].valueCode = #en
* form.coding[OID7448].display ^short.extension[=].extension[+].url = "content"
* form.coding[OID7448].display ^short.extension[=].extension[=].valueString = "Code description (name) from the code system"
* form.coding[OID7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448"
* form.coding[SCT].system = "http://snomed.info/sct"

* batch MS
* batch ^short = "Batch-nummer for legemiddelet"
* batch ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* batch ^short.extension[=].extension[+].url = "lang"
* batch ^short.extension[=].extension[=].valueCode = #en
* batch ^short.extension[=].extension[+].url = "content"
* batch ^short.extension[=].extension[=].valueString = "Batch number for the medication"

// Fix for targetProfile constraint error: Use type-specific constraints instead
* ingredient ^short = "Virkestoff(er) som inngår i legemiddelet. Skal fylles ut hvis code ikke har verdi. Bør fylles ut hvis code.coding[LokaltLegemiddel] har verdi."
* ingredient ^definition = "Virkestoff(er) som inngår i legemiddelet. Skal fylles ut hvis code ikke har verdi. Bør fylles ut hvis code.coding[LokaltLegemiddel] har verdi."
* ingredient ^comment = "For legemidler identifisert med FEST-koder (FestLegemiddeldose, FestLegemiddelMerkevare, FestLegemiddelpakning, FestLegemiddelVirkestoff, Varenummer) eller SNOMED CT er ingredient valgfritt, da virkestoffinformasjon kan hentes fra disse katalogene. For lokale legemidler anbefales det å oppgi ingredient for bedre sporbarhet."
* ingredient ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ingredient ^short.extension[=].extension[+].url = "lang"
* ingredient ^short.extension[=].extension[=].valueCode = #en
* ingredient ^short.extension[=].extension[+].url = "content"
* ingredient ^short.extension[=].extension[=].valueString = "Ingredient(s) in the medication. Shall be populated if code has no value. Should be populated if code.coding[LokaltLegemiddel] has a value."
* ingredient ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ingredient ^definition.extension[=].extension[+].url = "lang"
* ingredient ^definition.extension[=].extension[=].valueCode = #en
* ingredient ^definition.extension[=].extension[+].url = "content"
* ingredient ^definition.extension[=].extension[=].valueString = "Ingredient(s) in the medication. Shall be populated if code has no value. Should be populated if code.coding[LokaltLegemiddel] has a value."
* ingredient ^comment.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ingredient ^comment.extension[=].extension[+].url = "lang"
* ingredient ^comment.extension[=].extension[=].valueCode = #en
* ingredient ^comment.extension[=].extension[+].url = "content"
* ingredient ^comment.extension[=].extension[=].valueString = "For medications identified with FEST codes (FestLegemiddeldose, FestLegemiddelMerkevare, FestLegemiddelpakning, FestLegemiddelVirkestoff, Varenummer) or SNOMED CT, ingredient is optional because substance information can be retrieved from those catalogs. For local medications, it is recommended to specify ingredient for better traceability."
* ingredient.item[x] only Reference or CodeableConcept
* ingredient.itemReference only Reference($LMDISubstance or $LMDIMedication)
* ingredient.itemCodeableConcept from LegemiddelKoder (preferred)


// EKSEMPLER
Instance: Legemiddel-FestLegemiddelVirkestoff
InstanceOf: Legemiddel
Description: "Eksempel på legemiddel identifisert med FEST legemiddelvirkestoff-id"
* extension[classification].valueCodeableConcept = $ATC#N02AA05 "Oksykodon"
* code.coding[FestLegemiddelVirkestoff].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff"
* code.coding[FestLegemiddelVirkestoff].code = #ID_128B21F2-34CE-4FEF-81CA-AD3BD9A5690E
* code.coding[FestLegemiddelVirkestoff].display = "Oksykodon mikst oppl 1 mg/ml"
* form.coding[OID7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448"
* form.coding[OID7448].code = #842
* form.coding[OID7448].display = "Mikstur, oppløsning"

Instance: Legemiddel-FestLegemiddelMerkevare
InstanceOf: Legemiddel
Description: "Eksempel på legemiddel identifisert med FEST legemiddelmerkevare-id"
* extension[classification].valueCodeableConcept = $ATC#N02BE01 "Paracetamol"
* code.coding[FestLegemiddelMerkevare].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare"
* code.coding[FestLegemiddelMerkevare].code = #ID_2ABAC272-0BCF-43F0-84BE-984074D92E15
* code.coding[FestLegemiddelMerkevare].display = "Paracet tab 500 mg"
* form.coding[OID7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448"
* form.coding[OID7448].code = #53
* form.coding[OID7448].display = "Tablett"

Instance: Legemiddel-FestLegemiddelpakning
InstanceOf: Legemiddel
Description: "Eksempel på legemiddel identifisert med FEST legemiddelpakning-id"
* extension[classification].valueCodeableConcept = $ATC#C01DA14 "isosorbide mononitrate"
* code.coding[FestLegemiddelpakning].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning"
* code.coding[FestLegemiddelpakning].code = #ID_40EB7069-EFEC-41C9-8CEF-7D21BD18539C
* code.coding[FestLegemiddelpakning].display = "Monoket retard depottab 50 mg"
* form.coding[OID7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448"
* form.coding[OID7448].code = #25
* form.coding[OID7448].display = "Depottablett"

Instance: Legemiddel-Varenummer
InstanceOf: Legemiddel
Description: "Eksempel på legemiddel identifisert med varenummer"
* extension[classification].valueCodeableConcept = $ATC#N02BE01 "Paracetamol"
* code.coding[Varenummer].system = "http://dmp.no/fhir/NamingSystem/fest-varenummer"
* code.coding[Varenummer].code = #106383
* code.coding[Varenummer].display = "Paracet mikst oppl 24 mg/ml"
* form.coding[OID7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448"
* form.coding[OID7448].code = #842
* form.coding[OID7448].display = "Mikstur, oppløsning"

Instance: Legemiddel-FestLegemiddeldose
InstanceOf: Legemiddel
Description: "Eksempel på legemiddel identifisert med FEST legemiddeldose-id"
* extension[classification].valueCodeableConcept = $ATC#A10AB05 "insulin aspart"
* code.coding[FestLegemiddeldose].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelDose"
* code.coding[FestLegemiddeldose].code = #ID_0008D107-4F34-470F-83CA-541F6E9FA3C4
* code.coding[FestLegemiddeldose].display = "NovoRapid Flexpen inj, oppl 100 E/ml"

Instance: Legemiddel-FestLmrLopenr
InstanceOf: Legemiddel
Description: "Eksempel på legemiddel identifisert med LMR-løpenummer"
* extension[classification].valueCodeableConcept = $ATC#N03AX11 "topiramat"
* code.coding[FestLmrLopenr].system = "http://dmp.no/fhir/NamingSystem/lmrLopenummer"
* code.coding[FestLmrLopenr].code = #1003023
* code.coding[FestLmrLopenr].display = "Topimax kaps 15 mg"
* form.coding[OID7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448"
* form.coding[OID7448].code = #891
* form.coding[OID7448].display = "Kapsel, hard"

Instance: Legemiddel-SCT
InstanceOf: Legemiddel
Description: "Eksempel på legemiddel identifisert med SNOMED CT-kode"
* extension[classification].valueCodeableConcept = $ATC#N02BE01 "Paracetamol"
* code.coding[SCT].system = "http://snomed.info/sct"
* code.coding[SCT].code = #32236009
* code.coding[SCT].display = "paracetamol tab 500 mg"
* form.coding[SCT].system = "http://snomed.info/sct"
* form.coding[SCT].code = #385055001
* form.coding[SCT].display = "tablett"

Instance: Legemiddel-LokaltLegemiddel-FlereIngredienser
InstanceOf: Legemiddel
Description: "Eksempel på lokalt legemiddel med flere ingredienser"
* code.coding[LokaltLegemiddel].system = "http://fhi.no/fhir/NamingSystem/lokaltLegemiddel"
* code.coding[LokaltLegemiddel].code = #lokal-ketamin-haloperidol-klonidin-midazolam
* code.coding[LokaltLegemiddel].display = "Lokalt legemiddel med ketamin, haloperidol, klonidin og midazolam"
* ingredient[0].itemCodeableConcept.coding.system = "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare"
* ingredient[0].itemCodeableConcept.coding.code = #ID_28C1C9F5-0D9C-4F5F-9823-A0BC8643CFE9
* ingredient[0].itemCodeableConcept.coding.display = "Ketamin Abcur inj, oppl 10 mg/ml"
* ingredient[0].strength.numerator.value = 2
* ingredient[0].strength.numerator.system = "http://unitsofmeasure.org"
* ingredient[0].strength.numerator.code = #mg
* ingredient[0].strength.denominator.value = 1
* ingredient[0].strength.denominator.system = "http://unitsofmeasure.org"
* ingredient[0].strength.denominator.code = #mL
* ingredient[1].itemCodeableConcept.coding.system = "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare"
* ingredient[1].itemCodeableConcept.coding.code = #ID_5B77F59F-8C66-4C5F-80F7-1EB54FB5E66C
* ingredient[1].itemCodeableConcept.coding.display = "Haldol inj, oppl 5 mg/ml"
* ingredient[1].strength.numerator.value = 0.5
* ingredient[1].strength.numerator.system = "http://unitsofmeasure.org"
* ingredient[1].strength.numerator.code = #mg
* ingredient[1].strength.denominator.value = 1
* ingredient[1].strength.denominator.system = "http://unitsofmeasure.org"
* ingredient[1].strength.denominator.code = #mL
* ingredient[2].itemCodeableConcept.coding.system = "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning"
* ingredient[2].itemCodeableConcept.coding.code = #ID_F19264C9-4802-4AE7-93FB-4A1D26D18A8F
* ingredient[2].itemCodeableConcept.coding.display = "Catapresan øresund inj, oppl 150 mikrog/ml"
* ingredient[2].strength.numerator.value = 1.5
* ingredient[2].strength.numerator.system = "http://unitsofmeasure.org"
* ingredient[2].strength.numerator.code = #ug
* ingredient[2].strength.denominator.value = 1
* ingredient[2].strength.denominator.system = "http://unitsofmeasure.org"
* ingredient[2].strength.denominator.code = #mL
* ingredient[3].itemCodeableConcept.coding.system = "http://dmp.no/fhir/NamingSystem/fest-varenummer"
* ingredient[3].itemCodeableConcept.coding.code = #156660
* ingredient[3].itemCodeableConcept.coding.display = "Midazolam Accordpharma inj/inf, oppl 1 mg/ml"
* ingredient[3].strength.numerator.value = 0.2
* ingredient[3].strength.numerator.system = "http://unitsofmeasure.org"
* ingredient[3].strength.numerator.code = #mg
* ingredient[3].strength.denominator.value = 1
* ingredient[3].strength.denominator.system = "http://unitsofmeasure.org"
* ingredient[3].strength.denominator.code = #mL

Instance: Legemiddel-FestLegemiddelVirkestoff-2
InstanceOf: Legemiddel
Description: "Eksempel på legemiddel (cetirizin) identifisert med FEST legemiddelvirkestoff-id"
* extension[classification].valueCodeableConcept = $ATC#R06AE07 "cetirizin"
* code.coding[FestLegemiddelVirkestoff].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff"
* code.coding[FestLegemiddelVirkestoff].code = #ID_6E3F89D6-152B-4BD4-924B-4C229E45BD04
* code.coding[FestLegemiddelVirkestoff].display = "Cetirizin tab 10 mg"
* form.coding[OID7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448"
* form.coding[OID7448].code = #53
* form.coding[OID7448].display = "Tablett"

Instance: Legemiddel-Legemiddeldose-SmofKabiven
InstanceOf: Legemiddel
Description: "Eksempel på legemiddel (SmofKabiven) identifisert med FEST legemiddeldose-id"
* extension[classification].valueCodeableConcept = $ATC#B05BA10 "Kombinasjoner"
* code.coding[FestLegemiddeldose].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelDose"
* code.coding[FestLegemiddeldose].code = #ID_58EA43B8-817A-4CCC-8C88-A780399018E3
* code.coding[FestLegemiddeldose].display = "SmofKabiven inf, emul"

Instance: Legemiddel-UtenCoding
InstanceOf: Legemiddel
Description: "Eksempel på legemiddel uten code — ingredienser uttrykt via Reference og CodeableConcept"
* ingredient[0].itemReference = Reference(Legemiddel-Legemiddeldose-SmofKabiven)
* ingredient[1].itemCodeableConcept.coding.system = "http://dmp.no/fhir/NamingSystem/festLegemiddelDose"
* ingredient[1].itemCodeableConcept.coding.code = #ID_3BDBA6F5-AE18-4A03-949A-A10BE4C085D0
* ingredient[1].itemCodeableConcept.coding.display = "Soluvit pulv til inf væske oppl"
* ingredient[2].itemCodeableConcept.coding.system = "http://dmp.no/fhir/NamingSystem/festLegemiddelDose"
* ingredient[2].itemCodeableConcept.coding.code = #ID_4440528A-4654-4C34-A36B-B85251A5410F
* ingredient[2].itemCodeableConcept.coding.display = "Vitalipid Infant kons til inf emul"

Instance: Lokalt-legemiddel-cellegift
InstanceOf: Legemiddel
Description: "Eksempel på lokalt katalogisert cellegift (Cisplatin)"
* extension[classification].valueCodeableConcept = $ATC#L01XA01 "Cisplatin"
* code.coding[LokaltLegemiddel].system = "http://fhi.no/fhir/NamingSystem/lokaltLegemiddel"
* code.coding[LokaltLegemiddel].code = #Cisplatin
* code.coding[LokaltLegemiddel].display = "Cisplatin"
* amount.numerator.value = 1025
* amount.numerator.unit = "milligram"
* amount.numerator.system = "http://unitsofmeasure.org"
* amount.numerator.code = #mg
* amount.denominator.value = 1
* amount.denominator.unit = "pose"

// Invarianter
Invariant: lmdi-medication-code-or-ingredient
Description: "Medication skal ha code.coding eller ingredient"
Severity: #error
Expression: "code.coding.exists() or ingredient.exists()"
