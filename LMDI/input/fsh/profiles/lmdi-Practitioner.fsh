Profile: Helsepersonell
Id: lmdi-practitioner
Parent: NoBasisPractitioner
Title: "Helsepersonell"
Description: "Helsepersonell som har rekvirert legemidlet, basert på no-basis-Practitioner. HPR-nummer skal oppgis når tilgjengelig."

* ^status = #draft
* ^date = "2025-09-12"
* ^publisher = "Folkehelseinstituttet"
* ^version = "1.0.6"

// === IDENTIFIER HÅNDTERING ===
// Bruker no-basis slicing med closed slicing for å begrense til kun HPR
* identifier ^slicing.rules = #closed  // Lukk slicing - kun HPR tillatt
* identifier ^short = "Helsepersonellnummer (HPR-nummer)"
* identifier ^definition = "Helsepersonellnummer (HPR-nummer) fra Helsepersonellregisteret. Skal registreres når tilgjengelig."

// Bruk no-basis HPR slice - system er allerede definert i no-basis
* identifier[HPR] 0..1 MS
* identifier[HPR] ^short = "HPR-nummer"
* identifier[HPR] ^definition = "Helsepersonellnummer fra Helsepersonellregisteret."

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

Instance: Helsepersonell-1-HPR-nummer
InstanceOf: Helsepersonell
Description: "Eksempel på helsepersonell med HPR-nummer"
* identifier[HPR].system = "urn:oid:2.16.578.1.12.4.1.4.4"
* identifier[HPR].value = "9144900"

Instance: Helsepersonell-2-Uten-HPR
InstanceOf: Helsepersonell
Description: "Eksempel på rekvirent uten HPR-nummer"
// Ingen identifier - gyldig da identifier er valgfri (0..*)
