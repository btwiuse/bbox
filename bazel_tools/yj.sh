#!/usr/bin/env bash

# Wrapper script for running yj

platform=$(uname)

case $platform in
Darwin)
  BINARY=$(find . -iwholename "*yj_osx/file/downloaded" | head -n1)
  ;;
Linux)
  BINARY=$(find . -iwholename "*yj/file/downloaded" | head -n1)
  ;;
*)
  echo "yj doesn not have a binary for $platform"
  exit 1
  ;;
esac

${BINARY} "$@"
