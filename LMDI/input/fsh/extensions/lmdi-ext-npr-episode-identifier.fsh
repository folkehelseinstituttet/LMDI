Extension: NprEpisodeIdentifier
Id: npr-episode-identifier
Title: "NPR Episode Identifier"
Description: "Unik identifikator for episoden, som brukt i rapportering til Norsk pasientregister (NPR). Extensionen kan bære både string-basert og UUID-basert representasjon av den valgte NPR-identifikatoren. Hvis det er registrert flere NPR-identifiere for samme episode lokalt, skal kun én NPR-identifikator angis ved innsending til Legemiddelregisteret (LMR). Velg enten den første eller den lokalt foretrukne identifikatoren."
* ^context.type = #element
* ^context.expression = "Encounter"
* ^status = #active
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "NPR Episode Identifier"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "Unique identifier for the episode as used in reporting to the Norwegian Patient Registry (NPR). The extension can carry both string-based and UUID-based representations of the selected NPR identifier. If multiple NPR identifiers are registered for the same episode locally, only one NPR identifier shall be provided when submitting to Legemiddelregisteret (LMR). Choose either the first or the locally preferred identifier."

* extension contains
    stringIdentifier 0..1 MS and
    uuidIdentifier 0..1 MS

* extension[stringIdentifier] ^short = "String-representasjon av NPR episodeidentifikatoren"
* extension[stringIdentifier] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* extension[stringIdentifier] ^short.extension[=].extension[+].url = "lang"
* extension[stringIdentifier] ^short.extension[=].extension[=].valueCode = #en
* extension[stringIdentifier] ^short.extension[=].extension[+].url = "content"
* extension[stringIdentifier] ^short.extension[=].extension[=].valueString = "String representation of the NPR episode identifier"
* extension[stringIdentifier] ^definition = "String-representasjon av den valgte NPR episodeidentifikatoren. Skal oppgis dersom string-representasjonen av identifikatoren er tilgjengelig."
* extension[stringIdentifier] ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* extension[stringIdentifier] ^definition.extension[=].extension[+].url = "lang"
* extension[stringIdentifier] ^definition.extension[=].extension[=].valueCode = #en
* extension[stringIdentifier] ^definition.extension[=].extension[+].url = "content"
* extension[stringIdentifier] ^definition.extension[=].extension[=].valueString = "String representation of the selected NPR episode identifier. Shall be provided if the string representation of the identifier is available."
* extension[stringIdentifier].value[x] only string
* extension[stringIdentifier].valueString 1..1

* extension[uuidIdentifier] ^short = "UUID-representasjon av NPR episodeidentifikatoren"
* extension[uuidIdentifier] ^short.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* extension[uuidIdentifier] ^short.extension[=].extension[+].url = "lang"
* extension[uuidIdentifier] ^short.extension[=].extension[=].valueCode = #en
* extension[uuidIdentifier] ^short.extension[=].extension[+].url = "content"
* extension[uuidIdentifier] ^short.extension[=].extension[=].valueString = "UUID representation of the NPR episode identifier"
* extension[uuidIdentifier] ^definition = "UUID-representasjon av den valgte NPR episodeidentifikatoren. Skal oppgis dersom UUID-representasjonen av identifikatoren er tilgjengelig."
* extension[uuidIdentifier] ^definition.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* extension[uuidIdentifier] ^definition.extension[=].extension[+].url = "lang"
* extension[uuidIdentifier] ^definition.extension[=].extension[=].valueCode = #en
* extension[uuidIdentifier] ^definition.extension[=].extension[+].url = "content"
* extension[uuidIdentifier] ^definition.extension[=].extension[=].valueString = "UUID representation of the selected NPR episode identifier. Shall be provided if the UUID representation of the identifier is available."
* extension[uuidIdentifier].value[x] only uuid
* extension[uuidIdentifier].valueUuid 1..1

* obeys npr-episode-at-least-one

Invariant: npr-episode-at-least-one
Description: "Minst én NPR episode identifikator (string eller UUID) må oppgis"
Expression: "extension('stringIdentifier').exists() or extension('uuidIdentifier').exists()"
Severity: #error
