bazel bin box
===

## included tools
- bat
- direnv
- echo
- etcdctl
- etcd
- helm
- jq
- k0s
- k9s
- kubectl
- tsfmt
- upx
- yaml
- yj

## examples:
```
$ bazel run :jq
```

## import bbox in your own WORKSPACE:
```
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "bbox",
    commit = "16d0642dda469579fecf2d2e1efff544e30a60c1",
    # branch = "master",
    remote = "https://github.com/btwiuse/bbox.git",
)

load("@bbox//:package.bzl", "register_repositories")

register_repositories()
```

then

```
$ ./bazelw run @bbox//:jq
```

## dependencies:
- bash

