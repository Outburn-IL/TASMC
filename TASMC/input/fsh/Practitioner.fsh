Profile: TasmcPractitioner
Parent: il-core-practitioner
Id: tasmc-practitioner
Title: "TASMC Practitioner Profile"
Description: "Defines constraints and extensions on the Practitioner resource for TASMC"
* insert ConformanceMetadata
// Additional identifier slices
* identifier contains
    tasmc 0..1 and
    user-name 0..1

* identifier[tasmc].system 1..1
* identifier[tasmc].system = "http://fhir.tasmc.org.il/identifier/tasmc-id" (exactly)
* identifier[tasmc].value 1..1

* identifier[user-name].system 1..1
* identifier[user-name].system = "http://fhir.tasmc.org.il/identifier/AD-user" (exactly)
* identifier[user-name].value 1..1

// Telecom slicing with composite discriminator (system + use)
* telecom ^slicing.discriminator[0].type = #value
* telecom ^slicing.discriminator[0].path = "system"
* telecom ^slicing.discriminator[1].type = #value
* telecom ^slicing.discriminator[1].path = "use"
* telecom ^slicing.rules = #open

* telecom contains
    work 0..1 and
    mobile 0..1 and
    work-email 0..1 and
    home-email 0..1

* telecom[work].system 1..1
* telecom[work].system = #phone (exactly)
* telecom[work].use 1..1
* telecom[work].use = #work (exactly)
* telecom[work].value 1..1

* telecom[mobile].system 1..1
* telecom[mobile].system = #phone (exactly)
* telecom[mobile].use 1..1
* telecom[mobile].use = #mobile (exactly)
* telecom[mobile].value 1..1

* telecom[work-email].system 1..1
* telecom[work-email].system = #email (exactly)
* telecom[work-email].use 1..1
* telecom[work-email].use = #work (exactly)
* telecom[work-email].value 1..1

* telecom[home-email].system 1..1
* telecom[home-email].system = #email (exactly)
* telecom[home-email].use 1..1
* telecom[home-email].use = #home (exactly)
* telecom[home-email].value 1..1