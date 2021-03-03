#!/usr/bin/env bash

# Wrapper script for running yaml

platform=$(uname)

case $platform in
Darwin)
  BINARY=$(find . -iwholename "*yaml_osx/file/downloaded" | head -n1)
  ;;
Linux)
  BINARY=$(find . -iwholename "*yaml/file/downloaded" | head -n1)
  ;;
*)
  echo "yaml doesn not have a binary for $platform"
  exit 1
  ;;
esac

${BINARY} "$@"
