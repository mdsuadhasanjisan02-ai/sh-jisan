# SH Jisan — Student Dashboard

A responsive student productivity dashboard built with React + TypeScript, Vite, Tailwind CSS, Lucide React, Recharts and optional Supabase. By default it runs in **Demo Mode** and saves your data in browser `localStorage`.

## Run locally
1. Install Node.js 20+.
2. Extract this folder and open a terminal inside it.
3. Run `npm install`
4. Run `npm run dev`
5. Open the local address Vite prints.

## Demo mode
If `VITE_SUPABASE_URL` or `VITE_SUPABASE_ANON_KEY` is missing, the app uses localStorage. It includes tasks, syllabus, focus timer sessions, classes, notes, assignments, settings, calendar items and file metadata. Local demo data is stored only in that browser profile. Files themselves are selected and previewed/downloaded in-browser; large file blobs are not copied into localStorage.

## Connect Supabase
1. Create a Supabase project.
2. Copy `.env.example` to `.env` and set your project URL and anon key.
3. In Supabase SQL Editor, run `supabase/schema.sql`.
4. Enable Email authentication in Supabase Auth settings.
5. Restart `npm run dev`.

The starter wires Supabase email/password sign-in and cloud Storage uploads when credentials are configured. The SQL schema enables row-level security for user-owned records. Review the policies and test them in your own project before production deployment. Do not put a service-role key in frontend environment variables.

## Build
`npm run build`

## Notes
- Browser localStorage is not a secure multi-device database. Use Supabase for authenticated cloud sync.
- The starter is designed to be extensible; use real production auth, storage limits, file validation, backups, and accessibility/security testing before public launch.
