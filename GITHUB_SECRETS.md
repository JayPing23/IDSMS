# GitHub Secrets — Recommended Keys and Notes

This file lists the repository secrets the team should add and guidance for secure usage.

Recommended secrets (add via Settings → Secrets and variables → Actions)

- `DATABASE_URL` — PostgreSQL connection string used by Prisma migrations and server actions. For CI, prefer a readonly or migration-only URL depending on the job.
- `NEXTAUTH_SECRET` — Secure random string used by NextAuth.js for session signing.
- `GEMINI_API_KEY` — API key for Gemini embeddings and sentiment. Rotate periodically.
- `RESEND_API_KEY` — API key for Resend transactional emails.
- `SUPABASE_URL` — Supabase project URL (public), used alongside service role key in server jobs.
- `SUPABASE_SERVICE_ROLE_KEY` — Supabase service role key (high privilege). Only expose to server-side workflows and never to client builds.

Best practices

- Do NOT commit `.env` files containing secrets.
- Limit access: use GitHub Environments for `production` with required reviewers if needed.
- Use separate keys for CI/staging/production where possible.
- Rotate keys and revoke unused credentials regularly.
- Log access and keep audit of secret changes.

Using secrets in Actions

Example:

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    env:
      DATABASE_URL: ${{ secrets.DATABASE_URL }}
    steps:
      - uses: actions/checkout@v4
      - name: Install deps
        run: npm ci
```
