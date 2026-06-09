# IDSMS — Team Setup Guide

This guide helps other team members set up the project locally for development.

Prerequisites
- Node.js 18+ installed
- Git installed and authenticated with GitHub
- Access to the Supabase project (DB URL and service role key)
- (Optional) Docker if you prefer to run a local Postgres instance

Quick start

1. Clone the repository

```bash
git clone https://github.com/JayPing23/IDSMS.git
cd IDSMS
```

2. Install dependencies

```bash
npm install
```

3. Copy environment template

```bash
cp .env.example .env.local
# Fill in values: DATABASE_URL, NEXTAUTH_SECRET, GEMINI_API_KEY, RESEND_API_KEY, SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY
```

4. Enable pgvector (Supabase)

Open the Supabase SQL editor for the project and run:

```sql
CREATE EXTENSION IF NOT EXISTS vector;
```

5. Generate Prisma client


```bash
npm run prisma:generate
```

6. Start the dev server

```bash
npm run dev
```

Developer tools & tips
- To run linting: `npm run lint`
- To format code: `npm run format`
- To prepare husky hooks after `npm install`: `npx husky install`
- If you need to run migrations, use Prisma with caution and coordinate with the team: `npx prisma migrate dev` (requires DATABASE_URL pointing to a writable database).

Repository conventions
- Feature branches: `feature/<short-description>`
- Bugfix branches: `fix/<short-description>`
- Pull requests should target `develop` for staging and `main` for production.

Support
- If you get stuck, open an issue in this repo or ping the project lead.
