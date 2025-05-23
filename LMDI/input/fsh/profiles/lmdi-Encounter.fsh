Profile: Episode
Parent: Encounter
Id: lmdi-encounter
Title: "Episode"
Description: "Profil for en behandlingsepisode basert på Encounter-ressursen i FHIR. Denne profilen representerer et klinisk møte eller en behandling i helsevesenet, med fokus på organisatorisk tilhørighet."

* extension contains NprEpisodeIdentifier named nprEpisodeIdentifier 0..1 MS
* extension[nprEpisodeIdentifier] ^short = "Unik identifikator for episoden, som brukes ved rapportering til NPR"
* extension[nprEpisodeIdentifier] ^definition = "En lokal eller globalt unik identifikator (string eller UUID) som identifiserer episoden entydig i helseinstitusjonens systemer. Som brukes ved rapportering til Norsk pasientregister (NPR)."

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