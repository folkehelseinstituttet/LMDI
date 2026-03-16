// Under utvikling i LMDI-prosjektet. 
// LegemiddelMerkevare: Rekvirering av en styrke og form av en bestemt merkevare. Pr. 2024 er det ikke lenger ønskelig at det rekvireres på LegemiddelMerkevare
// Mål: Være en del av no-basis. 
Instance: no-basis-fest-legemiddelmerkevare
InstanceOf: NamingSystem
Usage: #definition
* name = "festLegemiddelMerkevare"
* status = #draft
* kind = #identifier
* date = "2024-06-10"
// Publisher blir overkjørt og blir korrigert til FHI. Blir rettet når instansene flyttes til no-basis-IG. 
* publisher = "Helsedirektoratet"
* responsible = "Direktoratet for medisinske produkter"
* description = "FEST-id for legemiddel merkevare. Rekvirering av en styrke og form av en bestemt merkevare. Pr. 2024 er det ikke lenger ønskelig at det rekvireres på LegemiddelMerkevare."
* jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* uniqueId[0].type = #uri
* uniqueId[=].value = "http://dmp.no/fhir/NamingSystem/festLegemiddelMerkevare"
* uniqueId[=].preferred = true
