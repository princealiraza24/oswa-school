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
  school_id:    "vjgshplfxwyrzhamrrde",

  // ── PUSH NOTIFICATIONS ─────────────────────────────────────
  // These are shared across all schools (Zyveron's keys)
  vapid_public: "BKNbHEw95d4wgaP4m0njpXbPcGRrFC7Wy5aEV4s_XrwGA0gQOr0rJUcoHNLA_NwD0y-i9vUNspPWoPv6etOcj6c",

};

// DO NOT EDIT BELOW THIS LINE
if (typeof module !== 'undefined') module.exports = SCHOOL_CONFIG;
