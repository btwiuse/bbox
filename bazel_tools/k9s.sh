#!/usr/bin/env bash

# Wrapper script for running k9s

platform=$(uname)

case $platform in
Darwin)
  BINARY=$(find . -iwholename "*k9s_osx/k9s" | head -n1)
  ;;
Linux)
  BINARY=$(find . -iwholename "*k9s/k9s" | head -n1)
  ;;
*)
  echo "k9s doesn not have a binary for $platform"
  exit 1
  ;;
esac

${BINARY} "$@"
