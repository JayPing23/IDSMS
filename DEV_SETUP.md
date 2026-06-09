# Phase 0 — Development setup

This file summarizes the Phase 0 scaffolding added to the repository.

Files added:
- .gitignore
- package.json
- .env.example
- prisma/schema.prisma
- .github/workflows/ci.yml
- .eslintrc.json
- .prettierrc
- .husky/pre-commit

Next steps to finish Phase 0 locally:

1. Install dependencies:

```bash
npm install
```

2. Install dev tools (example):

```bash
npm install -D eslint @typescript-eslint/parser @typescript-eslint/eslint-plugin prettier husky prisma
npx husky install
```

3. Enable pgvector extension in Supabase SQL console:

```sql
CREATE EXTENSION IF NOT EXISTS vector;
```

4. Copy `.env.example` → `.env.local` and fill secrets.

5. Enable pgvector extension in Supabase SQL console:

```sql
CREATE EXTENSION IF NOT EXISTS vector;
```

GitHub Secrets

Add the following repository secrets for CI and deployments (Settings → Secrets and variables → Actions):

- `DATABASE_URL`
- `NEXTAUTH_SECRET`
- `GEMINI_API_KEY`
- `RESEND_API_KEY`
- `SUPABASE_URL`
- `SUPABASE_SERVICE_ROLE_KEY`

Use these secrets in your GitHub Actions workflows via `${{ secrets.NAME }}`. Keep the service role key restricted and never expose it client-side.

