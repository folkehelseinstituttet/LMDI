Profile: Episode
Parent: Encounter
Id: lmdi-encounter
Title: "Episode"
Description: "Profil for en behandlingsepisode basert på Encounter-ressursen i FHIR. Denne profilen representerer et klinisk møte eller en behandling i helsevesenet, med fokus på organisatorisk tilhørighet."
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Episode"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "Profile for a care episode based on the FHIR Encounter resource. This profile represents a clinical encounter or treatment in health care, with a focus on organizational affiliation."

* extension contains NprEpisodeIdentifier named nprEpisodeIdentifier 0..1 MS
* extension[nprEpisodeIdentifier] ^short = "Unik identifikator for episoden, som brukt i rapportering til Norsk pasientregister (NPR)."
* extension[nprEpisodeIdentifier] ^definition = "Unik identifikator for episoden, som brukt i rapportering til Norsk pasientregister (NPR). Hvis det er registrert flere NPR-identifiere for samme episode lokalt, skal kun én NPR-identifikator angis ved innsending til Legemiddelregisteret (LMR). Velg enten den første eller den lokalt foretrukne identifikatoren. Den valgte identifikatoren skal oppgis med sin string-representasjon og/eller UUID-representasjon, dersom begge er tilgjengelige oppgis begge."
* extension[nprEpisodeIdentifier] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* extension[nprEpisodeIdentifier] ^short.extension[=].extension[+].url = "lang"
* extension[nprEpisodeIdentifier] ^short.extension[=].extension[=].valueCode = #en
* extension[nprEpisodeIdentifier] ^short.extension[=].extension[+].url = "content"
* extension[nprEpisodeIdentifier] ^short.extension[=].extension[=].valueString = "Unique identifier for the episode, as used in reporting to the Norwegian Patient Registry (NPR)."
* extension[nprEpisodeIdentifier] ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* extension[nprEpisodeIdentifier] ^definition.extension[=].extension[+].url = "lang"
* extension[nprEpisodeIdentifier] ^definition.extension[=].extension[=].valueCode = #en
* extension[nprEpisodeIdentifier] ^definition.extension[=].extension[+].url = "content"
* extension[nprEpisodeIdentifier] ^definition.extension[=].extension[=].valueString = "Unique identifier for the episode, as used in reporting to the Norwegian Patient Registry (NPR). If multiple NPR identifiers are registered locally for the same episode, only one NPR identifier shall be submitted to Legemiddelregisteret (LMR). Choose either the first or the locally preferred identifier. The selected identifier shall be provided using its string representation and/or UUID representation; if both are available, provide both."

* statusHistory 0..0
* classHistory 0..0
* type 0..0
* serviceType 0..0
* priority 0..0
* subject 0..0
* episodeOfCare 0..0
* basedOn 0..0
* participant 0..0
* appointment 0..0
* period 0..0
* length 0..0
* reasonCode 0..0
* reasonReference 0..0
* diagnosis 0..0
* account 0..0
* hospitalization 0..0
* location 0..0
* partOf 0..0
* text 0..0

* serviceProvider only Reference(Organisasjon)
* serviceProvider ^short = "Sted for episoden"
* serviceProvider ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* serviceProvider ^short.extension[=].extension[+].url = "lang"
* serviceProvider ^short.extension[=].extension[=].valueCode = #en
* serviceProvider ^short.extension[=].extension[+].url = "content"
* serviceProvider ^short.extension[=].extension[=].valueString = "Location of the episode"

// EKSEMPLER
Instance: Episode-Sykehus
InstanceOf: Episode
Description: "Eksempel på episode i spesialisthelsetjenesten"
* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP "inpatient encounter"
* serviceProvider = Reference(Organisasjon-Sykehusavdeling)
* identifier.value = "550e8400-e29b-41d4-a716-446655440000"
* extension[nprEpisodeIdentifier].extension[stringIdentifier].valueString = "NPR987654321"
* extension[nprEpisodeIdentifier].extension[uuidIdentifier].valueUuid = "urn:uuid:550e8400-e29b-41d4-a716-446655440000"

Instance: Episode-Sykehjem
InstanceOf: Episode
Description: "Eksempel på episode på sykehjem"
* status = #in-progress
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#SS "short stay"
* serviceProvider = Reference(Organisasjon-Sykehjem)

Instance: Episode-Sykehus-2
InstanceOf: Episode
Description: "Eksempel på episode i spesialisthelsetjenesten med post som tjenesteyter"
* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#IMP "inpatient encounter"
* serviceProvider = Reference(Organisasjon-Post)
