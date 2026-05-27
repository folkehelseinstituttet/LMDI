### FHIR-profiler

{% include template-sd-summary.xml %}

#### Extensions

| Extension | Brukes på | Beskrivelse |
|-----------|-----------|-------------|
| [LegemiddelClassification](StructureDefinition-legemiddel-classification.html) | [Legemiddel](StructureDefinition-lmdi-medication.html) | Klassifisering av legemidler, primært med ATC-koder (Anatomisk Terapeutisk Kjemisk legemiddelregister). |
| [DelAvBehandlingsregime](StructureDefinition-lmdi-del-av-behandlingsregime.html) | [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.html) | Navnet på kuren, behandlingsregimet eller protokollen legemidlet gis som en del av. Spesielt relevant ved kjemoterapi. |
| [KliniskStudie](StructureDefinition-lmdi-klinisk-studie.html) | [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.html) | Angir om legemidlet gis som en del av en klinisk studie. |
| [NprEpisodeIdentifier](StructureDefinition-npr-episode-identifier.html) | [Episode](StructureDefinition-lmdi-encounter.html) | Unik identifikator for episoden, som brukt i rapportering til Norsk pasientregister (NPR). Støtter både string-basert og UUID-basert representasjon. |
| [ProsentvisDoseendring](StructureDefinition-lmdi-prosentvis-doseendring.html) | [Legemiddelrekvirering](StructureDefinition-lmdi-medicationrequest.html) | Doseendring i prosent, sammenlignet med opprinnelig dosering. Spesielt relevant ved kjemoterapi. En normal dose, uten modifiseringer, er 100%. |