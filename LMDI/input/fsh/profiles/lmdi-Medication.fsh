Profile: Legemiddel
Parent:   Medication
Id:       lmdi-legemiddel
Title:    "Legemiddel"
Description: "Beskrivelse av legemiddel."
* ^status = #draft
* ^date = "2024-05-27"

// Se basis-profiler og evt. eResept/PLL
// MedicationKnowledge under utvikling, se R5 for status
// Krav: Legemiddel-id (identifier), må mulig settes av FHI
* identifier MS
* identifier ^short = "Legemiddelets identifikasjon"
* identifier ^definition = "Legemiddelets identifikasjon i henhold til TODO"
// Krav: Kode, som FEST-id, SNOMED-CT etc., obligatorisk
* code 1..1
// Krav: Legemiddelform, obligatorisk? HL7 Form vs FEST-form. IDMP/SAFEST?
* form MS
* form ^short = "Legemiddelform"
// Krav: Ingredienser/virkestoff navn (ingredienth)
// Krav: Styrke (ingredient.strength[x])
// Krav: Batchnummer
* batch MS
* batch ^short = "Batch-nummer for legemiddelet"
// Krav: Merkevarenavn, handelsnavn
// Krav: Definerte døgnsoder (DDD) <- bør refereres til