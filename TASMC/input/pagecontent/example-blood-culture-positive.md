<div dir="rtl" markdown="1">

### תרבית דם חיובית - קוקים גרם חיוביים

דוגמה זו מציגה תוצאות תרבית דם חיובית למטופל לאחר השתלת מח עצם אלוגנאית. הבדיקה בוצעה במסגרת מעקב אחר חום וחשד לזיהום בקטריאלי.

#### שימושים קליניים

תרביות דם הן בדיקות מכריעות לאבחון זיהומים מערכתיים (bacteremia/sepsis). במטופלים לאחר השתלת מח עצם, זיהומים בקטריאליים מהווים סיכון חיים ודורשים טיפול אנטיביוטי מיידי. במקרה זה, זוהו קוקים גרם חיוביים בשרשראות, הממצא מצביע על Streptococcus או Enterococcus species.

הדוגמה כוללת 4 בקבוקי תרבית (2 אירוביים + 2 אנאירוביים), כאשר הבקבוק האירובי הראשון הפך חיובי לאחר 6 שעות ו-24 דקות מתחילת הדגירה. התרביות האנאירוביות עדיין בתהליך.

**הערות חשובות:**
- המטופל עבר השתלת מח עצם אלוגנאית מתורם בעל אותו סוג דם
- חייב לקבל מוצרי דם מוקרנים ומפולטרים לפי סוג
- התוצאה הפנימית הכילה פרטים מזהים - **כל הנתונים עברו התממה מלאה**
- מזהה המטופל: תעודת זהות ישראלית מספר 000000018 (מזהה בדיקה)
- מזהי משאבים: מספרים אקראיים בני 4 ספרות
- חותמות זמן: עוגלו לשעות שלמות

![תרבית דם חיובית - גרף קשרים](blood_culture_positive.jpg)

#### מבנה ה-Bundle

ה-Bundle כולל:
- **Patient** - מטופל לאחר השתלת מח עצם
- **2 ServiceRequests** - הזמנות לתרבית אירובית ואנאירובית
- **4 Specimens** - 4 בקבוקי תרבית דם (2 אירוביים, 2 אנאירוביים)
- **2 Observation Panels** - פאנל אירובי (סטטוס final) ופאנל אנאירובי (סטטוס preliminary)
- **7 Child Observations** - תוצאות פרטניות (נפח, זמן לזיהוי, תוצאת תרבית, צביעת גרם)
- **1 DiagnosticReport** - דו"ח מיקרוביולוגי מסכם, סטטוס partial (כי התרביות האנאירוביות עדיין בתהליך)

הפאנל האירובי מכיל 5 תצפיות צאצא המחוברות דרך `hasMember`:
1. **Volume measured** - נפח הדגימה (9 mL)
2. **Time to detection** - זמן עד לזיהוי חיידקים (6 שעות 24 דקות)
3. **Culture aerobic bottle** - תוצאת תרבית בקבוק אירובי (חיובי)
4. **Culture - blood** - תוצאה כללית (+)
5. **Gram stain** - צביעת גרם (קוקים גרם חיוביים בשרשראות)

הפאנל האנאירובי מכיל 2 תצפיות בסטטוס preliminary:
1. **Volume measured Anaerobic** - לא ניתן למדידה
2. **Culture anaerobic bottle** - dataAbsentReason: not-performed (עדיין בדגירה)

</div>

