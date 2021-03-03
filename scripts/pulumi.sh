#!/usr/bin/env bash

# Wrapper script for running pulumi

platform=$(uname)

case $platform in
Darwin)
  BINARY=$(find . -iwholename "*pulumi_osx/file/downloaded" -name pulumi)
  ;;
Linux)
  BINARY=$(find . -iwholename "*pulumi/file/downloaded" -name pulumi)
  ;;
*)
  echo "pulumi doesn not have a binary for $platform"
  exit 1
  ;;
esac

echo ${BINARY}
find $(dirname $BINARY)
export PATH="$PATH:$(dirname $BINARY)"

${BINARY} "$@"
