Profile: TasmcObservationLab
Parent: ILCoreObservationLab
Id: tasmc-observation-lab
Title: "Sourasky Lab Results Profile"
Description: "tasmc Observation Lab profile, based on ILcoreObservationLab"
* insert ConformanceMetadata
* id 1..1
* identifier.system 1..1
* identifier.system = $lab-request-ident (exactly)
* basedOn.identifier.system 1..1
* basedOn.identifier.system = $lab-request-ident (exactly)
* subject.identifier 1..1
* subject.identifier.system 1..1
* subject.identifier.system = $patient-namer-ident (exactly)
* performer ^slicing.discriminator.type = #value
* performer ^slicing.discriminator.path = "identifier.system"
* performer ^slicing.rules = #open
* performer contains practitioner 0..* and lab-unit 0..*
* performer[lab-unit].identifier.system 1..1
* performer[lab-unit].identifier.system = $lab-unit-ident (exactly)
* performer[lab-unit].identifier.value 1..1
* performer[practitioner].identifier.system 1..1
* performer[practitioner].identifier.system = $prac-ident (exactly)
* performer[practitioner].identifier.value 1..1
* code.coding 1..*
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.description = "Must have one ILCore Code and one of tasmc"
* code.coding contains tasmcSingleResult 1..1
* code.coding[tasmcSingleResult].system 1..1
* code.coding[tasmcSingleResult].system = $lab-request-code (exactly)
* code.coding[tasmcSingleResult].code 1..1
* code.coding[tasmcSingleResult].display 1..1
* category[il-core].coding.display = "Laboratory procedure" (exactly)
