#!/usr/bin/env bash

# Wrapper script for running kubectl

platform=$(uname)

case $platform in
Darwin)
  BINARY=$(find . -iwholename "*kubectl_osx/file/downloaded" | head -n1)
  ;;
Linux)
  BINARY=$(find . -iwholename "*kubectl/file/downloaded" | head -n1)
  ;;
*)
  echo "kubectl doesn not have a binary for $platform"
  exit 1
  ;;
esac

${BINARY} "$@"
