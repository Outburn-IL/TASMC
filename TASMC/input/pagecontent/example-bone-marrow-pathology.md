<div dir="rtl" markdown="1">

## דוגמה: דיווח פתולוגי - בדיקת מח עצם

### תיאור

דוגמה זו מציגה תרחיש קליני מלא של בדיקת מח עצם פתולוגית במקרה של חשד ל-MDS (Myelodysplastic Syndrome). הדוגמה ממחישה את השימוש ב-Bundle מסוג transaction המכיל מכלול משאבים הנדרשים לתיעוד תוצאות בדיקת מעבדה פתולוגית מורכבת.

### מבנה המשאבים

הדוגמה כוללת 8 משאבי FHIR המקושרים זה לזה:

* **Patient** - מטופל עם תעודת זהות ישראלית
* **ServiceRequest** - הזמנת הבדיקה הפתולוגית (SUMBM - Bone Marrow Microscopy)
* **Specimen** - דגימת מח עצם שנלקחה מ-Iliac crest
* **Observation (Panel)** - פאנל המאגד את כל ממצאי הבדיקה
* **Observation (MICROSCOPIC)** - ממצאים מיקרוסקופיים מפורטים של המח העצם
* **Observation (MALIGNANT)** - קוד סיווג ממאירות (D)
* **Observation (FINAL DIAGNOSIS)** - האבחנה הסופית והערות קליניות
* **DiagnosticReport** - דיווח אבחנתי פתולוגי המרכז את כל התוצאות

## דיאגרמת קשרים

![מבנה קשרי משאבים - בדיקה פתולוגית](malignant.png)

הדיאגרמה מציגה את רשת הקשרים בין המשאבים:
* כל המשאבים מתייחסים למטופל (subject)
* התצפיות הנגזרות מקושרות לפאנל באמצעות hasMember
* הדיווח האבחנתי מתייחס לפאנל ולדגימה
* כל התצפיות מקושרות לדגימת מח העצם

## שימושים קליניים

דוגמה זו רלוונטית ל:
* מעבדות פתולוגיה והמטופתולוגיה
* מערכות EMR בבתי חולים המתממשקות עם מעבדות
* שרתי FHIR המקבלים תוצאות בדיקות מורכבות
* יישומים קליניים המציגים תוצאות פתולוגיה למטפלים

## JSON מלא

