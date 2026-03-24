@echo off
cd /d %~dp0
title EduMatrix — New School Setup by Zyveron Technologies
color 0A
cls

echo ================================================
echo   EduMatrix School Setup — Zyveron Technologies
echo ================================================
echo.

:: ── STEP 1: Get school details ────────────────────────────────────────────
echo STEP 1: Enter School Details
echo ─────────────────────────────
set /p SCHOOL_NAME="School Full Name (e.g. Al-Noor Public School): "
set /p SCHOOL_SHORT="Short Name (e.g. AlNoor): "
set /p SCHOOL_CITY="City (e.g. Faisalabad): "
set /p SCHOOL_PHONE="Phone Number (e.g. 0300-1234567): "
set /p SCHOOL_SESSION="Session (e.g. 2025-26): "

echo.
echo STEP 2: Enter Supabase Details
echo ─────────────────────────────────────────────────────────────────
echo  Go to: supabase.com ^> Your Project ^> Settings ^> API
echo ─────────────────────────────────────────────────────────────────
set /p SUPA_URL="Supabase Project URL: "
set /p SUPA_KEY="Supabase Anon Key: "

echo.
echo STEP 3: Choose Theme Color
echo ───────────────────────────
echo  1. Blue   (default)
echo  2. Green
echo  3. Red
echo  4. Purple
echo  5. Teal
echo.
set /p COLOR_CHOICE="Enter number (1-5): "

if "%COLOR_CHOICE%"=="1" (
  set PRIMARY=#1a56db
  set PRIMARY_DARK=#0f2d6e
  set PRIMARY_LIGHT=#dbeafe
  set ACCENT=#00d4ff
)
if "%COLOR_CHOICE%"=="2" (
  set PRIMARY=#166534
  set PRIMARY_DARK=#052e16
  set PRIMARY_LIGHT=#dcfce7
  set ACCENT=#4ade80
)
if "%COLOR_CHOICE%"=="3" (
  set PRIMARY=#991b1b
  set PRIMARY_DARK=#450a0a
  set PRIMARY_LIGHT=#fee2e2
  set ACCENT=#f87171
)
if "%COLOR_CHOICE%"=="4" (
  set PRIMARY=#5b21b6
  set PRIMARY_DARK=#2e1065
  set PRIMARY_LIGHT=#ede9fe
  set ACCENT=#c084fc
)
if "%COLOR_CHOICE%"=="5" (
  set PRIMARY=#0f766e
  set PRIMARY_DARK=#042f2e
  set PRIMARY_LIGHT=#ccfbf1
  set ACCENT=#2dd4bf
)

:: Default to blue if invalid choice
if not defined PRIMARY (
  set PRIMARY=#1a56db
  set PRIMARY_DARK=#0f2d6e
  set PRIMARY_LIGHT=#dbeafe
  set ACCENT=#00d4ff
)

echo.
echo ─────────────────────────────────────────────
echo  Generating files for: %SCHOOL_NAME%
echo ─────────────────────────────────────────────

:: ── Create output folder ─────────────────────────────────────────────────
set FOLDER=deploy_%SCHOOL_SHORT%
if exist "%FOLDER%" rmdir /s /q "%FOLDER%"
xcopy /E /I /Q . "%FOLDER%" > nul 2>&1

:: ── Write school.config.js ────────────────────────────────────────────────
echo const SCHOOL_CONFIG = { > "%FOLDER%\school.config.js"
echo   name:         "%SCHOOL_NAME%", >> "%FOLDER%\school.config.js"
echo   short_name:   "%SCHOOL_SHORT%", >> "%FOLDER%\school.config.js"
echo   tagline:      "School Management System", >> "%FOLDER%\school.config.js"
echo   city:         "%SCHOOL_CITY%", >> "%FOLDER%\school.config.js"
echo   session:      "%SCHOOL_SESSION%", >> "%FOLDER%\school.config.js"
echo   phone:        "%SCHOOL_PHONE%", >> "%FOLDER%\school.config.js"
echo   primary:      "%PRIMARY%", >> "%FOLDER%\school.config.js"
echo   primary_dark: "%PRIMARY_DARK%", >> "%FOLDER%\school.config.js"
echo   primary_light:"%PRIMARY_LIGHT%", >> "%FOLDER%\school.config.js"
echo   accent:       "%ACCENT%", >> "%FOLDER%\school.config.js"
echo   supabase_url: "%SUPA_URL%", >> "%FOLDER%\school.config.js"
echo   supabase_key: "%SUPA_KEY%", >> "%FOLDER%\school.config.js"
echo   school_id:    "00000000-0000-0000-0000-000000000001", >> "%FOLDER%\school.config.js"
echo   vapid_public: "BKNbHEw95d4wgaP4m0njpXbPcGRrFC7Wy5aEV4s_XrwGA0gQOr0rJUcoHNLA_NwD0y-i9vUNspPWoPv6etOcj6c", >> "%FOLDER%\school.config.js"
echo }; >> "%FOLDER%\school.config.js"
echo if (typeof module !== 'undefined') module.exports = SCHOOL_CONFIG; >> "%FOLDER%\school.config.js"

