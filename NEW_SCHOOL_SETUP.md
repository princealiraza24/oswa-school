# 🏫 EduMatrix — New School Setup Guide
## By Zyveron Technologies, Faisalabad

---

## ⏱ Total Setup Time: 15 Minutes

---

## STEP 1 — Edit `school.config.js` (2 minutes)

Open `school.config.js` and change:

```js
name:         "AL-NOOR PUBLIC SCHOOL",
short_name:   "Al-Noor",
tagline:      "Excellence in Education",
city:         "Faisalabad",
session:      "2025-26",
phone:        "0300-1234567",
email:        "info@alnoor.edu.pk",
```

For colors, choose a theme:

| Theme     | primary    | primary_dark | accent   |
|-----------|------------|--------------|----------|
| Blue      | #1a56db    | #0f2d6e      | #00d4ff  |
| Green     | #166534    | #052e16      | #4ade80  |
| Red       | #991b1b    | #450a0a      | #f87171  |
| Purple    | #5b21b6    | #2e1065      | #c084fc  |
| Teal      | #0f766e    | #042f2e      | #2dd4bf  |

---

## STEP 2 — Create New Supabase Database (5 minutes)

1. Go to supabase.com → New Project
2. Name: school-name (e.g. alnoor-school)
3. Region: South Asia (Mumbai)
4. Copy the Project URL and Anon Key
5. Paste into `school.config.js`
6. Go to SQL Editor → paste `supabase_schema.sql` → Run

---

## STEP 3 — Deploy to Vercel (5 minutes)

1. Push code to GitHub (new repo or same repo new branch)
2. Go to vercel.com → New Project → Import
3. Add Environment Variables:
   - SUPABASE_URL = (from config)
   - SUPABASE_ANON_KEY = (from config)
   - VAPID_PUBLIC_KEY = (from config)
   - VAPID_PRIVATE_KEY = rENa_MqBxGDBBI3C2affiw1fDgBZFX-bCT_OxYICB8U
4. Deploy!

---

## STEP 4 — First Login & Setup (3 minutes)

1. Open your new school URL
2. Login: admin / admin123
3. Go to Classes → Add your classes
4. Go to Users → Change admin password
5. Share URL with teachers

---

## MONTHLY BILLING REMINDER

| School | URL | Monthly Fee | Payment Date |
|--------|-----|-------------|--------------|
| School 1 | url1.vercel.app | Rs 2,500 | 1st of month |
| School 2 | url2.vercel.app | Rs 2,500 | 1st of month |

---

## SUPPORT

WhatsApp: 0300-XXXXXXX
Email: support@zyveron.pk
Location: Faisalabad, Pakistan

*Zyveron Technologies — Building Pakistan's School Future*
