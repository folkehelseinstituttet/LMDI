ValueSet: LmdiAddressUse
Id: lmdi-address-use
Title: "LMDI Address Use"
Description: "Tillatte verdier for address.use i LMDI: home, temp, old"
* ^status = #active
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "LMDI Address Use"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "Permitted values for address.use in LMDI: home, temp, old."
* include http://hl7.org/fhir/address-use#home
* include http://hl7.org/fhir/address-use#temp
* include http://hl7.org/fhir/address-use#old

ValueSet: LmdiAddressType
Id: lmdi-address-type
Title: "LMDI Address Type"
Description: "Tillatt verdi for address.type i LMDI: physical"
* ^status = #active
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "LMDI Address Type"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "Permitted value for address.type in LMDI: physical."
* include http://hl7.org/fhir/address-type#physical
