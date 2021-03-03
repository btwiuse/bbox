#!/usr/bin/env bash

# Wrapper script for running direnv

platform=$(uname)

case $platform in
Darwin)
  BINARY=$(find . -iwholename "*direnv_osx/file/downloaded" | head -n1)
  ;;
Linux)
  BINARY=$(find . -iwholename "*direnv/file/downloaded" | head -n1)
  ;;
*)
  echo "direnv doesn not have a binary for $platform"
  exit 1
  ;;
esac

${BINARY} "$@"
