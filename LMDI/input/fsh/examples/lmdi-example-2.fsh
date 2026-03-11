// Eksempel: minimal contained administrering med paknings-id og varenummer

Instance: Administrering-Minimal-Botox-Intramuskular-Contained
InstanceOf: Legemiddeladministrering
Description: "Minimalt contained eksempel med intramuskulær administrering og kun den nødvendige legemiddelreferansen lokalt i ressursen."
* status = #completed
* medicationReference = Reference(Legemiddel-Contained-Botox-FestPakning)
* subject = Reference(https://fhi.no/fhir/lmdi/pasient/12345678)
* effectiveDateTime = "2024-05-28T10:00:00+02:00"
* dosage.dose.value = 100.0
* dosage.dose.unit = "mg"
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg
* dosage.route.coding[SCT].system = "http://snomed.info/sct"
* dosage.route.coding[SCT].code = #78421000
* dosage.route.coding[SCT].display = "Intramuscular route (qualifier value)"
* contained[+] = Legemiddel-Contained-Botox-FestPakning

Instance: Legemiddel-Contained-Botox-FestPakning
InstanceOf: Legemiddel
Usage: #inline
Description: "Contained legemiddel med FEST paknings-id og varenummer."
* code.coding[FestLegemiddelpakning].system = "http://dmp.no/fhir/NamingSystem/festLegemiddelPakning"
* code.coding[FestLegemiddelpakning].code = #ID_00B35335-0DF7-4C98-8A0A-1148F4599D21
* code.coding[FestLegemiddelpakning].display = "Botox pulv til inj væske, oppl 50 E"
* code.coding[Varenummer].system = "http://dmp.no/fhir/NamingSystem/fest-varenummer"
* code.coding[Varenummer].code = #476281
* code.coding[Varenummer].display = "Botox pulv til inj væske, oppl 50 E"
* extension[classification].valueCodeableConcept = $ATC#M03AX01 "Botulinumtoksin"
* form.coding[OID7448].system = "urn:oid:2.16.578.1.12.4.1.1.7448"
* form.coding[OID7448].code = #36
* form.coding[OID7448].display = "Pulver til injeksjonsvæske, oppløsning"