:: ── Write .env for Vercel ─────────────────────────────────────────────────
echo SUPABASE_URL=%SUPA_URL% > "%FOLDER%\api\.env"
echo SUPABASE_ANON_KEY=%SUPA_KEY% >> "%FOLDER%\api\.env"
echo VAPID_PUBLIC_KEY=BKNbHEw95d4wgaP4m0njpXbPcGRrFC7Wy5aEV4s_XrwGA0gQOr0rJUcoHNLA_NwD0y-i9vUNspPWoPv6etOcj6c >> "%FOLDER%\api\.env"
echo VAPID_PRIVATE_KEY=rENa_MqBxGDBBI3C2affiw1fDgBZFX-bCT_OxYICB8U >> "%FOLDER%\api\.env"

:: ── Write VERCEL_ENV.txt for easy copy-paste ─────────────────────────────
echo ================================================ > "%FOLDER%\VERCEL_ENV.txt"
echo   VERCEL ENVIRONMENT VARIABLES >> "%FOLDER%\VERCEL_ENV.txt"
echo   Copy these into Vercel dashboard >> "%FOLDER%\VERCEL_ENV.txt"
echo ================================================ >> "%FOLDER%\VERCEL_ENV.txt"
echo. >> "%FOLDER%\VERCEL_ENV.txt"
echo SUPABASE_URL = %SUPA_URL% >> "%FOLDER%\VERCEL_ENV.txt"
echo SUPABASE_ANON_KEY = %SUPA_KEY% >> "%FOLDER%\VERCEL_ENV.txt"
echo VAPID_PUBLIC_KEY = BKNbHEw95d4wgaP4m0njpXbPcGRrFC7Wy5aEV4s_XrwGA0gQOr0rJUcoHNLA_NwD0y-i9vUNspPWoPv6etOcj6c >> "%FOLDER%\VERCEL_ENV.txt"
echo VAPID_PRIVATE_KEY = rENa_MqBxGDBBI3C2affiw1fDgBZFX-bCT_OxYICB8U >> "%FOLDER%\VERCEL_ENV.txt"

:: ── Write SCHOOL_INFO.txt summary ────────────────────────────────────────
echo ================================================ > "%FOLDER%\SCHOOL_INFO.txt"
echo   %SCHOOL_NAME% >> "%FOLDER%\SCHOOL_INFO.txt"
echo   Setup by Zyveron Technologies >> "%FOLDER%\SCHOOL_INFO.txt"
echo ================================================ >> "%FOLDER%\SCHOOL_INFO.txt"
echo. >> "%FOLDER%\SCHOOL_INFO.txt"
echo School Name : %SCHOOL_NAME% >> "%FOLDER%\SCHOOL_INFO.txt"
echo Short Name  : %SCHOOL_SHORT% >> "%FOLDER%\SCHOOL_INFO.txt"
echo City        : %SCHOOL_CITY% >> "%FOLDER%\SCHOOL_INFO.txt"
echo Phone       : %SCHOOL_PHONE% >> "%FOLDER%\SCHOOL_INFO.txt"
echo Session     : %SCHOOL_SESSION% >> "%FOLDER%\SCHOOL_INFO.txt"
echo Theme       : Color option %COLOR_CHOICE% >> "%FOLDER%\SCHOOL_INFO.txt"
echo Supabase    : %SUPA_URL% >> "%FOLDER%\SCHOOL_INFO.txt"
echo. >> "%FOLDER%\SCHOOL_INFO.txt"
echo DEFAULT LOGINS: >> "%FOLDER%\SCHOOL_INFO.txt"
echo Admin    : admin / admin123 >> "%FOLDER%\SCHOOL_INFO.txt"
echo Teacher  : teacher / teach123 >> "%FOLDER%\SCHOOL_INFO.txt"
echo. >> "%FOLDER%\SCHOOL_INFO.txt"
echo NEXT STEPS: >> "%FOLDER%\SCHOOL_INFO.txt"
echo 1. Upload this folder to GitHub >> "%FOLDER%\SCHOOL_INFO.txt"
echo 2. Import to Vercel >> "%FOLDER%\SCHOOL_INFO.txt"
echo 3. Add env variables from VERCEL_ENV.txt >> "%FOLDER%\SCHOOL_INFO.txt"
echo 4. Run supabase_schema.sql in Supabase >> "%FOLDER%\SCHOOL_INFO.txt"
echo 5. Done! >> "%FOLDER%\SCHOOL_INFO.txt"

:: ── Done! ─────────────────────────────────────────────────────────────────
cls
echo.
echo ================================================
echo   SUCCESS! Files ready for %SCHOOL_NAME%
echo ================================================
echo.
echo   Folder created: %FOLDER%
echo.
echo   Files inside:
echo   ✓ school.config.js    (school branding)
echo   ✓ VERCEL_ENV.txt      (copy to Vercel)
echo   ✓ SCHOOL_INFO.txt     (school summary)
echo   ✓ supabase_schema.sql (run in Supabase)
echo   ✓ All app files ready to upload
echo.
echo ════════════════════════════════════════════════
echo   NEXT STEPS:
echo   1. Open folder: %FOLDER%
echo   2. Upload all files to GitHub
echo   3. Import to Vercel
echo   4. Add env from VERCEL_ENV.txt
echo   5. Run SQL in Supabase
echo   6. School is LIVE!
echo ════════════════════════════════════════════════
echo.
echo   Support: Zyveron Technologies, Faisalabad
echo.
pause
