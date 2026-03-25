-- ══════════════════════════════════════════════════════════════════════════
-- EduMatrix Complete Schema — By Zyveron Technologies, Faisalabad
-- Run this ONCE in new school's Supabase SQL Editor
-- ══════════════════════════════════════════════════════════════════════════

-- ── SCHOOLS ───────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS schools (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  address TEXT,
  phone TEXT,
  email TEXT,
  session TEXT DEFAULT '2025-26',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ── USERS ─────────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS users (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  school_id UUID REFERENCES schools(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  username TEXT NOT NULL,
  password TEXT NOT NULL,
  role TEXT NOT NULL CHECK(role IN ('admin','teacher','student','parent')),
  contact TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(school_id, username)
);

-- ── CLASSES ───────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS classes (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  school_id UUID REFERENCES schools(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  sections TEXT DEFAULT 'A',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(school_id, name)
);

-- ── STUDENTS ──────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS students (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  school_id UUID REFERENCES schools(id) ON DELETE CASCADE,
  roll_no TEXT NOT NULL,
  name TEXT NOT NULL,
  father_name TEXT,
  class TEXT NOT NULL,
  section TEXT NOT NULL,
  contact TEXT,
  parent_contact TEXT,
  dob TEXT,
  status TEXT DEFAULT 'Active',
  student_user_id UUID REFERENCES users(id) ON DELETE SET NULL,
  parent_user_id UUID REFERENCES users(id) ON DELETE SET NULL,
  callmebot_key TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  -- Roll number unique per class only (not whole school)
  UNIQUE(school_id, class, roll_no)
);

-- ── ATTENDANCE ────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS attendance (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  school_id UUID REFERENCES schools(id) ON DELETE CASCADE,
  student_id UUID REFERENCES students(id) ON DELETE CASCADE,
  date DATE NOT NULL,
  status TEXT NOT NULL CHECK(status IN ('Present','Absent','Late')),
  note TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(school_id, student_id, date)
);

-- ── FEES ──────────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS fees (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  school_id UUID REFERENCES schools(id) ON DELETE CASCADE,
  student_id UUID REFERENCES students(id) ON DELETE CASCADE,
  month TEXT NOT NULL,
  amount_due NUMERIC NOT NULL DEFAULT 0,
  amount_paid NUMERIC NOT NULL DEFAULT 0,
  paid_date DATE,
  payment_method TEXT DEFAULT 'Cash',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(school_id, student_id, month)
);

-- ── ANNOUNCEMENTS ─────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS announcements (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  school_id UUID REFERENCES schools(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  body TEXT,
  category TEXT DEFAULT 'General',
  audience TEXT DEFAULT 'Everyone',
  created_by UUID REFERENCES users(id) ON DELETE SET NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ── PAPERS ────────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS papers (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  school_id UUID REFERENCES schools(id) ON DELETE CASCADE,
  class TEXT NOT NULL,
  subject TEXT NOT NULL,
  paper_code TEXT,
  exam_date DATE,
  start_time TEXT,
  duration TEXT,
  hall TEXT,
  total_marks INTEGER DEFAULT 100,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ── RESULTS ───────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS results (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  school_id UUID REFERENCES schools(id) ON DELETE CASCADE,
  student_id UUID REFERENCES students(id) ON DELETE CASCADE,
  paper_id UUID REFERENCES papers(id) ON DELETE CASCADE,
  marks_obtained NUMERIC DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(school_id, student_id, paper_id)
);

-- ── DIARIES / HOMEWORK ────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS diaries (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  school_id UUID REFERENCES schools(id) ON DELETE CASCADE,
  class TEXT NOT NULL,
  section TEXT NOT NULL,
  subject TEXT NOT NULL,
  date DATE NOT NULL,
  homework TEXT NOT NULL,
  due_date DATE,
  note TEXT,
  created_by UUID REFERENCES users(id) ON DELETE SET NULL,
  created_by_name TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ── SMS LOGS ──────────────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS sms_logs (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  school_id UUID REFERENCES schools(id) ON DELETE CASCADE,
  recipient TEXT NOT NULL,
  message TEXT NOT NULL,
  status TEXT DEFAULT 'sent',
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ── PUSH SUBSCRIPTIONS ────────────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS push_subscriptions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  school_id UUID REFERENCES schools(id) ON DELETE CASCADE,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE UNIQUE,
  subscription TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ══════════════════════════════════════════════════════════════════════════
-- DISABLE ROW LEVEL SECURITY ON ALL TABLES
-- ══════════════════════════════════════════════════════════════════════════
ALTER TABLE schools            DISABLE ROW LEVEL SECURITY;
ALTER TABLE users              DISABLE ROW LEVEL SECURITY;
ALTER TABLE classes            DISABLE ROW LEVEL SECURITY;
ALTER TABLE students           DISABLE ROW LEVEL SECURITY;
ALTER TABLE attendance         DISABLE ROW LEVEL SECURITY;
ALTER TABLE fees               DISABLE ROW LEVEL SECURITY;
ALTER TABLE announcements      DISABLE ROW LEVEL SECURITY;
ALTER TABLE papers             DISABLE ROW LEVEL SECURITY;
ALTER TABLE results            DISABLE ROW LEVEL SECURITY;
ALTER TABLE diaries            DISABLE ROW LEVEL SECURITY;
ALTER TABLE sms_logs           DISABLE ROW LEVEL SECURITY;
ALTER TABLE push_subscriptions DISABLE ROW LEVEL SECURITY;

-- ══════════════════════════════════════════════════════════════════════════
-- SEED DATA — Default school, admin, teacher, classes
-- IMPORTANT: Copy the school ID shown after running this
-- ══════════════════════════════════════════════════════════════════════════

-- Insert school and get its ID
INSERT INTO schools (name, address, session)
VALUES ('EduMatrix School', 'Faisalabad, Pakistan', '2025-26')
RETURNING id, name;

-- ══════════════════════════════════════════════════════════════════════════
-- AFTER RUNNING ABOVE:
-- 1. Copy the school ID from results
-- 2. Replace 'SCHOOL_ID_HERE' below with that ID
-- 3. Run the rest of this script
-- ══════════════════════════════════════════════════════════════════════════

-- INSERT USERS (replace SCHOOL_ID_HERE with actual ID)
/*
INSERT INTO users (school_id, name, username, password, role)
VALUES
  ('SCHOOL_ID_HERE', 'Principal', 'admin', 'admin123', 'admin'),
  ('SCHOOL_ID_HERE', 'Teacher', 'teacher', 'teach123', 'teacher');

INSERT INTO classes (school_id, name, sections)
VALUES
  ('SCHOOL_ID_HERE', '6',  'A,B'),
  ('SCHOOL_ID_HERE', '7',  'A,B'),
  ('SCHOOL_ID_HERE', '8',  'A,B'),
  ('SCHOOL_ID_HERE', '9',  'A,B'),
  ('SCHOOL_ID_HERE', '10', 'A,B');
*/
