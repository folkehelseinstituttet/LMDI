// Under utvikling i LMDI-prosjektet.
// LegemiddelPakningMerkevare: rekvirering av en bestemt pakning av en merkevare (varenummer)
// Mål: Være en del av no-basis. 
Instance: no-basis-fest-legemiddelpakning
InstanceOf: NamingSystem
Usage: #definition
* name = "festLegemiddelPakning"
* status = #draft
* kind = #identifier
* date = "2024-06-10"
// Publisher blir overkjørt og blir korrigert til FHI. Blir rettet når instansene flyttes til no-basis-IG. 
* publisher = "Helsedirektoratet"
* responsible = "Direktoratet for medisinske produkter"
* description = "FEST-id for legemiddelpakninger. Rekvirering av en bestemt pakning av en merkevare (varenummer)"
* jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* uniqueId[0].type = #uri
// Best om DMP/FEST/SAFEST har unike id/namespace som kan benyttes. 
// Volven har ikke noe, da FEST-id egentlig ikke er kodeverk, men katalog(database)-nøkler.
* uniqueId[=].value = "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning"
* uniqueId[=].preferred = true
