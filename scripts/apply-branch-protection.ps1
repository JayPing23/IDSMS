param(
  [string]$owner = 'JayPing23',
  [string]$repo = 'IDSMS'
)

Write-Host "Applying branch protection for $owner/$repo"

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

gh api repos/$owner/$repo/branches/main/protection --raw-field input="$bodyMain"
gh api repos/$owner/$repo/branches/develop/protection --raw-field input="$bodyDevelop"

Write-Host "Done."
