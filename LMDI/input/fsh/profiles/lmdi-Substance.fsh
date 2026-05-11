Profile: Virkestoff
Id: lmdi-substance
Parent: NoBasisSubstance
Title: "Virkestoff"
Description: "En tilpasset profil av Substance for å representere virkestoff, basert på no-basis."

* ^status = #draft
* ^date = "2025-09-12"
* ^publisher = "Folkehelseinstituttet"
* ^title.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* ^title.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Substance"
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "A tailored Substance profile for representing active substances, based on no-basis."

* text 0..0
* description 0..0
* ingredient 0..0
* category 1..1

// EKSEMPLER
Instance: Virkestoff-Oksykodon
InstanceOf: Virkestoff
Description: "Eksempel på virkestoff - Oksykodon"
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[lang].valueCode = #en
* ^description.extension[http://hl7.org/fhir/StructureDefinition/translation][0].extension[content].valueString = "Example of a substance - oxycodone"
* code.coding.system = "http://snomed.info/sct"
* code.coding.code = #55452001
* code.coding.display = "Oxycodone (substance)"
* category.coding.system = "http://terminology.hl7.org/CodeSystem/substance-category"
* category.coding.code = #drug
* category.coding.display = "Drug or Medicament"
