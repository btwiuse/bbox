#!/usr/bin/env bash

# Wrapper script for running etcdctl

platform=$(uname)

case $platform in
Darwin)
  BINARY=$(find . -iwholename "*etcd/etcdctl" | head -n1)
  ;;
Linux)
  BINARY=$(find . -iwholename "*etcd/etcdctl" | head -n1)
  ;;
*)
  echo "etcdctl doesn not have a binary for $platform"
  exit 1
  ;;
esac

${BINARY} "$@"
