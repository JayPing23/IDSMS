# Branch protection setup

These are recommended branch protection rules for `main` and `develop`. Run the commands below as the repository admin (GitHub CLI `gh` must be authenticated).

Recommended rules:
- Require pull request reviews before merging (1 approval)
- Require status checks to pass (CI)
- Enforce for administrators
- Require linear history (optional)

Using `gh` (easiest)

```bash
# Protect `main`
gh api repos/:owner/:repo/branches/main/protection --input - <<'JSON'
{
  "required_status_checks": {"strict": true, "contexts": []},
  "enforce_admins": true,
  "required_pull_request_reviews": {"required_approving_review_count": 1},
  "restrictions": null
}
JSON

# Protect `develop`
gh api repos/:owner/:repo/branches/develop/protection --input - <<'JSON'
{
  "required_status_checks": {"strict": true, "contexts": []},
  "enforce_admins": false,
  "required_pull_request_reviews": {"required_approving_review_count": 1},
  "restrictions": null
}
JSON
```

PowerShell script (run from repo root)

```powershell
# Edit $owner and $repo before running
$owner = 'JayPing23'
$repo = 'IDSMS'

$bodyMain = @'
{
  "required_status_checks": {"strict": true, "contexts": []},
  "enforce_admins": true,
  "required_pull_request_reviews": {"required_approving_review_count": 1},
  "restrictions": null
}
'@

$bodyDevelop = @'
{
  "required_status_checks": {"strict": true, "contexts": []},
  "enforce_admins": false,
  "required_pull_request_reviews": {"required_approving_review_count": 1},
  "restrictions": null
}
'@

gh api repos/$owner/$repo/branches/main/protection --input - -F input=@<("$bodyMain")
gh api repos/$owner/$repo/branches/develop/protection --input - -F input=@<("$bodyDevelop")
```

Notes
- `contexts` in `required_status_checks` should list CI job names you require; leave empty to require passing checks but you'll need to configure after your CI runs at least once.
- Administrators enforcement prevents force pushes by admins; set `enforce_admins` according to team policy.
- You can also configure branch protection via the GitHub web UI under Settings → Branches.
