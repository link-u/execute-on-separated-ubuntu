#!/bin/sh -eu

echo "::group::Build container"
docker build -f "/Dockerfile-${INPUT_ON}" -t builder .
echo "::endgroup::"
docker run --rm \
  --volume="$RUNNER_WORKSPACE/$(basename $GITHUB_REPOSITORY)":"${GITHUB_WORKSPACE}" \
  --workdir="${GITHUB_WORKSPACE}" \
  builder \
  "${INPUT_SCRIPT}"
