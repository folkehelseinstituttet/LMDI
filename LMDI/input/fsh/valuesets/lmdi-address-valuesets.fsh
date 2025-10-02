ValueSet: LmdiAddressUse
Id: lmdi-address-use
Title: "LMDI Address Use"
Description: "Tillatte verdier for address.use i LMDI: home, temp, old"
* ^status = #active
* include http://hl7.org/fhir/address-use#home
* include http://hl7.org/fhir/address-use#temp
* include http://hl7.org/fhir/address-use#old

ValueSet: LmdiAddressType
Id: lmdi-address-type
Title: "LMDI Address Type"
Description: "Tillatt verdi for address.type i LMDI: physical"
* ^status = #active
* include http://hl7.org/fhir/address-type#physical
