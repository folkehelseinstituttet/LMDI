ValueSet: LegemiddelKoder 
Id: legemiddel-koder 
Title: "Gyldige legemiddelkoder" 
Description: "ValueSet som inneholder koder fra SNOMED CT (kun farmasøytisk eller biologisk produkt) og FEST" 
* include codes from system http://snomed.info/sct where concept is-a #373873005
* include codes from system http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare 
* include codes from system http://dmp.no/fhir/NamingSystem/festLegemiddelVirkestoff 
* include codes from system http://dmp.no/fhir/NamingSystem/festLegemiddelPakning 
* include codes from system http://dmp.no/fhir/NamingSystem/festLegemiddelDose