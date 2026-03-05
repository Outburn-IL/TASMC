Profile: TasmcPatient
Parent: ILHDPPatient
Id: tasmc-patient
Title: "Sourasky Patient Profile"
Description: "Sourasky Patient Profile"
* insert ConformanceMetadata
* identifier contains nmr-pat-int-num 0..1 and nmr-pat-tmp-num 0..1
* identifier[nmr-pat-int-num] 0..1
* identifier[nmr-pat-int-num].system 1..1
* identifier[nmr-pat-int-num].system = "http://fhir.Tasmc.health.gov.il/identifier/nmr-pat-int-num" (exactly)
* identifier[nmr-pat-int-num].value 1..1

* identifier[nmr-pat-tmp-num] 0..1
* identifier[nmr-pat-tmp-num].system 1..1
* identifier[nmr-pat-tmp-num].system = "http://fhir.Tasmc.health.gov.il/identifier/nmr-pat-tmp-num" (exactly)
* identifier[nmr-pat-tmp-num].value 1..1