```json
{
  "resourceType": "Bundle",
  "type": "transaction",
  "entry": [
    {
      "fullUrl": "urn:uuid:patient-1",
      "resource": {
        "resourceType": "Patient",
        "id": "pat-example-001",
        "identifier": [
          {
            "system": "http://fhir.health.gov.il/identifier/il-national-id",
            "value": "000000018"
          }
        ],
        "active": true
      }
    },
    {
      "fullUrl": "urn:uuid:sr-sumbm",
      "resource": {
        "resourceType": "ServiceRequest",
        "id": "SR-SUMBM-7829",
        "meta": {
          "profile": [
            "http://fhir.tasmc.org.il/StructureDefinition/tasmc-service-request-lab"
          ]
        },
        "status": "completed",
        "intent": "order",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "10355-6",
              "display": "Microscopic observation [Identifier] in Bone marrow by Wright Giemsa stain"
            }
          ],
          "text": "SUMBM"
        },
        "subject": {
          "reference": "urn:uuid:patient-1"
        },
        "authoredOn": "2024-07-18T09:00:00+03:00"
      }
    },
    {
      "fullUrl": "urn:uuid:spec-bm",
      "resource": {
        "resourceType": "Specimen",
        "id": "SPEC-BM-4156",
        "status": "available",
        "type": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "119359002",
              "display": "Bone marrow specimen (specimen)"
            }
          ]
        },
        "subject": {
          "reference": "urn:uuid:patient-1"
        },
        "collection": {
          "bodySite": {
            "coding": [
              {
                "system": "http://snomed.info/sct",
                "code": "123037004",
                "display": "Iliac crest"
              }
            ]
          },
          "collectedDateTime": "2024-07-18T09:00:00+03:00"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:obs-sumbm-parent",
      "resource": {
        "resourceType": "Observation",
        "id": "OBS-SUMBM-3305-P",
        "meta": {
          "profile": [
            "http://fhir.tasmc.org.il/StructureDefinition/tasmc-observation-lab"
          ]
        },
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "10355-6"
            }
          ],
          "text": "SUMBM"
        },
        "subject": {
          "reference": "urn:uuid:patient-1"
        },
        "effectiveDateTime": "2024-07-18T09:00:00+03:00",
        "issued": "2024-07-21T10:00:00+03:00",
        "performer": [
          {
            "display": "רופא-א"
          },
          {
            "display": "יחידת המטופתולוגיה"
          }
        ],
        "hasMember": [
          {
            "reference": "urn:uuid:obs-micro"
          },
          {
            "reference": "urn:uuid:obs-malign"
          },
          {
            "reference": "urn:uuid:obs-final-diag"
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:obs-micro",
      "resource": {
        "resourceType": "Observation",
        "id": "OBS-MICRO-6721",
        "status": "final",
        "code": {
          "text": "MICROSCOPIC"
        },
        "subject": {
          "reference": "urn:uuid:patient-1"
        },
        "specimen": {
          "reference": "urn:uuid:spec-bm"
        },
        "valueString": "Hypercellular marrow particles are present. The M:E ratio is 3:2. Erythropoiesis is normoblastic. Myelopoiesis is orderly and proceeds to completion. An increase in blast cells is not seen. Plasma cells are normal (1%). Megakaryocytes are present in increased numbers and appear normal."
      }
    },
    {
      "fullUrl": "urn:uuid:obs-malign",
      "resource": {
        "resourceType": "Observation",
        "id": "OBS-MALIGN-9048",
        "status": "final",
        "code": {
          "text": "MALIGNANT"
        },
        "subject": {
          "reference": "urn:uuid:patient-1"
        },
        "specimen": {
          "reference": "urn:uuid:spec-bm"
        },
        "valueString": "D"
      }
    },
    {
      "fullUrl": "urn:uuid:obs-final-diag",
      "resource": {
        "resourceType": "Observation",
        "id": "OBS-FINAL-2837",
        "status": "final",
        "code": {
          "text": "FINAL DIAGNOSIS"
        },
        "subject": {
          "reference": "urn:uuid:patient-1"
        },
        "specimen": {
          "reference": "urn:uuid:spec-bm"
        },
        "valueString": "Hypercellular bone marrow with trilineage hematopoiesis. COMMENT: FACS studies show 6% blast cells. This population was not seen on the aspirate smears. Please correlate with clinical, cytogenetic, and molecular studies."
      }
    },
    {
      "fullUrl": "urn:uuid:dr-path",
      "resource": {
        "resourceType": "DiagnosticReport",
        "id": "DR-PATH-5914",
        "meta": {
          "profile": [
            "http://fhir.tasmc.org.il/StructureDefinition/tasmc-diagnostic-report-lab"
          ]
        },
        "extension": [
          {
            "url": "http://fhir.health.gov.il/StructureDefinition/ext-diagnostic-report-note",
            "valueAnnotation": {
              "text": "אבחנה קלינית: MDS"
            }
          }
        ],
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "11526-1",
              "display": "Pathology study"
            }
          ]
        },
        "subject": {
          "reference": "urn:uuid:patient-1"
        },
        "issued": "2024-07-21T10:00:00+03:00",
        "result": [
          {
            "reference": "urn:uuid:obs-sumbm-parent"
          }
        ],
        "specimen": [
          {
            "reference": "urn:uuid:spec-bm"
          }
        ]
      }
    }
  ]
}
```

</div>
