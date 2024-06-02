#!/bin/bash

#########
# Copied from DHH vanilla 701 and redone WELL.
# Using proper variables.
# Set up on Cloud Build script:
# * _GCLOUD_REGION
# * _PROJECT_ID (needed)
# * _REGION         (redundant)
# * _MESSAGGIO_OCCASIONALE (for fun)

set -euo pipefail

export APP_NAME='gemini-chat'
# Note the dash is in Ricc project id...
export SKAFFOLD_DEFAULT_REPO="europe-west1-docker.pkg.dev/palladius-genai/$APP_NAME/$APP_NAME"
export GIT_STATE="$(git rev-list -1 HEAD --abbrev-commit)"
export GIT_COMMIT_SHA="$(git rev-parse HEAD)" # big commit
export GIT_SHORT_SHA="${GIT_COMMIT_SHA:0:7}" # first 7 chars: Riccardo reproducing what CB does for me.
export APP_VERSION="$(cat VERSION)"

set -x

echo '2. Tagging and pushing..'
docker tag "$SKAFFOLD_DEFAULT_REPO:sha-$GIT_SHORT_SHA" "$SKAFFOLD_DEFAULT_REPO:v$APP_VERSION"
docker push "$SKAFFOLD_DEFAULT_REPO" --all-tags
