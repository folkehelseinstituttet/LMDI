
### Legemiddeldata fra institusjon til Legemiddelregisteret (LMDI)

Komplette og oppdaterte helsedata på legemidler er tilgjengelig for analyse og forskning med tanke på å forbedre kvalitet, styring, helseovervåking, beredskap og kunnskapsforvaltning i helsetjenesten

#### Mål

Samle inn legemiddeldata på individnivå fra polikliniske og innlagte pasienter i institusjon til Legemiddelregisteret (LMR). Som et ledd i dette utvikles det en implementasjonsguide (IG) basert på en felles informasjonsmodell og HL7 FHIR (dette dokumentet). Dette skal benyttes for innsending av data fra institusjon til LMR ved hjelp av datadeling (sikret REST API).

Legemiddelregisteret inneholder allerede data om utleverte legemidler fra apotek på individnivå. LMDI-prosjektet fokuserer nå spesifikt på å utvide dette med data om administrerte legemidler fra sykehus og andre institusjoner, noe som vil gi et mer komplett bilde av legemiddelbruk på tvers av hele helsetjenesten. Dette er en viktig utvidelse som vil styrke grunnlaget for bedre pasientsikkerhet, kunnskapsproduksjon og helseovervåking.

<figure>
    <img src="lmdi-2.png" width="49%" style="border: 1px solid rgba(0, 0, 0, 0.2); border-radius: 10px; padding: 5px;">
    <figcaption style="font-style: italic; font-size: 14px; margin-top: 5px;">
        Figur: LMDI-prosjektet skal implementere mottak av data om administrerte legemidler.
    </figcaption>
</figure>
<br clear="all"/>

#### no-basis-avhengigheter

LMDI-profilene bygger på [no-basis](https://hl7.no/fhir/no-basis/) – de norske basisprofilene for FHIR. no-basis tilbyr standardiserte profiler tilpasset norske forhold, blant annet for identifikatorer, adresser og kodeverk.

Følgende LMDI-profiler arver fra no-basis:
- **Helsepersonell** bygger på no-basis-Practitioner (HPR-nummer, norske spesialiteter)
- **Organisasjon** bygger på no-basis-Organization (organisasjonsnummer, RESH-ID)
- **Pasient** bygger på no-basis-Patient (fødselsnummer, D-nummer, norske adresser)
- **Virkestoff** bygger på no-basis-Substance (virkestoff i norsk kontekst)

Dette gir en konsistent håndtering av norske identifikatorer og kodeverk på tvers av helsesektoren. For å bruke LMDI-profilene må no-basis (versjon 2.2.0) være installert som en avhengighet.

#### Versjoner av implementasjonsguiden

| Versjon | Dato | Beskrivelse |
|---------|------|-------------|
| 1.0.6 | 2025-09-12 | Helsepersonell, Organisasjon, Pasient og Virkestoff er nå basert på no-basis<br/> |
| 1.0.5 | 2025-07-28 | NPR Episode Identifier extension endret til å støtte både string og UUID samtidig. Extension er nå en kompleks struktur med sub-extensions for stringIdentifier og uuidIdentifier.<br/>Lagt til LmrLopenummer- og FestVarenummer-slicene på `Legemiddel.code.coding` |
| 1.0.4 | 2025-05-30 | Legemiddel.code kan nå være en SNOMED CT kode.<br/> Ny profil Virkestoff som skal brukes for Substance.<br/>Ny extension (Must Support) Episode.nprEpisodeIdentifier. <br/> Ny C# eksempelkode for autorisering med HelseID.  |
| 1.0.3 | 2025-04-11 | Fjernet Legemiddelrekvirering.dosageInstruction.patientInstruction og Legemiddel.text fra profilen. <br/> Ny extension: Legemiddel.classification. <br/> La til eksempelkode i C# og Powershell   |
| 1.0.2 | 2025-04-01 | Nye extensions lagt til i profilen Legemiddelrekvirering: ProsentvisDoseendring, DelAvBehandlingsregime, KliniskStudie   |
| 1.0.1 | 2025-02-04 | Endret LegemiddelregisterBundle. Bundle-type ble endret fra Batch til Transaction  |
| 1.0.0 | 2025-01-15 | Første offisielle versjon. Klar for uttesting. |
