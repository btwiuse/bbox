#!/usr/bin/env bash

# Wrapper script for running jq

platform=$(uname)

case $platform in
Darwin)
  BINARY=$(find . -iwholename "*jq_osx/file/downloaded" | head -n1)
  ;;
Linux)
  BINARY=$(find . -iwholename "*jq/file/downloaded" | head -n1)
  ;;
*)
  echo "jq doesn not have a binary for $platform"
  exit 1
  ;;
esac

${BINARY} "$@"
