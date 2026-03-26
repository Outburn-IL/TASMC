<div dir="rtl" markdown="1">

## דוגמה: מיקרוביולוגיה - תרבית דם שלילית

### תיאור

דוגמה זו מציגה תרחיש של בדיקת תרבית דם מיקרוביולוגית עם תוצאה שלילית (אין צמיחה חיידקית). הדוגמה ממחישה את השימוש ב-Bundle המכיל פאנל תצפיות מיקרוביולוגיות מרובות, כאשר נלקחו שתי דגימות דם נפרדות (שני בקבוקים אירוביים) באותו זמן.

### מבנה המשאבים

הדוגמה כוללת 13 משאבי FHIR:

* **Patient** - מטופל עם תעודת זהות ישראלית
* **Practitioner** - רופא מבצע הבדיקה
* **Specimen (×2)** - שתי דגימות דם ורידי שנאספו באותו זמן
* **Observation (Panel)** - פאנל מאגד המכיל את כל התצפיות המיקרוביולוגיות
* **Observation (Volume ×2)** - נפח הדגימה בכל בקבוק
* **Observation (Time to Detection ×2)** - זמן עד לגילוי (120 שעות - מלוא תקופת ההדגרה)
* **Observation (Culture Bottle ×2)** - תוצאת תרבית בבקבוק האירובי
* **Observation (Culture Blood ×2)** - תוצאת תרבית דם סופית

## דיאגרמת קשרים

![מבנה קשרי משאבים - תרבית דם](בדיקת_תרביות_שלילית.jpg)

הדיאגרמה מציגה את המבנה ההיררכי:
* פאנל מרכזי המאגד 8 תצפיות באמצעות hasMember
* כל קבוצת 4 תצפיות מתייחסת לדגימה אחת (specimen)
* הפאנל מתייחס למטופל ולרופא המבצע
* מבנה סימטרי - כל פרמטר נמדד עבור שתי הדגימות

## שימושים קליניים

דוגמה זו רלוונטית ל:
* מעבדות מיקרוביולוגיה קלינית
* בדיקות תרביות דם בחולים עם חשד לספסיס
* מערכות EMR המתממשקות עם מעבדות מיקרוביולוגיה
* מעקב אחר תוצאות תרביות לאורך זמן (120 שעות הדגרה)
* תיעוד תוצאות שלילי - חשוב לא פחות מתוצאות חיוביות

## JSON מלא

</div>

