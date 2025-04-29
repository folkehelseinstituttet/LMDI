Extension: NprEpisodeGUID
Id: lmdi-npr-episode-guid
Title: "NPR Episode GUID"
Description: "UUID identifier for an episode in the National Patient Registry (NPR)"

* value[x] ^short = "GUID for episode. Tilsvarende NPR episodeGUID."
* value[x] ^definition = """
Veiledning:
Rapporteringsenhetene bør forberede overgang til episodeGUID som identifikator for episode.

Bruk:
En GUID som er generert iht. standardmetode vil gi et tall som med tilnærmet 100 prosent sannsynlighet er unikt, uten sentral samordning på tvers av rapporteringsenheter. GUID-er muliggjør derfor kombinasjon av informasjon fra uavhengige parter uten vesentlig risiko for duplisering av identifikatorer.

Rapporteringsplikt:
episodeGUID skal rapporteres dersom en slik identifikator finnes.
"""

* value[x] only uuid
* value[x] 0..1