<pre dir="ltr"><code class="language-json">
{
  "resourceType": "Bundle",
  "type": "transaction",
  "entry": [
    {
      "fullUrl": "urn:uuid:patient-4567",
      "request": {
        "method": "PUT",
        "url": "Patient/pat-example-004"
      },
      "resource": {
        "resourceType": "Patient",
        "id": "pat-example-004",
        "identifier": [
          {
            "system": "http://fhir.health.gov.il/identifier/il-national-id",
            "value": "000000018"
          }
        ],
        "name": [
          {
            "text": "מטופל לדוגמה",
            "family": "לדוגמה",
            "given": ["מטופל"]
          }
        ],
        "gender": "male",
        "birthDate": "1960-01-01"
      }
    },
    {
      "fullUrl": "urn:uuid:sr-2341",
      "request": {
        "method": "PUT",
        "url": "ServiceRequest/sr-aerobic-2341"
      },
      "resource": {
        "resourceType": "ServiceRequest",
        "id": "sr-aerobic-2341",
        "status": "active",
        "intent": "order",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "17928-3",
              "display": "Bacteria identified in Blood by Aerobe culture"
            }
          ],
          "text": "תרבית דם אירובית"
        },
        "subject": {
          "reference": "urn:uuid:patient-4567"
        },
        "authoredOn": "2024-07-05T06:00:00+03:00",
        "requester": {
          "display": "יחידת מיקרוביולוגיה",
          "type": "Organization"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:sr-2342",
      "request": {
        "method": "PUT",
        "url": "ServiceRequest/sr-anaerobic-2342"
      },
      "resource": {
        "resourceType": "ServiceRequest",
        "id": "sr-anaerobic-2342",
        "status": "active",
        "intent": "order",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "600-7",
              "display": "Bacteria identified in Blood by Anaerobe culture"
            }
          ],
          "text": "תרבית דם אנאירובית"
        },
        "subject": {
          "reference": "urn:uuid:patient-4567"
        },
        "authoredOn": "2024-07-05T06:00:00+03:00",
        "requester": {
          "display": "יחידת מיקרוביולוגיה",
          "type": "Organization"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:spec-8921",
      "request": {
        "method": "PUT",
        "url": "Specimen/spec-aerobic-1-8921"
      },
      "resource": {
        "resourceType": "Specimen",
        "id": "spec-aerobic-1-8921",
        "type": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "122555007",
              "display": "Venous blood specimen"
            }
          ],
          "text": "דם ורידי"
        },
        "subject": {
          "reference": "urn:uuid:patient-4567"
        },
        "collection": {
          "collectedDateTime": "2024-07-05T06:00:00+03:00",
          "bodySite": {
            "text": "ורידי"
          }
        },
        "container": [
          {
            "type": {
              "text": "בקבוק אירובי"
            }
          }
        ],
        "note": [
          {
            "text": "בקבוק 1 - אירובי"
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:spec-8922",
      "request": {
        "method": "PUT",
        "url": "Specimen/spec-anaerobic-1-8922"
      },
      "resource": {
        "resourceType": "Specimen",
        "id": "spec-anaerobic-1-8922",
        "type": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "122555007",
              "display": "Venous blood specimen"
            }
          ],
          "text": "דם ורידי"
        },
        "subject": {
          "reference": "urn:uuid:patient-4567"
        },
        "collection": {
          "collectedDateTime": "2024-07-05T06:00:00+03:00",
          "bodySite": {
            "text": "ורידי"
          }
        },
        "container": [
          {
            "type": {
              "text": "בקבוק אנאירובי"
            }
          }
        ],
        "note": [
          {
            "text": "בקבוק 1 - אנאירובי"
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:spec-8923",
      "request": {
        "method": "PUT",
        "url": "Specimen/spec-aerobic-2-8923"
      },
      "resource": {
        "resourceType": "Specimen",
        "id": "spec-aerobic-2-8923",
        "type": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "122555007",
              "display": "Venous blood specimen"
            }
          ],
          "text": "דם ורידי"
        },
        "subject": {
          "reference": "urn:uuid:patient-4567"
        },
        "collection": {
          "collectedDateTime": "2024-07-05T06:00:00+03:00",
          "bodySite": {
            "text": "ורידי"
          }
        },
        "container": [
          {
            "type": {
              "text": "בקבוק אירובי"
            }
          }
        ],
        "note": [
          {
            "text": "בקבוק 2 - אירובי"
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:spec-8924",
      "request": {
        "method": "PUT",
        "url": "Specimen/spec-anaerobic-2-8924"
      },
      "resource": {
        "resourceType": "Specimen",
        "id": "spec-anaerobic-2-8924",
        "type": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "122555007",
              "display": "Venous blood specimen"
            }
          ],
          "text": "דם ורידי"
        },
        "subject": {
          "reference": "urn:uuid:patient-4567"
        },
        "collection": {
          "collectedDateTime": "2024-07-05T06:00:00+03:00",
          "bodySite": {
            "text": "ורידי"
          }
        },
        "container": [
          {
            "type": {
              "text": "בקבוק אנאירובי"
            }
          }
        ],
        "note": [
          {
            "text": "בקבוק 2 - אנאירובי"
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:obs-panel-aerobic",
      "request": {
        "method": "PUT",
        "url": "Observation/panel-aerobic-3451"
      },
      "resource": {
        "resourceType": "Observation",
        "id": "panel-aerobic-3451",
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "17928-3",
              "display": "Bacteria identified in Blood by Aerobe culture"
            }
          ],
          "text": "תרבית דם אירובית"
        },
        "subject": {
          "reference": "urn:uuid:patient-4567"
        },
        "effectiveDateTime": "2024-07-05T06:00:00+03:00",
        "issued": "2024-07-05T15:00:00+03:00",
        "performer": [
          {
            "display": "רופא-ג",
            "type": "Practitioner"
          },
          {
            "display": "מעבדת מיקרוביולוגיה",
            "type": "Organization"
          }
        ],
        "hasMember": [
          {
            "reference": "urn:uuid:obs-volume-1"
          },
          {
            "reference": "urn:uuid:obs-ttd-1"
          },
          {
            "reference": "urn:uuid:obs-culture-aerobic-1"
          },
          {
            "reference": "urn:uuid:obs-blood-culture-result-1"
          },
          {
            "reference": "urn:uuid:obs-gram-stain-1"
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:obs-volume-1",
      "request": {
        "method": "PUT",
        "url": "Observation/obs-volume-1"
      },
      "resource": {
        "resourceType": "Observation",
        "id": "obs-volume-1",
        "status": "final",
        "code": {
          "text": "Volume measured"
        },
        "subject": {
          "reference": "urn:uuid:patient-4567"
        },
        "effectiveDateTime": "2024-07-05T06:00:00+03:00",
        "valueQuantity": {
          "value": 9,
          "unit": "mL"
        },
        "specimen": {
          "reference": "urn:uuid:spec-8921"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:obs-ttd-1",
      "request": {
        "method": "PUT",
        "url": "Observation/obs-ttd-1"
      },
      "resource": {
        "resourceType": "Observation",
        "id": "obs-ttd-1",
        "status": "final",
        "code": {
          "text": "Time to detection"
        },
        "subject": {
          "reference": "urn:uuid:patient-4567"
        },
        "effectiveDateTime": "2024-07-05T06:00:00+03:00",
        "valueString": "6 שעות 24 דקות",
        "specimen": {
          "reference": "urn:uuid:spec-8921"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:obs-culture-aerobic-1",
      "request": {
        "method": "PUT",
        "url": "Observation/obs-culture-aerobic-1"
      },
      "resource": {
        "resourceType": "Observation",
        "id": "obs-culture-aerobic-1",
        "status": "final",
        "code": {
          "text": "Culture aerobic bottle"
        },
        "subject": {
          "reference": "urn:uuid:patient-4567"
        },
        "effectiveDateTime": "2024-07-05T06:00:00+03:00",
        "valueString": "חיובי",
        "specimen": {
          "reference": "urn:uuid:spec-8921"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:obs-blood-culture-result-1",
      "request": {
        "method": "PUT",
        "url": "Observation/obs-blood-culture-result-1"
      },
      "resource": {
        "resourceType": "Observation",
        "id": "obs-blood-culture-result-1",
        "status": "final",
        "code": {
          "text": "Culture - blood"
        },
        "subject": {
          "reference": "urn:uuid:patient-4567"
        },
        "effectiveDateTime": "2024-07-05T06:00:00+03:00",
        "valueString": "+",
        "specimen": {
          "reference": "urn:uuid:spec-8921"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:obs-gram-stain-1",
      "request": {
        "method": "PUT",
        "url": "Observation/obs-gram-stain-1"
      },
      "resource": {
        "resourceType": "Observation",
        "id": "obs-gram-stain-1",
        "status": "final",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "664-3",
              "display": "Microscopic observation [Identifier] in Specimen by Gram stain"
            }
          ],
          "text": "צביעת גרם"
        },
        "subject": {
          "reference": "urn:uuid:patient-4567"
        },
        "effectiveDateTime": "2024-07-05T06:00:00+03:00",
        "valueString": "קוקים גרם חיוביים בשרשראות",
        "specimen": {
          "reference": "urn:uuid:spec-8921"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:obs-panel-anaerobic",
      "request": {
        "method": "PUT",
        "url": "Observation/panel-anaerobic-3452"
      },
      "resource": {
        "resourceType": "Observation",
        "id": "panel-anaerobic-3452",
        "status": "preliminary",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "600-7",
              "display": "Bacteria identified in Blood by Anaerobe culture"
            }
          ],
          "text": "תרבית דם אנאירובית"
        },
        "subject": {
          "reference": "urn:uuid:patient-4567"
        },
        "effectiveDateTime": "2024-07-05T06:00:00+03:00",
        "issued": "2024-07-05T14:00:00+03:00",
        "performer": [
          {
            "display": "רופא-ג",
            "type": "Practitioner"
          },
          {
            "display": "מעבדת מיקרוביולוגיה",
            "type": "Organization"
          }
        ],
        "hasMember": [
          {
            "reference": "urn:uuid:obs-volume-anaerobic-1"
          },
          {
            "reference": "urn:uuid:obs-culture-anaerobic-1"
          }
        ],
        "note": [
          {
            "text": "בדיקה בתהליך"
          }
        ]
      }
    },
    {
      "fullUrl": "urn:uuid:obs-volume-anaerobic-1",
      "request": {
        "method": "PUT",
        "url": "Observation/obs-volume-anaerobic-1"
      },
      "resource": {
        "resourceType": "Observation",
        "id": "obs-volume-anaerobic-1",
        "status": "final",
        "code": {
          "text": "Volume measured Anaerobic"
        },
        "subject": {
          "reference": "urn:uuid:patient-4567"
        },
        "effectiveDateTime": "2024-07-05T06:00:00+03:00",
        "valueString": "לא ניתן למדידה",
        "specimen": {
          "reference": "urn:uuid:spec-8922"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:obs-culture-anaerobic-1",
      "request": {
        "method": "PUT",
        "url": "Observation/obs-culture-anaerobic-1"
      },
      "resource": {
        "resourceType": "Observation",
        "id": "obs-culture-anaerobic-1",
        "status": "preliminary",
        "code": {
          "text": "Culture anaerobic bottle"
        },
        "subject": {
          "reference": "urn:uuid:patient-4567"
        },
        "effectiveDateTime": "2024-07-05T06:00:00+03:00",
        "dataAbsentReason": {
          "coding": [
            {
              "system": "http://terminology.hl7.org/CodeSystem/data-absent-reason",
              "code": "not-performed",
              "display": "Not Performed"
            }
          ]
        },
        "specimen": {
          "reference": "urn:uuid:spec-8922"
        }
      }
    },
    {
      "fullUrl": "urn:uuid:diag-report-6712",
      "request": {
        "method": "PUT",
        "url": "DiagnosticReport/diag-blood-culture-6712"
      },
      "resource": {
        "resourceType": "DiagnosticReport",
        "id": "diag-blood-culture-6712",
        "status": "partial",
        "code": {
          "coding": [
            {
              "system": "http://snomed.info/sct",
              "code": "4341000179107",
              "display": "Microbiology report"
            }
          ],
          "text": "דו\"ח מיקרוביולוגי - תרבית דם"
        },
        "subject": {
          "reference": "urn:uuid:patient-4567"
        },
        "issued": "2024-07-05T15:00:00+03:00",
        "basedOn": [
          {
            "reference": "urn:uuid:sr-2341"
          },
          {
            "reference": "urn:uuid:sr-2342"
          }
        ],
        "specimen": [
          {
            "reference": "urn:uuid:spec-8921"
          },
          {
            "reference": "urn:uuid:spec-8922"
          },
          {
            "reference": "urn:uuid:spec-8923"
          },
          {
            "reference": "urn:uuid:spec-8924"
          }
        ],
        "result": [
          {
            "reference": "urn:uuid:obs-panel-aerobic"
          },
          {
            "reference": "urn:uuid:obs-panel-anaerobic"
          }
        ],
        "conclusion": "תרבית דם אירובית חיובית - קוקים גרם חיוביים בשרשראות. תרבית אנאירובית בתהליך.",
        "extension": [
          {
            "url": "http://fhir.health.gov.il/StructureDefinition/ext-diagnostic-report-note",
            "valueAnnotation": {
              "text": "מושתל מח עצם אלוגנאי"
            }
          },
          {
            "url": "http://fhir.health.gov.il/StructureDefinition/ext-diagnostic-report-note",
            "valueAnnotation": {
              "text": "מתורם בעל אותו סוג דם"
            }
          },
          {
            "url": "http://fhir.health.gov.il/StructureDefinition/ext-diagnostic-report-note",
            "valueAnnotation": {
              "text": "חייב לקבל מוצרי דם מוקרנים, מפולטרים לפי סוג"
            }
          }
        ]
      }
    }
  ]
}
</code></pre>
