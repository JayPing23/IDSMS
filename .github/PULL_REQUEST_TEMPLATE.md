# Pull Request Checklist

Please use this checklist before requesting review. Mark items that apply.

- [ ] Title follows convention: `feat|fix|chore: short description`
- [ ] Linked issue or task: #<issue-number> (if applicable)
- [ ] Description: short summary of change and rationale
- [ ] Tests: unit/integration tests added or updated (if applicable)
- [ ] Lint: `npm run lint` passes locally
- [ ] Format: `npm run format` applied
- [ ] CI: all GitHub Actions checks pass
- [ ] Secrets/Environments:
  - [ ] Verified required repository secrets exist (`DATABASE_URL`, `NEXTAUTH_SECRET`, `GEMINI_API_KEY`, `RESEND_API_KEY`, `SUPABASE_URL`, `SUPABASE_SERVICE_ROLE_KEY`) or this change does not require them
  - [ ] If adding environment-specific secrets, add them in Settings → Secrets and variables → Actions (use Environments for production)
- [ ] Docs: `DEV_SETUP.md`, `TEAM_SETUP.md`, or `TASK_TRACK.md` updated if this PR changes setup or run steps
- [ ] Reviewers assigned and at least one approval requested

Notes:
- Use the secret-validation workflow to ensure CI will not fail on missing repo secrets.
