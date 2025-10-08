Profile: TasmcSpecimenLab
Parent: ILCoreSpecimen
Id: tasmc-specimen-lab
Title: "Sourasky Lab Samples Profile"
Description: "tasmc Specimen Lab profile, based on sctSpecimen"
* id 1..1
* identifier.system 1..1
* identifier.system = $lab-spec-ident (exactly)
* identifier.value 1..1
* subject.identifier 1..1
* subject.identifier.system 1..1
* subject.identifier.system = $patient-namer-ident (exactly)
* subject.identifier.value 1..1
* accessionIdentifier.system 1..1
* accessionIdentifier.system = $lab-spec-ident (exactly)
* accessionIdentifier.value 1..1
* request.identifier.system 1..1
* request.identifier.system = $lab-request-ident (exactly)
* request.identifier.value 1..1
* type.coding ^slicing.discriminator.type = #value
* type.coding ^slicing.discriminator.path = "system"
* type.coding ^slicing.rules = #open
* type.coding ^slicing.description = "Type MUST contain at least one code"
* type.coding 1..*
* type.coding contains tasmc 0..1
* type.coding[tasmc].system 1..1
* type.coding[tasmc].system = $specimen-type (exactly)
* type.coding[tasmc].code 1..1
* type.coding[tasmc].display 1..1
* type.coding[tasmc] from $vs-specimen-type (required)
* container.type.coding.system 1..1
* container.type.coding.system = $container-type (exactly)
* collection.bodySite.coding ^slicing.discriminator.type = #value
* collection.bodySite.coding ^slicing.discriminator.path = "system"
* collection.bodySite.coding ^slicing.rules = #open
* collection.bodySite.coding contains tasmc 0..1
* collection.bodySite.coding[tasmc].system 1..1
* collection.bodySite.coding[tasmc].system = $body-sites (exactly)