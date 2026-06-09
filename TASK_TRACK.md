
# Project Task Track

This file tracks high-level project phases and the detailed subtasks for easier handling. The canonical task state is the managed TODO list in the repository (use the team lead or CI bot to update it), but you can also update this file when you complete a task.

Phases & Subtasks

- **Phase 0 — Project Initialization & Environment Setup** — completed
	- Phase 0.1 — Install dependencies locally (`npm install`) — not-started
	- Phase 0.2 — Run `npx husky install` and enable hooks — not-started
	- Phase 0.3 — Copy `.env.example` → `.env.local` and fill secrets — not-started
	- Phase 0.4 — Generate Prisma client (`npm run prisma:generate`) — not-started
	- Phase 0.5 — Enable `pgvector` extension in Supabase — not-started
	- Phase 0.6 — Create initial Prisma migration (coordinate before running) — not-started
	- Phase 0.7 — Set up GitHub branch protection and required CI secrets — not-started

- **Phase 1 — Core Identity, RBAC & User Management** — not-started
	- Implement NextAuth.js v4.24.x with credential provider + JWT strategy — not-started
	- First-login password enforcement and password-change flow — not-started
	- Magic link password reset (`/auth/reset-password`, 1-hour expiry) — not-started
	- Account lockout after 5 failed attempts and MFA hooks — not-started
	- Bulk student CSV/Excel import utility — not-started
	- Middleware RBAC and service-layer ownership checks — not-started

- **Phase 2 — Pre-Deployment & Compliance Workflow** — not-started
	- Company profile autocomplete & duplicate detection — not-started
	- MOA lifecycle tracking and expiry alerts — not-started
	- 9-item pre-deployment checklist UI + faculty review actions — not-started
	- Work plan submission/approval and endorsement gating — not-started

- **Phase 3 — Active Deployment, Attendance & Unified Calendar** — not-started
	- Schedule configuration and calendar with holidays — not-started
	- Deviation reports (absence/overtime/undertime) + validation — not-started
	- Weekly report flow, client-side copy-paste warning — not-started
	- Monthly aggregation logic and submission gating — not-started
	- Hour computation service and projected completion date — not-started
	- Unified Calendar views for all roles — not-started

- **Phase 4 — AI Integration, Document Generation & Notifications** — not-started
	- Similarity detection (Gemini `text-embedding-004` + pgvector) — not-started
	- Sentiment analysis (Gemini 2.5 Flash) + caching — not-started
	- Puppeteer PDF generation + failure recovery retries — not-started
	- Resend email templates + Vercel cron notification job — not-started

- **Phase 5 — Dashboards, Archiving, UAT & Hardening** — not-started
	- Role-specific dashboards and Export Center — not-started
	- DSAR workflow and MFA for exports — not-started
	- Verify append-only RLS for `audit_logs` in Supabase — not-started
	- Retention/cleanup background job for older generated files — not-started
	- Performance testing and UAT scenarios — not-started

How to mark progress

- Preferred: Use the repository-managed TODO list (team leads or maintainers should update it via the management API). The TODO list is the single source of truth for automation and CI checks.
- Manual: Edit this file and mark the subtask as completed, then open a PR describing the change so teammates can review.

Notes

- Coordinate any destructive changes (Prisma migrations, RLS changes) before running them against shared Supabase instances.
- Keep `DEV_SETUP.md` and `TEAM_SETUP.md` in sync with this file.
- When you complete a subtask, update the managed TODO list or this file and ping the team.

