#!/usr/bin/env bash

# Wrapper script for running helm

platform=$(uname)

case $platform in
Darwin)
  BINARY=$(find . -iwholename "*helm_osx/helm" | head -n1)
  ;;
Linux)
  BINARY=$(find . -iwholename "*helm/helm" | head -n1)
  ;;
*)
  echo "helm doesn not have a binary for $platform"
  exit 1
  ;;
esac

${BINARY} "$@"
