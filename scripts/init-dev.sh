#!/usr/bin/env bash
# Initialize development environment (UNIX)
set -euo pipefail

echo "Installing dependencies..."
npm install

echo "Installing husky hooks..."
npx husky install || true

echo "Copying .env.example to .env.local (if missing)"
if [ ! -f .env.local ]; then
  cp .env.example .env.local
  echo "Please edit .env.local and fill secrets before starting the dev server."
else
  echo ".env.local already exists"
fi

echo "Ready. Run 'npm run dev' when you have set your .env.local values."
