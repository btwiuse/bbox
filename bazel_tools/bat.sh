#!/usr/bin/env bash

# Wrapper script for running bat

platform=$(uname)

case $platform in
Darwin)
  BINARY=$(find . -iwholename "*bat_osx/bat" | head -n1)
  ;;
Linux)
  BINARY=$(find . -iwholename "*bat/bat" | head -n1)
  ;;
*)
  echo "bat doesn not have a binary for $platform"
  exit 1
  ;;
esac

${BINARY} "$@"
