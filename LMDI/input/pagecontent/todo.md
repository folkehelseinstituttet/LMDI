




Beskriv hvordan referanser skal være i LegemiddelregisterBundle.
Logical reference – unik identifikator:
"reference": "urn:uuid:a5ae3f24-51f5-4f7c-a160-789bc932c335"
Dette er entry.fullUrl i bundlen


[done] Legge til SNOMED CT slicing på  Legemiddel.code.coding
[done]Lage profil av Substance - Legemiddel har referanse til Substance
        Ny profil:  Virkestoff
        category: obligatorisk
        description: fjernes
        ingredient: fjernes


Nye extension felt i Episode med id som vi kan knytte oss til NPR?
NprEpisodeID   -- tekst  <-- obligatorisk 
NprEpisodeGUID -- uuid  <--frivillig


| Attributter                      | K   | Type   | Beskrivelse |
|----------------------------------|-----|--------|-------------|
| **Episode GUID (episodeGUID)**   | 0..1 | guid  | **Globalt unik identifikator (GUID) for episode.**<br><br>**Veiledning:**<br>Rapporteringsenhetene bør forberede overgang til episodeGUID som identifikator for episode.<br><br>**Bruk:**<br>En GUID som er generert iht. standardmetode vil gi et tall som med tilnærmet 100 prosent sannsynlighet er unikt, uten sentral samordning på tvers av rapporteringsenheter. GUID-er muliggjør derfor kombinasjon av informasjon fra uavhengige parter uten vesentlig risiko for duplisering av identifikatorer.<br><br>**Rapporteringsplikt:**<br>episodeGUID skal rapporteres dersom en slik identifikator finnes. |
| **EpisodeID (episodeID)**        | 1   | String | **Helseinstitusjonens unike identifikator for episode.**<br><br>**Veiledning:**<br>EpisodeID skal være entydig innenfor helseinstitusjonen og ha samme unike innhold i alle meldinger og meldingstyper helseinstitusjonen rapporterer til NPR, også på tvers av rapporteringsperioder. Dersom det ikke er mulig å ivareta dette kravet, for eksempel ved bytte av systemleverandør, må NPR kontaktes.<br><br>**Bruk:**<br>Identifikatoren brukes i tilbakemeldinger og dialog med NPR. |
