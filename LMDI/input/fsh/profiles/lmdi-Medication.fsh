Profile: Legemiddel
Parent:   Medication
Id:       lmdi-medication
Title:    "Legemiddel"
Description: "Beskrivelse av legemiddel."
* ^status = #draft
* ^date = "2025-04-11"
* ^publisher = "Folkehelseinstituttet"

* manufacturer 0..0
* text 0..0

* code.text 0..0
* code ^short = "Identifikator fra FEST eller LokalLegemiddelkatalog. Hvis ikke fylt ut, skal ingredient ha verdi. Hvis LokaltLegemiddel er fylt ut bør ingredient ha verdi."
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains FestDose 0..1 
    and FestMerkevare 0..1
    and FestPakning 0..1
    and FestVirkestoff 0..1
    and LokaltLegemiddel 0..1
* code.coding[FestDose].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelDose"
* code.coding[FestMerkevare].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare"
* code.coding[FestPakning].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning"
* code.coding[FestVirkestoff].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff"
* code.coding[LokaltLegemiddel].system = "http://fh.no/fhir/NamingSystem/lokaltVirkemiddel"
* code.coding[FestDose] ^short = "FEST-id for legemiddel DOSE"
* code.coding[FestMerkevare] ^short = "FEST-id for legemiddel MERKEVARE"
* code.coding[FestPakning] ^short = "FEST-id for legemiddel PAKNING"
* code.coding[FestVirkestoff] ^short = "FEST-id for legemiddel VIRKESTOFF"
* code.coding[LokaltLegemiddel] ^short = "Legemiddel fra lokal katalog"
* code.coding[FestDose].code ^short = "Identifikator fra FEST"
* code.coding[FestMerkevare].code ^short = "Identifikator fra FEST"
* code.coding[FestPakning].code ^short = "Identifikator fra FEST"
* code.coding[FestVirkestoff].code ^short = "Identifikator fra FEST"
* code.coding[LokaltLegemiddel].code ^short = "Identifikator fra lokal legemiddelkatalog/legemiddelregister"
* code.coding[FestDose].code 1..1
* code.coding[FestMerkevare].code 1..1
* code.coding[FestPakning].code 1..1
* code.coding[FestVirkestoff].code 1..1
* code.coding[LokaltLegemiddel].code 1..1
* code.coding[FestDose] ^comment = "URI for NamingSystem er midlertidig, må normeres som en del av no-basis."
* code.coding[FestMerkevare] ^comment = "URI for NamingSystem er midlertidig, må normeres som en del av no-basis."
* code.coding[FestPakning] ^comment = "URI for NamingSystem er midlertidig, må normeres som en del av no-basis."
* code.coding[FestVirkestoff] ^comment = "URI for NamingSystem er midlertidig, må normeres som en del av no-basis."
* code.coding[LokaltLegemiddel] ^comment = ""
* code.coding[LokaltLegemiddel].extension contains LokalLegemiddelkatalogExtension named lokalLegemiddelkatalog 0..1
* code.coding[LokaltLegemiddel].display 1..1
* code.coding[LokaltLegemiddel].display ^short = "Beskrivelse (f.eks. varenavn) for legemiddel fra lokal legemiddelkatalog/legemiddelregister"

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
* form.coding ^slicing.discriminator.type = #pattern
* form.coding ^slicing.discriminator.path = "system"
* form.coding ^slicing.rules = #closed
* form.coding contains 7448 0..1 and SCT 0..1
* form.coding 1..* 
* form.coding ^short = "Legemiddelform"
* form.coding ^comment = "Kodet legemiddelform. Inntil videre begrenset til Legemiddelform (7448) og kodesetteksempel basert på SNOMED CT fra HL7."
* form.coding[7448] ^short = "Kodeverk Legemiddelform (7448) fra FEST/eResept"
* form.coding[SCT] ^short = "SNOMED CT Form Codes"
* form.coding[7448].code 1..1
* form.coding[7448].code ^short = "Verdi fra kodeverket"
* form.coding[7448].display ^short = "Beskrivelse av koden (navn) fra kodeverket"
* form.coding[7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448" 
* form.coding[SCT].system = "http://snomed.info/sct" 

* batch MS
* batch ^short = "Batch-nummer for legemiddelet"

* ingredient.item[x] only Reference(Substance or Legemiddel) or CodeableConcept
* ingredient.item[x] ^type.targetProfile[0] = "http://hl7.org/fhir/StructureDefinition/Substance"
* ingredient.item[x] ^type.targetProfile[1] = "http://hl7.no/fhir/ig/lmdi/StructureDefinition/lmdi-medication"


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
* code.coding[FestMerkevare].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare"
* code.coding[FestMerkevare].code = #2ABAC272-0BCF-43F0-84BE-984074D92E15
* code.coding[FestMerkevare].display = "Paracetamol"

Instance: Medisin-3-LegemiddelPakning-Monoket
InstanceOf: Legemiddel
Description: "Eksempel på legemiddel - paking"
* identifier.system = "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning"
* identifier.value = "0003602E-315E-4CDE-9EB0-6756BE9CD120"
* extension[classification].valueCodeableConcept = $ATC#C01DA14 "Isosorbid mononitrat"
* code.coding[FestPakning].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning"
* code.coding[FestPakning].code = #0003602E-315E-4CDE-9EB0-6756BE9CD120
* code.coding[FestPakning].display = "Monoket"