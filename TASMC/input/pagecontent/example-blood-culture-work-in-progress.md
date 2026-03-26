<div dir="rtl" markdown="1">

## הזמנה בעבודה - תרבית דם

**הערה חשובה:** כל הנתונים בדוגמה זו עברו התממה לצורכי הדגמה בלבד.

### שימושים קליניים

דוגמה זו מציגה bundle של תרבית דם במצב ביניים, כאשר רוב הבדיקות עדיין בעבודה. הדוגמה ממחישה:
- ServiceRequest עבור תרבית דם אירובית
- 2 דגימות (בקבוקי תרבית)
- Observation פאנל עם 9 תוצאות צאצא
- רוב התוצאות עם dataAbsentReason: not-performed
- תוצאה אחת סופית (מדידת נפח)
- DiagnosticReport בסטטוס preliminary

### גרף קשרים

![Reference Graph](הזמנה_בעבודה.jpg)

הגרף מציג את הקשרים בין משאבי FHIR בבאנדל. כל חץ מייצג reference בין משאבים.

### Bundle JSON

</div>

<div dir="ltr">

```json
{
  "resourceType": "Bundle",
  "entry": [
    {
      "fullUrl": "urn:uuid:60569ac0-6ff3-5946-b53c-e6343b1ca01a",
      "request": {
        "method": "PUT",
        "url": "ServiceRequest/LABOS.684227818-20231122212600-0887040810"
      },
      "resource": {
        "resourceType": "ServiceRequest",
        "authoredOn": "2023-11-22T21:26:00+02:00",
        "category": [
          {
            "coding": [
              {
                "code": "108252007",
                "display": "Laboratory procedure",
                "system": "http://snomed.info/sct"
              }
            ]
          }
        ],
        "code": {
          "coding": [
            {
              "code": "17928-3",
              "display": "Bacteria identified in Blood by Aerobe culture",
              "system": "http://loinc.org"
            },
            {
              "code": "0887040810",
              "display": "blctae-p",
              "system": "http://fhir.tasmc.org.il/CodeSystem/labos-request-code",
              "userSelected": true
            }
          ],
          "text": "blctae-p"
        },
        "encounter": {
          "identifier": {
            "system": "http://fhir.Tasmc.health.gov.il/identifier/cml-medical-record",
            "value": "0013046431"
          }
        },
        "id": "LABOS.684227818-20231122212600-0887040810",
        "identifier": [
          {
            "system": "http://fhir.tasmc.org.il/identifier/labos-request",
            "value": "684227818-20231122212600-0887040810"
          }
        ],
        "intent": "order",
        "meta": {
          "profile": [
            "http://fhir.tasmc.org.il/StructureDefinition/tasmc-service-request-lab"
          ]
        },
        "requester": {
          "display": "מחלקה לרפואה דחופה",
          "identifier": {
            "system": "http://fhir.tasmc.org.il/identifier/tasmc-lab-unit",
            "value": "מי-מלרד"
          },
          "type": "Organization"
        },
        "requisition": {
          "system": "http://fhir.tasmc.org.il/identifier/labos-order",
          "value": "684227818-20231122212600"
        },
        "status": "active",
        "subject": {
          "identifier": {
            "system": "http://fhir.tasmc.health.gov.il/identifier/nmr-pat-int-num",
            "value": "0002380186"
          },
          "type": "Patient"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:d471fed5-8f31-5727-91ee-bf55cb8d28c0",
      "request": {
        "method": "PUT",
        "url": "Specimen/LABOS.684227818-20231122212600-881223777"
      },
      "resource": {
        "resourceType": "Specimen",
        "collection": {
          "bodySite": {
            "coding": [
              {
                "code": "216",
                "display": "דם ורידי",
                "system": "http://fhir.tasmc.org.il/CodeSystem/labos-bodysites"
              },
              {
                "code": "123037004",
                "display": "Body structure (body structure)",
                "system": "http://snomed.info/sct"
              }
            ]
          },
          "collectedDateTime": "2023-11-22T21:27:00+02:00",
          "duration": {
            "value": 0
          },
          "quantity": {
            "value": 0
          }
        },
        "container": [
          {
            "type": {
              "coding": [
                {
                  "code": "14",
                  "display": "בק.י",
                  "system": "http://fhir.tasmc.org.il/CodeSystem/labos-container-type"
                }
              ]
            }
          }
        ],
        "id": "LABOS.684227818-20231122212600-881223777",
        "identifier": [
          {
            "system": "http://fhir.tasmc.org.il/identifier/labos-specimen-id",
            "value": "684227818-20231122212600-881223777"
          }
        ],
        "meta": {
          "profile": [
            "http://fhir.tasmc.org.il/StructureDefinition/tasmc-specimen-lab"
          ]
        },
        "status": "available",
        "subject": {
          "identifier": {
            "system": "http://fhir.tasmc.health.gov.il/identifier/nmr-pat-int-num",
            "value": "0002380186"
          },
          "type": "Patient"
        },
        "type": {
          "coding": [
            {
              "code": "122561005",
              "display": "Blood specimen from patient (specimen)",
              "system": "http://snomed.info/sct"
            },
            {
              "code": "1",
              "display": "דם",
              "system": "http://fhir.tasmc.org.il/CodeSystem/labos-specimen-type"
            }
          ]
        }
      }
    },
    {
      "fullUrl": "urn:uuid:9e47589f-1b97-5d93-9028-345df2483cf5",
      "request": {
        "method": "PUT",
        "url": "Specimen/LABOS.684227818-20231122212600-881223776"
      },
      "resource": {
        "resourceType": "Specimen",
        "collection": {
          "bodySite": {
            "coding": [
              {
                "code": "216",
                "display": "דם ורידי",
                "system": "http://fhir.tasmc.org.il/CodeSystem/labos-bodysites"
              },
              {
                "code": "123037004",
                "display": "Body structure (body structure)",
                "system": "http://snomed.info/sct"
              }
            ]
          },
          "collectedDateTime": "2023-11-22T21:27:00+02:00",
          "duration": {
            "value": 0
          },
          "quantity": {
            "value": 0
          }
        },
        "container": [
          {
            "type": {
              "coding": [
                {
                  "code": "14",
                  "display": "בק.י",
                  "system": "http://fhir.tasmc.org.il/CodeSystem/labos-container-type"
                }
              ]
            }
          }
        ],
        "id": "LABOS.684227818-20231122212600-881223776",
        "identifier": [
          {
            "system": "http://fhir.tasmc.org.il/identifier/labos-specimen-id",
            "value": "684227818-20231122212600-881223776"
          }
        ],
        "meta": {
          "profile": [
            "http://fhir.tasmc.org.il/StructureDefinition/tasmc-specimen-lab"
          ]
        },
        "status": "available",
        "subject": {
          "identifier": {
            "system": "http://fhir.tasmc.health.gov.il/identifier/nmr-pat-int-num",
            "value": "0002380186"
          },
          "type": "Patient"
        },
        "type": {
          "coding": [
            {
              "code": "122561005",
              "display": "Blood specimen from patient (specimen)",
              "system": "http://snomed.info/sct"
            },
            {
              "code": "17",
              "display": "דם2",
              "system": "http://fhir.tasmc.org.il/CodeSystem/labos-specimen-type"
            }
          ]
        }
      }
    },
    {
      "fullUrl": "urn:uuid:68e13d93-8234-518f-8f55-1e53ac2f263c",
      "request": {
        "method": "PUT",
        "url": "Observation/LABOS.684227818-20231122212600-0887040810-P"
      },
      "resource": {
        "resourceType": "Observation",
        "basedOn": [
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-0887040810"
            },
            "reference": "urn:uuid:60569ac0-6ff3-5946-b53c-e6343b1ca01a",
            "type": "ServiceRequest"
          }
        ],
        "category": [
          {
            "coding": [
              {
                "code": "108252007",
                "display": "Laboratory procedure",
                "system": "http://snomed.info/sct"
              }
            ]
          }
        ],
        "code": {
          "coding": [
            {
              "code": "17928-3",
              "display": "Bacteria identified in Blood by Aerobe culture",
              "system": "http://loinc.org"
            },
            {
              "code": "0887040810",
              "display": "blctae-p",
              "system": "http://fhir.tasmc.org.il/CodeSystem/labos-request-code",
              "userSelected": true
            }
          ],
          "text": "blctae-p"
        },
        "effectiveDateTime": "2023-11-22T21:26:00+02:00",
        "encounter": {
          "identifier": {
            "system": "http://fhir.Tasmc.health.gov.il/identifier/cml-medical-record",
            "value": "0013046431"
          }
        },
        "extension": [
          {
            "url": "http://hl7.org/fhir/StructureDefinition/observation-deviceCode",
            "valueCodeableConcept": {
              "coding": [
                {
                  "code": "202",
                  "display": "דם",
                  "system": "http://fhir.tasmc.org.il/identifier/labos-device-id"
                }
              ],
              "text": "דם"
            }
          }
        ],
        "hasMember": [
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-result"
            },
            "reference": "urn:uuid:99741f65-3b52-5aec-be1a-3fd73dc3926b",
            "type": "Observation"
          },
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-result"
            },
            "reference": "urn:uuid:5d22da6c-3a50-51d9-8420-6ed8d8361b25",
            "type": "Observation"
          },
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-result"
            },
            "reference": "urn:uuid:dbad403e-52b4-5bbc-9720-001df5fb491d",
            "type": "Observation"
          },
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-result"
            },
            "reference": "urn:uuid:9513c66a-6e30-525b-9256-1a844e280f0c",
            "type": "Observation"
          },
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-result"
            },
            "reference": "urn:uuid:cdd5f3e1-a642-538a-b651-fd40ce50caa2",
            "type": "Observation"
          },
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-result"
            },
            "reference": "urn:uuid:afd585e0-b092-5a39-a72e-110ba1c210a9",
            "type": "Observation"
          },
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-result"
            },
            "reference": "urn:uuid:375c44ef-7813-50c7-88b7-68086c25a14f",
            "type": "Observation"
          },
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-result"
            },
            "reference": "urn:uuid:ff73af37-b9d6-5e7b-bee5-c7739d1a4fe1",
            "type": "Observation"
          },
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-result"
            },
            "reference": "urn:uuid:fbdb9e70-72e6-573e-bdf8-0b310407cd1c",
            "type": "Observation"
          }
        ],
        "id": "LABOS.684227818-20231122212600-0887040810-P",
        "identifier": [
          {
            "system": "http://fhir.tasmc.org.il/identifier/labos-request",
            "value": "684227818-20231122212600-0887040810-P"
          }
        ],
        "meta": {
          "profile": [
            "http://fhir.tasmc.org.il/StructureDefinition/tasmc-observation-lab"
          ]
        },
        "note": [
          {
            "text": "Device/Room/Post Data -  Code: 202, Name:דם"
          }
        ],
        "performer": [
          {
            "display": "חמזה עלי",
            "identifier": {
              "system": "http://fhir.health.gov.il/identifier/il-national-id",
              "value": "302962451"
            },
            "type": "Practitioner"
          },
          {
            "display": "מיקרוביולוגיה",
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/tasmc-lab-unit",
              "value": "9903"
            },
            "type": "Organization"
          }
        ],
        "status": "preliminary",
        "subject": {
          "identifier": {
            "system": "http://fhir.tasmc.health.gov.il/identifier/nmr-pat-int-num",
            "value": "0002380186"
          },
          "type": "Patient"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:99741f65-3b52-5aec-be1a-3fd73dc3926b",
      "request": {
        "method": "PUT",
        "url": "Observation/LABOS.684227818-20231122212600-5"
      },
      "resource": {
        "resourceType": "Observation",
        "basedOn": [
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-0887040810"
            },
            "reference": "urn:uuid:60569ac0-6ff3-5946-b53c-e6343b1ca01a",
            "type": "ServiceRequest"
          }
        ],
        "category": [
          {
            "coding": [
              {
                "code": "108252007",
                "display": "Laboratory procedure",
                "system": "http://snomed.info/sct"
              }
            ]
          }
        ],
        "code": {
          "coding": [
            {
              "code": "A8075",
              "display": "VOLM",
              "system": "http://fhir.tasmc.org.il/CodeSystem/labos-request-code",
              "userSelected": true
            }
          ],
          "text": "Volume measured"
        },
        "dataAbsentReason": {
          "coding": [
            {
              "code": "not-performed",
              "display": "Not Performed",
              "system": "http://terminology.hl7.org/CodeSystem/data-absent-reason"
            }
          ]
        },
        "effectiveDateTime": "2023-11-22T21:26:00+02:00",
        "encounter": {
          "identifier": {
            "system": "http://fhir.Tasmc.health.gov.il/identifier/cml-medical-record",
            "value": "0013046431"
          }
        },
        "extension": [
          {
            "url": "http://hl7.org/fhir/StructureDefinition/observation-deviceCode",
            "valueCodeableConcept": {
              "coding": [
                {
                  "code": "202",
                  "display": "דם",
                  "system": "http://fhir.tasmc.org.il/identifier/labos-device-id"
                }
              ],
              "text": "דם"
            }
          }
        ],
        "id": "LABOS.684227818-20231122212600-5",
        "identifier": [
          {
            "system": "http://fhir.tasmc.org.il/identifier/labos-request",
            "value": "684227818-20231122212600-5"
          }
        ],
        "meta": {
          "profile": [
            "http://fhir.tasmc.org.il/StructureDefinition/tasmc-observation-lab"
          ]
        },
        "note": [
          {
            "text": "Device/Room/Post Data -  Code: 202, Name:דם"
          }
        ],
        "performer": [
          {
            "display": "חמזה עלי",
            "identifier": {
              "system": "http://fhir.health.gov.il/identifier/il-national-id",
              "value": "302962451"
            },
            "type": "Practitioner"
          },
          {
            "display": "מיקרוביולוגיה",
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/tasmc-lab-unit",
              "value": "9903"
            },
            "type": "Organization"
          }
        ],
        "specimen": {
          "identifier": {
            "system": "http://fhir.tasmc.org.il/identifier/labos-specimen-id",
            "value": "684227818-20231122212600-881223777"
          },
          "reference": "urn:uuid:d471fed5-8f31-5727-91ee-bf55cb8d28c0",
          "type": "Specimen"
        },
        "status": "preliminary",
        "subject": {
          "identifier": {
            "system": "http://fhir.tasmc.health.gov.il/identifier/nmr-pat-int-num",
            "value": "0002380186"
          },
          "type": "Patient"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:5d22da6c-3a50-51d9-8420-6ed8d8361b25",
      "request": {
        "method": "PUT",
        "url": "Observation/LABOS.684227818-20231122212600-6"
      },
      "resource": {
        "resourceType": "Observation",
        "basedOn": [
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-0887040810"
            },
            "reference": "urn:uuid:60569ac0-6ff3-5946-b53c-e6343b1ca01a",
            "type": "ServiceRequest"
          }
        ],
        "category": [
          {
            "coding": [
              {
                "code": "108252007",
                "display": "Laboratory procedure",
                "system": "http://snomed.info/sct"
              }
            ]
          }
        ],
        "code": {
          "coding": [
            {
              "code": "0810100010",
              "display": "blood ct",
              "system": "http://fhir.tasmc.org.il/CodeSystem/labos-request-code",
              "userSelected": true
            }
          ],
          "text": "Culture - blood"
        },
        "dataAbsentReason": {
          "coding": [
            {
              "code": "not-performed",
              "display": "Not Performed",
              "system": "http://terminology.hl7.org/CodeSystem/data-absent-reason"
            }
          ]
        },
        "effectiveDateTime": "2023-11-22T21:26:00+02:00",
        "encounter": {
          "identifier": {
            "system": "http://fhir.Tasmc.health.gov.il/identifier/cml-medical-record",
            "value": "0013046431"
          }
        },
        "extension": [
          {
            "url": "http://hl7.org/fhir/StructureDefinition/observation-deviceCode",
            "valueCodeableConcept": {
              "coding": [
                {
                  "code": "202",
                  "display": "דם",
                  "system": "http://fhir.tasmc.org.il/identifier/labos-device-id"
                }
              ],
              "text": "דם"
            }
          }
        ],
        "id": "LABOS.684227818-20231122212600-6",
        "identifier": [
          {
            "system": "http://fhir.tasmc.org.il/identifier/labos-request",
            "value": "684227818-20231122212600-6"
          }
        ],
        "meta": {
          "profile": [
            "http://fhir.tasmc.org.il/StructureDefinition/tasmc-observation-lab"
          ]
        },
        "note": [
          {
            "text": "Device/Room/Post Data -  Code: 202, Name:דם"
          }
        ],
        "performer": [
          {
            "display": "חמזה עלי",
            "identifier": {
              "system": "http://fhir.health.gov.il/identifier/il-national-id",
              "value": "302962451"
            },
            "type": "Practitioner"
          },
          {
            "display": "מיקרוביולוגיה",
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/tasmc-lab-unit",
              "value": "9903"
            },
            "type": "Organization"
          }
        ],
        "specimen": {
          "identifier": {
            "system": "http://fhir.tasmc.org.il/identifier/labos-specimen-id",
            "value": "684227818-20231122212600-881223777"
          },
          "reference": "urn:uuid:d471fed5-8f31-5727-91ee-bf55cb8d28c0",
          "type": "Specimen"
        },
        "status": "preliminary",
        "subject": {
          "identifier": {
            "system": "http://fhir.tasmc.health.gov.il/identifier/nmr-pat-int-num",
            "value": "0002380186"
          },
          "type": "Patient"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:dbad403e-52b4-5bbc-9720-001df5fb491d",
      "request": {
        "method": "PUT",
        "url": "Observation/LABOS.684227818-20231122212600-7"
      },
      "resource": {
        "resourceType": "Observation",
        "basedOn": [
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-0887040810"
            },
            "reference": "urn:uuid:60569ac0-6ff3-5946-b53c-e6343b1ca01a",
            "type": "ServiceRequest"
          }
        ],
        "category": [
          {
            "coding": [
              {
                "code": "108252007",
                "display": "Laboratory procedure",
                "system": "http://snomed.info/sct"
              }
            ]
          }
        ],
        "code": {
          "coding": [
            {
              "code": "0810132800",
              "display": "cuac",
              "system": "http://fhir.tasmc.org.il/CodeSystem/labos-request-code",
              "userSelected": true
            }
          ],
          "text": "Culture aerobic bottle"
        },
        "dataAbsentReason": {
          "coding": [
            {
              "code": "not-performed",
              "display": "Not Performed",
              "system": "http://terminology.hl7.org/CodeSystem/data-absent-reason"
            }
          ]
        },
        "effectiveDateTime": "2023-11-22T21:26:00+02:00",
        "encounter": {
          "identifier": {
            "system": "http://fhir.Tasmc.health.gov.il/identifier/cml-medical-record",
            "value": "0013046431"
          }
        },
        "extension": [
          {
            "url": "http://hl7.org/fhir/StructureDefinition/observation-deviceCode",
            "valueCodeableConcept": {
              "coding": [
                {
                  "code": "202",
                  "display": "דם",
                  "system": "http://fhir.tasmc.org.il/identifier/labos-device-id"
                }
              ],
              "text": "דם"
            }
          }
        ],
        "id": "LABOS.684227818-20231122212600-7",
        "identifier": [
          {
            "system": "http://fhir.tasmc.org.il/identifier/labos-request",
            "value": "684227818-20231122212600-7"
          }
        ],
        "meta": {
          "profile": [
            "http://fhir.tasmc.org.il/StructureDefinition/tasmc-observation-lab"
          ]
        },
        "note": [
          {
            "text": "Device/Room/Post Data -  Code: 202, Name:דם"
          }
        ],
        "performer": [
          {
            "display": "חמזה עלי",
            "identifier": {
              "system": "http://fhir.health.gov.il/identifier/il-national-id",
              "value": "302962451"
            },
            "type": "Practitioner"
          },
          {
            "display": "מיקרוביולוגיה",
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/tasmc-lab-unit",
              "value": "9903"
            },
            "type": "Organization"
          }
        ],
        "specimen": {
          "identifier": {
            "system": "http://fhir.tasmc.org.il/identifier/labos-specimen-id",
            "value": "684227818-20231122212600-881223777"
          },
          "reference": "urn:uuid:d471fed5-8f31-5727-91ee-bf55cb8d28c0",
          "type": "Specimen"
        },
        "status": "preliminary",
        "subject": {
          "identifier": {
            "system": "http://fhir.tasmc.health.gov.il/identifier/nmr-pat-int-num",
            "value": "0002380186"
          },
          "type": "Patient"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:9513c66a-6e30-525b-9256-1a844e280f0c",
      "request": {
        "method": "PUT",
        "url": "Observation/LABOS.684227818-20231122212600-8"
      },
      "resource": {
        "resourceType": "Observation",
        "basedOn": [
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-0887040810"
            },
            "reference": "urn:uuid:60569ac0-6ff3-5946-b53c-e6343b1ca01a",
            "type": "ServiceRequest"
          }
        ],
        "category": [
          {
            "coding": [
              {
                "code": "108252007",
                "display": "Laboratory procedure",
                "system": "http://snomed.info/sct"
              }
            ]
          }
        ],
        "code": {
          "coding": [
            {
              "code": "0811638800",
              "display": "TTD",
              "system": "http://fhir.tasmc.org.il/CodeSystem/labos-request-code",
              "userSelected": true
            }
          ],
          "text": "Time to detection, microbiology"
        },
        "dataAbsentReason": {
          "coding": [
            {
              "code": "not-performed",
              "display": "Not Performed",
              "system": "http://terminology.hl7.org/CodeSystem/data-absent-reason"
            }
          ]
        },
        "effectiveDateTime": "2023-11-22T21:26:00+02:00",
        "encounter": {
          "identifier": {
            "system": "http://fhir.Tasmc.health.gov.il/identifier/cml-medical-record",
            "value": "0013046431"
          }
        },
        "extension": [
          {
            "url": "http://hl7.org/fhir/StructureDefinition/observation-deviceCode",
            "valueCodeableConcept": {
              "coding": [
                {
                  "code": "202",
                  "display": "דם",
                  "system": "http://fhir.tasmc.org.il/identifier/labos-device-id"
                }
              ],
              "text": "דם"
            }
          }
        ],
        "id": "LABOS.684227818-20231122212600-8",
        "identifier": [
          {
            "system": "http://fhir.tasmc.org.il/identifier/labos-request",
            "value": "684227818-20231122212600-8"
          }
        ],
        "meta": {
          "profile": [
            "http://fhir.tasmc.org.il/StructureDefinition/tasmc-observation-lab"
          ]
        },
        "note": [
          {
            "text": "Device/Room/Post Data -  Code: 202, Name:דם"
          }
        ],
        "performer": [
          {
            "display": "חמזה עלי",
            "identifier": {
              "system": "http://fhir.health.gov.il/identifier/il-national-id",
              "value": "302962451"
            },
            "type": "Practitioner"
          },
          {
            "display": "מיקרוביולוגיה",
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/tasmc-lab-unit",
              "value": "9903"
            },
            "type": "Organization"
          }
        ],
        "specimen": {
          "identifier": {
            "system": "http://fhir.tasmc.org.il/identifier/labos-specimen-id",
            "value": "684227818-20231122212600-881223777"
          },
          "reference": "urn:uuid:d471fed5-8f31-5727-91ee-bf55cb8d28c0",
          "type": "Specimen"
        },
        "status": "preliminary",
        "subject": {
          "identifier": {
            "system": "http://fhir.tasmc.health.gov.il/identifier/nmr-pat-int-num",
            "value": "0002380186"
          },
          "type": "Patient"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:cdd5f3e1-a642-538a-b651-fd40ce50caa2",
      "request": {
        "method": "PUT",
        "url": "Observation/LABOS.684227818-20231122212600-11"
      },
      "resource": {
        "resourceType": "Observation",
        "basedOn": [
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-0887040810"
            },
            "reference": "urn:uuid:60569ac0-6ff3-5946-b53c-e6343b1ca01a",
            "type": "ServiceRequest"
          }
        ],
        "category": [
          {
            "coding": [
              {
                "code": "108252007",
                "display": "Laboratory procedure",
                "system": "http://snomed.info/sct"
              }
            ]
          }
        ],
        "code": {
          "coding": [
            {
              "code": "A8075",
              "display": "VOLM",
              "system": "http://fhir.tasmc.org.il/CodeSystem/labos-request-code",
              "userSelected": true
            }
          ],
          "text": "Volume measured"
        },
        "effectiveDateTime": "2023-11-22T21:26:00+02:00",
        "encounter": {
          "identifier": {
            "system": "http://fhir.Tasmc.health.gov.il/identifier/cml-medical-record",
            "value": "0013046431"
          }
        },
        "extension": [
          {
            "url": "http://hl7.org/fhir/StructureDefinition/observation-deviceCode",
            "valueCodeableConcept": {
              "coding": [
                {
                  "code": "202",
                  "display": "דם",
                  "system": "http://fhir.tasmc.org.il/identifier/labos-device-id"
                }
              ],
              "text": "דם"
            }
          }
        ],
        "id": "LABOS.684227818-20231122212600-11",
        "identifier": [
          {
            "system": "http://fhir.tasmc.org.il/identifier/labos-request",
            "value": "684227818-20231122212600-11"
          }
        ],
        "issued": "2023-11-23T07:42:00+02:00",
        "meta": {
          "profile": [
            "http://fhir.tasmc.org.il/StructureDefinition/tasmc-observation-lab"
          ]
        },
        "method": {
          "coding": [
            {
              "code": "272391002",
              "display": "Measurement",
              "system": "http://snomed.info/sct"
            }
          ]
        },
        "note": [
          {
            "text": "Device/Room/Post Data -  Code: 202, Name:דם"
          }
        ],
        "performer": [
          {
            "display": "חמזה עלי",
            "identifier": {
              "system": "http://fhir.health.gov.il/identifier/il-national-id",
              "value": "302962451"
            },
            "type": "Practitioner"
          },
          {
            "display": "אישור אוטומטי"
          },
          {
            "display": "מיקרוביולוגיה",
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/tasmc-lab-unit",
              "value": "9903"
            },
            "type": "Organization"
          }
        ],
        "specimen": {
          "identifier": {
            "system": "http://fhir.tasmc.org.il/identifier/labos-specimen-id",
            "value": "684227818-20231122212600-881223776"
          },
          "reference": "urn:uuid:9e47589f-1b97-5d93-9028-345df2483cf5",
          "type": "Specimen"
        },
        "status": "final",
        "subject": {
          "identifier": {
            "system": "http://fhir.tasmc.health.gov.il/identifier/nmr-pat-int-num",
            "value": "0002380186"
          },
          "type": "Patient"
        },
        "valueQuantity": {
          "value": 3
        }
      }
    },
    {
      "fullUrl": "urn:uuid:afd585e0-b092-5a39-a72e-110ba1c210a9",
      "request": {
        "method": "PUT",
        "url": "Observation/LABOS.684227818-20231122212600-12"
      },
      "resource": {
        "resourceType": "Observation",
        "basedOn": [
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-0887040810"
            },
            "reference": "urn:uuid:60569ac0-6ff3-5946-b53c-e6343b1ca01a",
            "type": "ServiceRequest"
          }
        ],
        "category": [
          {
            "coding": [
              {
                "code": "108252007",
                "display": "Laboratory procedure",
                "system": "http://snomed.info/sct"
              }
            ]
          }
        ],
        "code": {
          "coding": [
            {
              "code": "0810100010",
              "display": "blood ct",
              "system": "http://fhir.tasmc.org.il/CodeSystem/labos-request-code",
              "userSelected": true
            }
          ],
          "text": "Culture - blood"
        },
        "dataAbsentReason": {
          "coding": [
            {
              "code": "not-performed",
              "display": "Not Performed",
              "system": "http://terminology.hl7.org/CodeSystem/data-absent-reason"
            }
          ]
        },
        "effectiveDateTime": "2023-11-22T21:26:00+02:00",
        "encounter": {
          "identifier": {
            "system": "http://fhir.Tasmc.health.gov.il/identifier/cml-medical-record",
            "value": "0013046431"
          }
        },
        "extension": [
          {
            "url": "http://hl7.org/fhir/StructureDefinition/observation-deviceCode",
            "valueCodeableConcept": {
              "coding": [
                {
                  "code": "202",
                  "display": "דם",
                  "system": "http://fhir.tasmc.org.il/identifier/labos-device-id"
                }
              ],
              "text": "דם"
            }
          }
        ],
        "id": "LABOS.684227818-20231122212600-12",
        "identifier": [
          {
            "system": "http://fhir.tasmc.org.il/identifier/labos-request",
            "value": "684227818-20231122212600-12"
          }
        ],
        "meta": {
          "profile": [
            "http://fhir.tasmc.org.il/StructureDefinition/tasmc-observation-lab"
          ]
        },
        "note": [
          {
            "text": "Device/Room/Post Data -  Code: 202, Name:דם"
          }
        ],
        "performer": [
          {
            "display": "חמזה עלי",
            "identifier": {
              "system": "http://fhir.health.gov.il/identifier/il-national-id",
              "value": "302962451"
            },
            "type": "Practitioner"
          },
          {
            "display": "מיקרוביולוגיה",
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/tasmc-lab-unit",
              "value": "9903"
            },
            "type": "Organization"
          }
        ],
        "specimen": {
          "identifier": {
            "system": "http://fhir.tasmc.org.il/identifier/labos-specimen-id",
            "value": "684227818-20231122212600-881223776"
          },
          "reference": "urn:uuid:9e47589f-1b97-5d93-9028-345df2483cf5",
          "type": "Specimen"
        },
        "status": "preliminary",
        "subject": {
          "identifier": {
            "system": "http://fhir.tasmc.health.gov.il/identifier/nmr-pat-int-num",
            "value": "0002380186"
          },
          "type": "Patient"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:375c44ef-7813-50c7-88b7-68086c25a14f",
      "request": {
        "method": "PUT",
        "url": "Observation/LABOS.684227818-20231122212600-13"
      },
      "resource": {
        "resourceType": "Observation",
        "basedOn": [
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-0887040810"
            },
            "reference": "urn:uuid:60569ac0-6ff3-5946-b53c-e6343b1ca01a",
            "type": "ServiceRequest"
          }
        ],
        "category": [
          {
            "coding": [
              {
                "code": "108252007",
                "display": "Laboratory procedure",
                "system": "http://snomed.info/sct"
              }
            ]
          }
        ],
        "code": {
          "coding": [
            {
              "code": "0810132800",
              "display": "cuac",
              "system": "http://fhir.tasmc.org.il/CodeSystem/labos-request-code",
              "userSelected": true
            }
          ],
          "text": "Culture aerobic bottle"
        },
        "dataAbsentReason": {
          "coding": [
            {
              "code": "not-performed",
              "display": "Not Performed",
              "system": "http://terminology.hl7.org/CodeSystem/data-absent-reason"
            }
          ]
        },
        "effectiveDateTime": "2023-11-22T21:26:00+02:00",
        "encounter": {
          "identifier": {
            "system": "http://fhir.Tasmc.health.gov.il/identifier/cml-medical-record",
            "value": "0013046431"
          }
        },
        "extension": [
          {
            "url": "http://hl7.org/fhir/StructureDefinition/observation-deviceCode",
            "valueCodeableConcept": {
              "coding": [
                {
                  "code": "202",
                  "display": "דם",
                  "system": "http://fhir.tasmc.org.il/identifier/labos-device-id"
                }
              ],
              "text": "דם"
            }
          }
        ],
        "id": "LABOS.684227818-20231122212600-13",
        "identifier": [
          {
            "system": "http://fhir.tasmc.org.il/identifier/labos-request",
            "value": "684227818-20231122212600-13"
          }
        ],
        "meta": {
          "profile": [
            "http://fhir.tasmc.org.il/StructureDefinition/tasmc-observation-lab"
          ]
        },
        "note": [
          {
            "text": "Device/Room/Post Data -  Code: 202, Name:דם"
          }
        ],
        "performer": [
          {
            "display": "חמזה עלי",
            "identifier": {
              "system": "http://fhir.health.gov.il/identifier/il-national-id",
              "value": "302962451"
            },
            "type": "Practitioner"
          },
          {
            "display": "מיקרוביולוגיה",
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/tasmc-lab-unit",
              "value": "9903"
            },
            "type": "Organization"
          }
        ],
        "specimen": {
          "identifier": {
            "system": "http://fhir.tasmc.org.il/identifier/labos-specimen-id",
            "value": "684227818-20231122212600-881223776"
          },
          "reference": "urn:uuid:9e47589f-1b97-5d93-9028-345df2483cf5",
          "type": "Specimen"
        },
        "status": "preliminary",
        "subject": {
          "identifier": {
            "system": "http://fhir.tasmc.health.gov.il/identifier/nmr-pat-int-num",
            "value": "0002380186"
          },
          "type": "Patient"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:ff73af37-b9d6-5e7b-bee5-c7739d1a4fe1",
      "request": {
        "method": "PUT",
        "url": "Observation/LABOS.684227818-20231122212600-14"
      },
      "resource": {
        "resourceType": "Observation",
        "basedOn": [
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-0887040810"
            },
            "reference": "urn:uuid:60569ac0-6ff3-5946-b53c-e6343b1ca01a",
            "type": "ServiceRequest"
          }
        ],
        "category": [
          {
            "coding": [
              {
                "code": "108252007",
                "display": "Laboratory procedure",
                "system": "http://snomed.info/sct"
              }
            ]
          }
        ],
        "code": {
          "coding": [
            {
              "code": "0811638800",
              "display": "TTD",
              "system": "http://fhir.tasmc.org.il/CodeSystem/labos-request-code",
              "userSelected": true
            }
          ],
          "text": "Time to detection, microbiology"
        },
        "dataAbsentReason": {
          "coding": [
            {
              "code": "not-performed",
              "display": "Not Performed",
              "system": "http://terminology.hl7.org/CodeSystem/data-absent-reason"
            }
          ]
        },
        "effectiveDateTime": "2023-11-22T21:26:00+02:00",
        "encounter": {
          "identifier": {
            "system": "http://fhir.Tasmc.health.gov.il/identifier/cml-medical-record",
            "value": "0013046431"
          }
        },
        "extension": [
          {
            "url": "http://hl7.org/fhir/StructureDefinition/observation-deviceCode",
            "valueCodeableConcept": {
              "coding": [
                {
                  "code": "202",
                  "display": "דם",
                  "system": "http://fhir.tasmc.org.il/identifier/labos-device-id"
                }
              ],
              "text": "דם"
            }
          }
        ],
        "id": "LABOS.684227818-20231122212600-14",
        "identifier": [
          {
            "system": "http://fhir.tasmc.org.il/identifier/labos-request",
            "value": "684227818-20231122212600-14"
          }
        ],
        "meta": {
          "profile": [
            "http://fhir.tasmc.org.il/StructureDefinition/tasmc-observation-lab"
          ]
        },
        "note": [
          {
            "text": "Device/Room/Post Data -  Code: 202, Name:דם"
          }
        ],
        "performer": [
          {
            "display": "חמזה עלי",
            "identifier": {
              "system": "http://fhir.health.gov.il/identifier/il-national-id",
              "value": "302962451"
            },
            "type": "Practitioner"
          },
          {
            "display": "מיקרוביולוגיה",
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/tasmc-lab-unit",
              "value": "9903"
            },
            "type": "Organization"
          }
        ],
        "specimen": {
          "identifier": {
            "system": "http://fhir.tasmc.org.il/identifier/labos-specimen-id",
            "value": "684227818-20231122212600-881223776"
          },
          "reference": "urn:uuid:9e47589f-1b97-5d93-9028-345df2483cf5",
          "type": "Specimen"
        },
        "status": "preliminary",
        "subject": {
          "identifier": {
            "system": "http://fhir.tasmc.health.gov.il/identifier/nmr-pat-int-num",
            "value": "0002380186"
          },
          "type": "Patient"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:fbdb9e70-72e6-573e-bdf8-0b310407cd1c",
      "request": {
        "method": "PUT",
        "url": "Observation/LABOS.684227818-20231122212600-16"
      },
      "resource": {
        "resourceType": "Observation",
        "basedOn": [
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-0887040810"
            },
            "reference": "urn:uuid:60569ac0-6ff3-5946-b53c-e6343b1ca01a",
            "type": "ServiceRequest"
          }
        ],
        "category": [
          {
            "coding": [
              {
                "code": "108252007",
                "display": "Laboratory procedure",
                "system": "http://snomed.info/sct"
              }
            ]
          }
        ],
        "code": {
          "coding": [
            {
              "code": "664-3",
              "display": "Microscopic observation [Identifier] in Specimen by Gram stain",
              "system": "http://loinc.org"
            },
            {
              "code": "0887205800",
              "display": "Direct s B",
              "system": "http://fhir.tasmc.org.il/CodeSystem/labos-request-code",
              "userSelected": true
            }
          ],
          "text": "Gram stain"
        },
        "dataAbsentReason": {
          "coding": [
            {
              "code": "not-performed",
              "display": "Not Performed",
              "system": "http://terminology.hl7.org/CodeSystem/data-absent-reason"
            }
          ]
        },
        "effectiveDateTime": "2023-11-22T21:26:00+02:00",
        "encounter": {
          "identifier": {
            "system": "http://fhir.Tasmc.health.gov.il/identifier/cml-medical-record",
            "value": "0013046431"
          }
        },
        "extension": [
          {
            "url": "http://hl7.org/fhir/StructureDefinition/observation-deviceCode",
            "valueCodeableConcept": {
              "coding": [
                {
                  "code": "202",
                  "display": "דם",
                  "system": "http://fhir.tasmc.org.il/identifier/labos-device-id"
                }
              ],
              "text": "דם"
            }
          }
        ],
        "id": "LABOS.684227818-20231122212600-16",
        "identifier": [
          {
            "system": "http://fhir.tasmc.org.il/identifier/labos-request",
            "value": "684227818-20231122212600-16"
          }
        ],
        "meta": {
          "profile": [
            "http://fhir.tasmc.org.il/StructureDefinition/tasmc-observation-lab"
          ]
        },
        "note": [
          {
            "text": "Device/Room/Post Data -  Code: 202, Name:דם"
          }
        ],
        "performer": [
          {
            "display": "חמזה עלי",
            "identifier": {
              "system": "http://fhir.health.gov.il/identifier/il-national-id",
              "value": "302962451"
            },
            "type": "Practitioner"
          },
          {
            "display": "מיקרוביולוגיה",
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/tasmc-lab-unit",
              "value": "9903"
            },
            "type": "Organization"
          }
        ],
        "specimen": {
          "identifier": {
            "system": "http://fhir.tasmc.org.il/identifier/labos-specimen-id",
            "value": "684227818-20231122212600-881223776"
          },
          "reference": "urn:uuid:9e47589f-1b97-5d93-9028-345df2483cf5",
          "type": "Specimen"
        },
        "status": "preliminary",
        "subject": {
          "identifier": {
            "system": "http://fhir.tasmc.health.gov.il/identifier/nmr-pat-int-num",
            "value": "0002380186"
          },
          "type": "Patient"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:32feeeb0-7b23-56ed-a99f-18ab99dcacc2",
      "request": {
        "method": "PUT",
        "url": "DiagnosticReport/LABOS.684227818-20231122212600-lab-report"
      },
      "resource": {
        "resourceType": "DiagnosticReport",
        "basedOn": [
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-0887040810"
            },
            "reference": "urn:uuid:60569ac0-6ff3-5946-b53c-e6343b1ca01a",
            "type": "ServiceRequest"
          }
        ],
        "category": [
          {
            "coding": [
              {
                "code": "LAB",
                "display": "Laboratory",
                "system": "http://terminology.hl7.org/CodeSystem/v2-0074"
              }
            ]
          }
        ],
        "code": {
          "coding": [
            {
              "code": "4341000179107",
              "display": "Microbiology report",
              "system": "http://snomed.info/sct"
            }
          ]
        },
        "encounter": {
          "identifier": {
            "system": "http://fhir.tasmc.health.gov.il/identifier/cml-medical-record",
            "value": "0013046431"
          }
        },
        "id": "LABOS.684227818-20231122212600-lab-report",
        "identifier": [
          {
            "system": "http://fhir.tasmc.org.il/identifier/labos-report-id",
            "value": "684227818-20231122212600-lab-report"
          }
        ],
        "issued": "2023-11-23T07:43:00+02:00",
        "meta": {
          "profile": [
            "http://fhir.tasmc.org.il/StructureDefinition/tasmc-diagnostic-report-lab"
          ]
        },
        "result": [
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-0887040810-P"
            },
            "reference": "urn:uuid:68e13d93-8234-518f-8f55-1e53ac2f263c",
            "type": "Observation"
          },
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-5"
            },
            "reference": "urn:uuid:99741f65-3b52-5aec-be1a-3fd73dc3926b",
            "type": "Observation"
          },
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-6"
            },
            "reference": "urn:uuid:5d22da6c-3a50-51d9-8420-6ed8d8361b25",
            "type": "Observation"
          },
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-7"
            },
            "reference": "urn:uuid:dbad403e-52b4-5bbc-9720-001df5fb491d",
            "type": "Observation"
          },
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-8"
            },
            "reference": "urn:uuid:9513c66a-6e30-525b-9256-1a844e280f0c",
            "type": "Observation"
          },
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-11"
            },
            "reference": "urn:uuid:cdd5f3e1-a642-538a-b651-fd40ce50caa2",
            "type": "Observation"
          },
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-12"
            },
            "reference": "urn:uuid:afd585e0-b092-5a39-a72e-110ba1c210a9",
            "type": "Observation"
          },
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-13"
            },
            "reference": "urn:uuid:375c44ef-7813-50c7-88b7-68086c25a14f",
            "type": "Observation"
          },
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-14"
            },
            "reference": "urn:uuid:ff73af37-b9d6-5e7b-bee5-c7739d1a4fe1",
            "type": "Observation"
          },
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-request",
              "value": "684227818-20231122212600-16"
            },
            "reference": "urn:uuid:fbdb9e70-72e6-573e-bdf8-0b310407cd1c",
            "type": "Observation"
          }
        ],
        "specimen": [
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-specimen-id",
              "value": "684227818-20231122212600-881223777"
            },
            "reference": "urn:uuid:d471fed5-8f31-5727-91ee-bf55cb8d28c0",
            "type": "Specimen"
          },
          {
            "identifier": {
              "system": "http://fhir.tasmc.org.il/identifier/labos-specimen-id",
              "value": "684227818-20231122212600-881223776"
            },
            "reference": "urn:uuid:9e47589f-1b97-5d93-9028-345df2483cf5",
            "type": "Specimen"
          }
        ],
        "status": "preliminary",
        "subject": {
          "identifier": {
            "system": "http://fhir.tasmc.health.gov.il/identifier/nmr-pat-int-num",
            "value": "0002380186"
          },
          "type": "Patient"
        }
      }
    }
  ],
  "type": "transaction"
}
```

</div>

</div>