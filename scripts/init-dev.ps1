Write-Host "Initializing development environment"

Write-Host "Installing dependencies..."
npm install

Write-Host "Installing husky hooks..."
npx husky install -ErrorAction SilentlyContinue

if (-Not (Test-Path -Path .env.local)) {
  Copy-Item -Path .env.example -Destination .env.local
  Write-Host "Created .env.local from .env.example — edit it to add secrets."
} else {
  Write-Host ".env.local already exists"
}

Write-Host "Initialization complete. Run 'npm run dev' after filling .env.local."

