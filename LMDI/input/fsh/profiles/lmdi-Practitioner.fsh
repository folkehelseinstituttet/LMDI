Profile: Helsepersonell
Id: lmdi-practitioner
Parent: NoBasisPractitioner
Title: "Helsepersonell"
Description: "Helsepersonell som har rekvirert legemidlet, basert på no-basis-Practitioner. HPR-nummer skal oppgis når tilgjengelig."

* ^status = #draft
* ^date = "2025-09-12"
* ^publisher = "Folkehelseinstituttet"
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Healthcare professional"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "Healthcare professional who requested the medication, based on no-basis-Practitioner. The HPR number shall be provided when available."

// === IDENTIFIER HÅNDTERING ===
// Bruker no-basis slicing med closed slicing for å begrense til kun HPR
* identifier ^slicing.rules = #closed  // Lukk slicing - kun HPR tillatt
* identifier ^short = "Helsepersonellnummer (HPR-nummer)"
* identifier ^definition = "Helsepersonellnummer (HPR-nummer) fra Helsepersonellregisteret. Skal registreres når tilgjengelig."
* identifier ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* identifier ^short.extension[=].extension[+].url = "lang"
* identifier ^short.extension[=].extension[=].valueCode = #en
* identifier ^short.extension[=].extension[+].url = "content"
* identifier ^short.extension[=].extension[=].valueString = "Health professional number (HPR number)"
* identifier ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* identifier ^definition.extension[=].extension[+].url = "lang"
* identifier ^definition.extension[=].extension[=].valueCode = #en
* identifier ^definition.extension[=].extension[+].url = "content"
* identifier ^definition.extension[=].extension[=].valueString = "Health professional number (HPR number) from the Health Personnel Register. Shall be recorded when available."

// Bruk no-basis HPR slice - system er allerede definert i no-basis
* identifier[HPR] 0..1 MS
* identifier[HPR] ^short = "HPR-nummer"
* identifier[HPR] ^definition = "Helsepersonellnummer fra Helsepersonellregisteret."
* identifier[HPR] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* identifier[HPR] ^short.extension[=].extension[+].url = "lang"
* identifier[HPR] ^short.extension[=].extension[=].valueCode = #en
* identifier[HPR] ^short.extension[=].extension[+].url = "content"
* identifier[HPR] ^short.extension[=].extension[=].valueString = "HPR number"
* identifier[HPR] ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* identifier[HPR] ^definition.extension[=].extension[+].url = "lang"
* identifier[HPR] ^definition.extension[=].extension[=].valueCode = #en
* identifier[HPR] ^definition.extension[=].extension[+].url = "content"
* identifier[HPR] ^definition.extension[=].extension[=].valueString = "Health professional number from the Health Personnel Register."

// Skjul FNR og DNR slices fra no-basis
* identifier[FNR] 0..0
* identifier[DNR] 0..0

// Spesialitet
// * qualification ^short = "Spesialitet"
// * qualification.code.coding.system 1..1
// * qualification.code.coding.system = "urn:oid:2.16.578.1.12.4.1.1.7426"
// * qualification.code.coding.system ^short = "Helsepersonellregisterets (HPR) klassifikasjon av spesialiteter (OID=7426)"
// * qualification.code.coding.system ^definition = "Dette kodeverket inneholder koder for spesialiteter i Helsepersonellregisteret. Kilde: Forskrift om spesialistgodkjenning av helsepersonell og turnusstillinger for leger."
// * qualification.code.coding.system ^comment = "MVP - satt til HPR-spesialieter (OID=7426)."

// Deaktiverte elementer
* text 0..0
* name 0..0
* telecom 0..0
* address 0..0
* gender 0..0
* birthDate 0..0
* photo 0..0
* qualification 0..0
* communication 0..0
* active 0..0

Instance: Helsepersonell-Med-HPR
InstanceOf: Helsepersonell
Description: "Eksempel på helsepersonell med HPR-nummer"
* identifier[HPR].system = "urn:oid:2.16.578.1.12.4.1.4.4"
* identifier[HPR].value = "9144900"

Instance: Helsepersonell-Uten-HPR
InstanceOf: Helsepersonell
Description: "Eksempel på rekvirent uten HPR-nummer"
// Ingen identifier - gyldig da identifier er valgfri (0..*)
