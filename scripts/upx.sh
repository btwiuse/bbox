#!/usr/bin/env bash

# Wrapper script for running upx

platform=$(uname)

case $platform in
Darwin)
  BINARY=$(find . -iwholename "*upx_osx/file/downloaded" | head -n1)
  ;;
Linux)
  BINARY=$(find . -iwholename "*upx/upx" | head -n1)
  ;;
*)
  echo "upx doesn not have a binary for $platform"
  exit 1
  ;;
esac

${BINARY} "$@"
