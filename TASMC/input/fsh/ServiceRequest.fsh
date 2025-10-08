Profile: TasmcServiceRequestLab
Parent: ILCoreServiceRequestLab
Id: tasmc-service-request-lab
Title: "tasmc Service Request Lab"
Description: "tasmc ServiceRequest Lab profile, based on ILCoreServiceRequest"
* id 1..1
* identifier.system 1..1
* identifier.system = $lab-request-ident (exactly)
* requisition.system = $lab-order-ident (exactly)
* identifier.value 1..1
* requisition.system 1..1
* requisition.value 1..1
* requester 0..1
* requester.identifier 1..1
* requester.identifier.system 1..1
* requester.identifier.system = $lab-unit-ident (exactly)
* requester.identifier.value 1..1
* requester.display 1..1
* intent 1..1
* intent = #order
* subject.identifier 1..1
* subject.identifier.system 1..1
* subject.identifier.system = $patient-namer-ident (exactly)
* subject.identifier.value 1..1
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.ordered = false
* code.coding contains tasmc 1..1
* code.coding[tasmc].system 1..1
* code.coding[tasmc].system = $lab-request-code (exactly)
* code.coding[tasmc].code 1..1
* code.coding[tasmc].display 1..1
* authoredOn 1..1
