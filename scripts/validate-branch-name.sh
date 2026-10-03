#!/usr/bin/env bash
set -euo pipefail

BRANCH="${1:-${GITHUB_HEAD_REF:-${GITHUB_REF_NAME:-$(git rev-parse --abbrev-ref HEAD)}}}"
VALID_PATTERN='^(main|develop|staging|production|feature|fix|hotfix|chore|docs|refactor|test|ci)/[A-Za-z0-9._-]+$|^(main|develop|staging|production)$'

if [[ "$BRANCH" =~ $VALID_PATTERN ]]; then
  echo "✅ Branch name '$BRANCH' is valid."
  exit 0
fi

echo "❌ Invalid branch name: '$BRANCH'."
echo "Use one of: feature/my-task, fix/login-bug, hotfix/security-patch, chore/update-deps, docs/readme, release/v1.2.3"
exit 1
