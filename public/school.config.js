// ═══════════════════════════════════════════════════════════
//  EDUMATRIX — SCHOOL CONFIGURATION FILE
//  Edit this file only to customize for each new school
//  Created by Zyveron Technologies, Faisalabad
// ═══════════════════════════════════════════════════════════

const SCHOOL_CONFIG = {

  // ── SCHOOL IDENTITY ────────────────────────────────────────
  name:         "OSWA SCIENCE SCHOOL",       // Full school name
  short_name:   "OSWA-SCIENCE",              // Short name for app icon
  tagline:      "School Management System", // Shown under logo
  city:         "Faisalabad",             // City name
  session:      "2026-27",               // Current academic session

  // ── CONTACT ────────────────────────────────────────────────
  phone:        "03189669178",           // School phone
  whatsapp:     "0318-9669178",           // WhatsApp number
  email:        "info@school.com",        // School email
  address:      "Faisalabad, Pakistan",   // Full address

  // ── BRANDING COLORS ────────────────────────────────────────
  // Change these to match school colors
  primary:      "#1a56db",               // Main color (buttons, sidebar)
  primary_dark: "#0f2d6e",              // Dark version (sidebar bg)
  primary_light:"#dbeafe",              // Light version (chips, badges)
  accent:       "#00d4ff",              // Accent color (highlights)

  // ── SUPABASE DATABASE ──────────────────────────────────────
  // Get from supabase.com → your project → Settings → API
  supabase_url: "https://tpkbyqsprqxhjwfzetjo.supabase.co",
  supabase_key: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwa2J5cXNwcnF4aGp3ZnpldGpvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQzMzkwNTMsImV4cCI6MjA4OTkxNTA1M30.cjoGddHvbDP2FGRyiymRWK9WKfEcLviBrV0HdFSP27A",
  school_id:    "00000000-0000-0000-0000-000000000001",

  // ── PUSH NOTIFICATIONS ─────────────────────────────────────
  // These are shared across all schools (Zyveron's keys)
  vapid_public: "BDt7dBtU0ajMBY5F-TpH5ZwSRTG8nJFhxWaCtMa2swYBeqtGb5w8HmbcZ2WMWdowvNIUQ_jQ2-36M7hctEpjJeI",

};

// DO NOT EDIT BELOW THIS LINE
if (typeof module !== 'undefined') module.exports = SCHOOL_CONFIG;
