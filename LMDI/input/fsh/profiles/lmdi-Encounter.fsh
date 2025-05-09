Profile: Episode
Parent: Encounter
Id: lmdi-encounter
Title: "Episode"
Description: "Profil for en behandlingsepisode basert på Encounter-ressursen i FHIR. Denne profilen representerer et klinisk møte eller en behandling i helsevesenet, med fokus på organisatorisk tilhørighet."

* extension contains
    NprEpisodeID named nprEpisodeID 1..1 and
    NprEpisodeGUID named nprEpisodeGUID 0..1 MS

* extension[nprEpisodeGUID] ^short = "GUID for episode. Tilsvarende NPR episodeGUID."
* extension[nprEpisodeGUID] ^definition = """
YYYYYYYYVeiledning:
Rapporteringsenhetene bør forberede overgang til episodeGUID som identifikator for episode.

Bruk:
En GUID som er generert iht. standardmetode vil gi et tall som med tilnærmet 100 prosent sannsynlighet er unikt, uten sentral samordning på tvers av rapporteringsenheter. GUID-er muliggjør derfor kombinasjon av informasjon fra uavhengige parter uten vesentlig risiko for duplisering av identifikatorer.

Rapporteringsplikt:
episodeGUID skal rapporteres dersom en slik identifikator finnes.
"""
    
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