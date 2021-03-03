#!/usr/bin/env bash

# Wrapper script for running etcd

platform=$(uname)

case $platform in
Darwin)
  BINARY=$(find . -iwholename "*etcd/etcd" | head -n1)
  ;;
Linux)
  BINARY=$(find . -iwholename "*etcd/etcd" | head -n1)
  ;;
*)
  echo "etcd doesn not have a binary for $platform"
  exit 1
  ;;
esac

${BINARY} "$@"
