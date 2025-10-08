// Profile: TasmcObservationPathologyLab
// Parent: ILCoreObservationLab
// Id: tasmc-observation-path-lab
// Title: "Sourasky Lab Pathology Results Profile"
// Description: "tasmc Observation Pathology Lab profile, based on ILCoreObservationLab"
// * id 1..1
// * identifier.system 1..1
// * identifier.system = $lab-request-ident (exactly)
// * basedOn.identifier.system 1..1
// * basedOn.identifier.system = $lab-request-ident (exactly)
// * subject.identifier 1..1
// * subject.identifier.system 1..1
// * subject.identifier.system = $patient-namer-ident (exactly)
// * performer[organization].identifier.system 1..1
// * performer[organization].identifier.system = $lab-unit-ident (exactly)
// * performer[organization].identifier.value 1..1
// * performer[practitioner].identifier.system 0..1
// * performer[practitioner].identifier.system = $prac-ident (exactly)
// * code.coding 2..2
// * code.coding ^slicing.discriminator.type = #value
// * code.coding ^slicing.discriminator.path = "system"
// * code.coding ^slicing.rules = #closed
// * code.coding ^slicing.description = "Must have one ILCore Code and one of tasmc"
// * code.coding contains tasmcSingleResult 1..1
// * code.coding[tasmcSingleResult].system 1..1
// * code.coding[tasmcSingleResult].system = $lab-request-code (exactly)
// * code.coding[tasmcSingleResult].code 1..1
// * code.coding[tasmcSingleResult].display 1..1

