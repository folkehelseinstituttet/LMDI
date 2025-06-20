
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


#### Versjoner av implementasjonsguiden

| Versjon | Dato | Beskrivelse |
|---------|------|-------------|
| 1.0.4 | 2025-05-30 | Legemiddel.code kan nå være en SNOMED CT kode.<br/> Ny profil Virkestoff som skal brukes for Substance.<br/>Ny extension (Must Support) Episode.nprEpisodeIdentifier. <br/> Ny C# eksempelkode for autorisering med HelseID.  |
| 1.0.3 | 2025-04-11 | Fjernet Legemiddelrekvirering.dosageInstruction.patientInstruction og Legemiddel.text fra profilen. <br/> Ny extension: Legemiddel.classification. <br/> La til eksempelkode i C# og Powershell   |
| 1.0.2 | 2025-04-01 | Nye extensions lagt til i profilen Legemiddelrekvirering: ProsentvisDoseendring, DelAvBehandlingsregime, KliniskStudie   |
| 1.0.1 | 2025-02-04 | Endret LegemiddelregisterBundle. Bundle-type ble endret fra Batch til Transaction  |
| 1.0.0 | 2025-01-15 | Første offisielle versjon. Klar for uttesting. |
