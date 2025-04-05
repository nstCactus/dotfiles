#!/bin/bash

set -euo pipefail

# Check if npm is installed (should be installed if Node.js is present)
if ! command -v npm >/dev/null 2>&1; then
  echo "🚨 npm is not installed. Please install Node.js and npm…"
  exit 1
fi

# Check if commitlint is installed globally using npm list
if ! npm list --global commitlint >/dev/null 2>&1; then
  echo "⚙️ commitlint not found globally. Installing commitlint…"
  npm install --global commitlint
else
  echo "✅ commitlint is already installed globally…"
fi

# Check if @nstcactus/commitlint-config is installed globally using npm list
if ! npm list --global @nstcactus/commitlint-config >/dev/null 2>&1; then
  echo "⚙️ @nstcactus/commitlint-config not found globally. Installing @nstcactus/commitlint-config…"
  npm install --global @nstcactus/commitlint-config
else
  echo "✅ @nstcactus/commitlint-config is already installed globally…"
fi

echo "🎉 commitlint installed…"
