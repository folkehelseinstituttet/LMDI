ValueSet: LegemiddelKoder
Id: legemiddel-koder
Title: "Gyldige legemiddelkoder"
Description: "ValueSet som inneholder koder fra SNOMED CT, FEST, LMR-nummer, varenummer og lokal legemiddelkatalog"
* ^title.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^title.extension[=].extension[+].url = "lang"
* ^title.extension[=].extension[=].valueCode = #en
* ^title.extension[=].extension[+].url = "content"
* ^title.extension[=].extension[=].valueString = "Valid medication codes"
* ^description.extension[+].url = "http://hl7.org/fhir/StructureDefinition/translation"
* ^description.extension[=].extension[+].url = "lang"
* ^description.extension[=].extension[=].valueCode = #en
* ^description.extension[=].extension[+].url = "content"
* ^description.extension[=].extension[=].valueString = "ValueSet containing codes from SNOMED CT, FEST, LMR sequence number, item number, and local medication catalogue."
* include codes from system http://snomed.info/sct
* include codes from system http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare 
* include codes from system http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff 
* include codes from system http://dmp.no/fhir/NamingSystem/festLegemiddelPakning 
* include codes from system http://dmp.no/fhir/NamingSystem/festLegemiddelDose
* include codes from system http://dmp.no/fhir/NamingSystem/lmrLopenummer
* include codes from system http://dmp.no/fhir/NamingSystem/fest-varenummer
* include codes from system http://fhi.no/fhir/NamingSystem/lokaltLegemiddel
