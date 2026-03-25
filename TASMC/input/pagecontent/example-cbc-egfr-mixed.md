<div dir="rtl" markdown="1">

## דוגמה: ספירת דם ותפקודי כליה - פאנל ועצמאיות

### תיאור

דוגמה זו מציגה תרחיש נפוץ בו הזמנה מעבדתית אחת כוללת **גם בדיקות בפאנל וגם בדיקות עצמאיות**. המקרה כולל פאנל CBC (ספירת דם) עם שתי בדיקות (WBC ו-PLT), לצד בדיקת eGFR עצמאית לבדיקת תפקוד כליות. זהו דוגמה קלאסית למבנה מעורב (mixed scenario) המשקף את המציאות הקלינית בה לא כל הבדיקות מאורגנות בפאנלים.

### מבנה המשאבים

הדוגמה כוללת 9 משאבי FHIR:

* **Patient** - מטופל עם תעודת זהות ישראלית
* **ServiceRequest (×2)** - שתי הזמנות נפרדות: CBC ו-eGFR
* **Specimen (×2)** - שתי דגימות בצינורות שונים (סגול ל-CBC, אפור ל-eGFR)
* **Observation (CBC Panel)** - פאנל המאגד את בדיקות ספירת הדם
* **Observation (WBC)** - ספירת תאי דם לבנים (חלק מהפאנל)
* **Observation (PLT)** - ספירת טסיות (חלק מהפאנל, עם פרשנות Low)
* **Observation (eGFR)** - קצב סינון גלומרולרי משוער (בדיקה עצמאית, לא חלק מפאנל)

## דיאגרמת קשרים

![מבנה קשרי משאבים - פאנל ועצמאיות](ספירת_דם_ותפקודי_כליה.jpg)

הדיאגרמה מדגימה את ההבדל בין:
* **מבנה פאנל**: ServiceRequest → Observation (Panel) → hasMember → Observations (WBC, PLT)
* **מבנה עצמאי**: ServiceRequest → Observation (eGFR) ישירות, ללא פאנל
* שימוש ב-basedOn לקישור בין תצפיות להזמנות
* דגימות נפרדות לכל סוג בדיקה (specimen references)

## שימושים קליניים

דוגמה זו רלוונטית ל:
* מעבדות כימיה והמטולוגיה קלינית
* הזמנות מעבדה משולבות בבתי חולים וקופות חולים
* מערכות EMR המציגות תוצאות מעבדה - חשוב להבחין בין פאנלים לבדיקות עצמאיות
* אינטגרציה עם מערכות הזמנות (CPOE)
* דוחות מעבדה המציגים קיבוץ לוגי של בדיקות לצד בדיקות בודדות

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
        "id": "pat-example-003",
        "identifier": [
          {
            "system": "http://fhir.health.gov.il/identifier/il-national-id",
            "value": "000000018"
          }
        ],
        "name": [
          {
            "text": "דוגמא ישראלי"
          }
        ],
        "gender": "male"
      }
    },
    {
      "fullUrl": "urn:uuid:sr-egfr",
      "resource": {
        "resourceType": "ServiceRequest",
        "id": "SR-eGFR-4821",
        "status": "completed",
        "intent": "order",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "69405-9",
              "display": "eGFR"
            }
          ],
          "text": "eGFR"
        },
        "subject": {
          "reference": "urn:uuid:patient-1"
        },
        "authoredOn": "2024-02-05T15:00:00+02:00"
      }
    },
    {
      "fullUrl": "urn:uuid:sr-cbc",
      "resource": {
        "resourceType": "ServiceRequest",
        "id": "SR-CBC-7359",
        "status": "completed",
        "intent": "order",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "57021-8",
              "display": "CBC panel"
            }
          ],
          "text": "CBC"
        },
        "subject": {
          "reference": "urn:uuid:patient-1"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:spec-lavender",
      "resource": {
        "resourceType": "Specimen",
        "id": "SPEC-CBC-2946",
        "subject": {
          "reference": "urn:uuid:patient-1"
        },
        "container": [
          {
            "type": {
              "text": "סגול"
            }
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:spec-gray",
      "resource": {
        "resourceType": "Specimen",
        "id": "SPEC-EGFR-1507",
        "subject": {
          "reference": "urn:uuid:patient-1"
        },
        "container": [
          {
            "type": {
              "text": "אפור"
            }
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:obs-cbc-parent",
      "resource": {
        "resourceType": "Observation",
        "id": "OBS-CBC-GROUP-8264",
        "status": "final",
        "code": {
          "text": "CBC Panel"
        },
        "subject": {
          "reference": "urn:uuid:patient-1"
        },
        "basedOn": [
          {
            "reference": "urn:uuid:sr-cbc"
          }
        ],
        "hasMember": [
          {
            "reference": "urn:uuid:obs-wbc"
          },
          {
            "reference": "urn:uuid:obs-plt"
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:obs-wbc",
      "resource": {
        "resourceType": "Observation",
        "id": "OBS-WBC-3152",
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "6690-2"
            }
          ],
          "text": "WBC"
        },
        "subject": {
          "reference": "urn:uuid:patient-1"
        },
        "basedOn": [
          {
            "reference": "urn:uuid:sr-cbc"
          }
        ],
        "specimen": {
          "reference": "urn:uuid:spec-lavender"
        },
        "valueQuantity": {
          "value": 5.8,
          "unit": "10e3/µL"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:obs-plt",
      "resource": {
        "resourceType": "Observation",
        "id": "OBS-PLT-6890",
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "777-3"
            }
          ],
          "text": "PLT"
        },
        "subject": {
          "reference": "urn:uuid:patient-1"
        },
        "basedOn": [
          {
            "reference": "urn:uuid:sr-cbc"
          }
        ],
        "specimen": {
          "reference": "urn:uuid:spec-lavender"
        },
        "valueQuantity": {
          "value": 135,
          "unit": "10e3/µL"
        },
        "interpretation": [
          {
            "coding": [
              {
                "system": "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation",
                "code": "L"
              }
            ]
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:obs-egfr",
      "resource": {
        "resourceType": "Observation",
        "id": "OBS-EGFR-4725",
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "69405-9"
            }
          ],
          "text": "eGFR"
        },
        "subject": {
          "reference": "urn:uuid:patient-1"
        },
        "basedOn": [
          {
            "reference": "urn:uuid:sr-egfr"
          }
        ],
        "specimen": {
          "reference": "urn:uuid:spec-gray"
        },
        "note": [
          {
            "text": "הנוסחה משמשת לקביעת התפקוד הכלייתי במצב יציב בלבד"
          }
        ]
      }
    }
  ]
}
```

</div>
