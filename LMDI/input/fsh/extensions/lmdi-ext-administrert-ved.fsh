Extension: AdministrertVed
Id: lmdi-administrert-ved
Title: "Administrert ved"
Description: "Stedet (organisasjonen) administreringen ble utført. Administreringen refererer også til en episode, som igjen kan referere til en organisasjon. Administrert ved benyttes hvis episoden reflekterer hele innleggelsen, dvs. i tilfeller der episoden ikke gjenspeiler pasientens forflytninger (f.eks. mellom ulike avdelinger) under innleggelsen."
* ^context.type = #element
* ^context.expression = "MedicationAdministration"
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Administered at"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "The place (organization) where the administration was performed. The administration also references an episode, which in turn may reference an organization. Administered at is used if the episode reflects the entire admission, i.e. in cases where the episode does not reflect the patient's transfers (e.g. between different departments) during the admission."
* value[x] only Reference(Organisasjon)