<pre dir="ltr"><code class="language-json">
{
  "resourceType": "Bundle",
  "type": "transaction",
  "entry": [
    {
      "fullUrl": "urn:uuid:patient-1",
      "resource": {
        "resourceType": "Patient",
        "id": "patient-example-002",
        "identifier": [
          {
            "system": "http://fhir.tasmc.health.gov.il/identifier/nmr-pat-int-num",
            "value": "987654321"
          }
        ],
        "name": [
          {
            "text": "פלוני אלמוני",
            "family": "אלמוני",
            "given": ["פלוני"]
          }
        ],
        "gender": "male",
        "birthDate": "1950-01-01"
      }
    },
    {
      "fullUrl": "urn:uuid:practitioner-1",
      "resource": {
        "resourceType": "Practitioner",
        "id": "practitioner-example-001",
        "identifier": [
          {
            "system": "http://fhir.health.gov.il/identifier/il-national-id",
            "value": "000000018"
          }
        ],
        "name": [
          {
            "text": "רופא-ב"
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:specimen-505",
      "resource": {
        "resourceType": "Specimen",
        "id": "SPEC-BLOOD-2847",
        "status": "available",
        "subject": {
          "reference": "urn:uuid:patient-1"
        },
        "type": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "122561005",
              "display": "Blood specimen"
            }
          ]
        },
        "collection": {
          "bodySite": {
            "text": "דם ורידי"
          },
          "collectedDateTime": "2024-01-06T22:00:00+02:00"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:specimen-504",
      "resource": {
        "resourceType": "Specimen",
        "id": "SPEC-BLOOD-1593",
        "status": "available",
        "subject": {
          "reference": "urn:uuid:patient-1"
        },
        "type": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "122561005",
              "display": "Blood specimen"
            }
          ]
        },
        "collection": {
          "bodySite": {
            "text": "דם ורידי"
          },
          "collectedDateTime": "2024-01-06T22:00:00+02:00"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:obs-parent",
      "resource": {
        "resourceType": "Observation",
        "id": "OBS-PARENT-6749",
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "17928-3"
            }
          ]
        },
        "subject": {
          "reference": "urn:uuid:patient-1"
        },
        "performer": [
          {
            "reference": "urn:uuid:practitioner-1"
          }
        ],
        "hasMember": [
          {
            "reference": "urn:uuid:obs-23"
          },
          {
            "reference": "urn:uuid:obs-24"
          },
          {
            "reference": "urn:uuid:obs-25"
          },
          {
            "reference": "urn:uuid:obs-26"
          },
          {
            "reference": "urn:uuid:obs-29"
          },
          {
            "reference": "urn:uuid:obs-30"
          },
          {
            "reference": "urn:uuid:obs-31"
          },
          {
            "reference": "urn:uuid:obs-32"
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:obs-23",
      "resource": {
        "resourceType": "Observation",
        "id": "OBS-VOL-3821",
        "status": "final",
        "code": {
          "text": "Volume measured"
        },
        "specimen": {
          "reference": "urn:uuid:specimen-505"
        },
        "valueQuantity": {
          "value": 3
        }
      }
    },
    {
      "fullUrl": "urn:uuid:obs-24",
      "resource": {
        "resourceType": "Observation",
        "id": "OBS-TTD-9045",
        "status": "final",
        "code": {
          "text": "Time to detection"
        },
        "specimen": {
          "reference": "urn:uuid:specimen-505"
        },
        "valueString": "120 Hours:0 Minutes"
      }
    },
    {
      "fullUrl": "urn:uuid:obs-25",
      "resource": {
        "resourceType": "Observation",
        "id": "OBS-CULT-BOTTLE-5102",
        "status": "final",
        "code": {
          "text": "Culture aerobic bottle"
        },
        "specimen": {
          "reference": "urn:uuid:specimen-505"
        },
        "valueString": "בסיום ההדגרה-תרבית עקרה"
      }
    },
    {
      "fullUrl": "urn:uuid:obs-26",
      "resource": {
        "resourceType": "Observation",
        "id": "OBS-CULT-BLOOD-7284",
        "status": "final",
        "code": {
          "text": "Culture - blood"
        },
        "specimen": {
          "reference": "urn:uuid:specimen-505"
        },
        "valueString": "אין צמיחה לאחר הדגרה של 48 שעות"
      }
    },
    {
      "fullUrl": "urn:uuid:obs-29",
      "resource": {
        "resourceType": "Observation",
        "id": "OBS-VOL-4567",
        "status": "final",
        "code": {
          "text": "Volume measured"
        },
        "specimen": {
          "reference": "urn:uuid:specimen-504"
        },
        "valueQuantity": {
          "value": 2
        }
      }
    },
    {
      "fullUrl": "urn:uuid:obs-30",
      "resource": {
        "resourceType": "Observation",
        "id": "OBS-TTD-8129",
        "status": "final",
        "code": {
          "text": "Time to detection"
        },
        "specimen": {
          "reference": "urn:uuid:specimen-504"
        },
        "valueString": "120 Hours:0 Minutes"
      }
    },
    {
      "fullUrl": "urn:uuid:obs-31",
      "resource": {
        "resourceType": "Observation",
        "id": "OBS-CULT-BOTTLE-6390",
        "status": "final",
        "code": {
          "text": "Culture aerobic bottle"
        },
        "specimen": {
          "reference": "urn:uuid:specimen-504"
        },
        "valueString": "בסיום ההדגרה-תרבית עקרה"
      }
    },
    {
      "fullUrl": "urn:uuid:obs-32",
      "resource": {
        "resourceType": "Observation",
        "id": "OBS-CULT-BLOOD-2916",
        "status": "final",
        "code": {
          "text": "Culture - blood"
        },
        "specimen": {
          "reference": "urn:uuid:specimen-504"
        },
        "valueString": "אין צמיחה לאחר הדגרה של 48 שעות"
      }
    }
  ]
}
</code></pre>
