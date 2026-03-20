Profile: Episode
Parent: Encounter
Id: lmdi-encounter
Title: "Episode"
Description: "Profil for en behandlingsepisode basert på Encounter-ressursen i FHIR. Denne profilen representerer et klinisk møte eller en behandling i helsevesenet, med fokus på organisatorisk tilhørighet."

* extension contains NprEpisodeIdentifier named nprEpisodeIdentifier 0..1 MS
* extension[nprEpisodeIdentifier] ^short = "Unik identifikator for episoden, som brukt i rapportering til Norsk pasientregister (NPR)."
* extension[nprEpisodeIdentifier] ^definition = "Unik identifikator for episoden, som brukt i rapportering til Norsk pasientregister (NPR). Hvis det er registrert flere NPR-identifiere for samme episode lokalt, skal kun én NPR-identifikator angis ved innsending til Legemiddelregisteret (LMR). Velg enten den første eller den lokalt foretrukne identifikatoren. Den valgte identifikatoren skal oppgis med sin string-representasjon og/eller UUID-representasjon, dersom begge er tilgjengelige oppgis begge."

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
