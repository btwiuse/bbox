load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

def register_repositories():
  new_git_repository(
    name = "new_k0s",
    remote = "https://github.com/btwiuse/k0s.git",
    branch = "master",
    build_file_content = """package(default_visibility = ["//visibility:public"])
  all_files = glob(["**"])
  exports_files(all_files)
  filegroup(
    name = "filegroup",
    srcs = all_files,
  )
  """,
  # workspace_file = "WORKSPACE",
  )

  http_archive(
    name = "upx",
    urls = ["https://github.com/upx/upx/releases/download/v3.96/upx-3.96-amd64_linux.tar.xz"],
    strip_prefix = "upx-3.96-amd64_linux",
    build_file_content = "exports_files(['upx'])",
  )

  http_file(
    name = "direnv",
    executable = True,
    urls = ["https://github.com/direnv/direnv/releases/download/v2.21.3/direnv.linux-amd64"],
  )

  http_file(
    name = "direnv_osx",
    executable = True,
    urls = ["https://github.com/direnv/direnv/releases/download/v2.21.3/direnv.darwin-amd64"],
  )

  http_file(
    name = "jq",
    executable = True,
    urls = ["https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64"],
  )

  http_file(
    name = "jq_osx",
    executable = True,
    urls = ["https://github.com/stedolan/jq/releases/download/jq-1.6/jq-osx-amd64"],
  )

  http_file(
    name = "yj",
    executable = True,
    urls = ["https://github.com/sclevine/yj/releases/download/v5.0.0/yj-linux"],
  )

  http_file(
    name = "yj_osx",
    executable = True,
    urls = ["https://github.com/sclevine/yj/releases/download/v5.0.0/yj-macos"],
  )

  http_file(
    name = "yaml",
    executable = True,
    urls = ["https://github.com/VojtechVitek/yaml-cli/releases/download/v0.0.5/yaml-linux64"],
  )

  http_file(
    name = "yaml_osx",
    executable = True,
    urls = ["https://github.com/VojtechVitek/yaml-cli/releases/download/v0.0.5/yaml-darwin64"],
  )

  http_file(
    name = "kubectl",
    executable = True,
    urls = ["https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl"],
  )

  http_file(
    name = "kubectl_osx",
    executable = True,
    urls = ["https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/darwin/amd64/kubectl"],
  )

  http_archive(
      name = "tsfmt",
      urls = ["https://github.com/oferb/startupos-binaries/releases/download/0.1.03/tsfmt.zip"],
      build_file_content = "exports_files(['cli-linux', 'cli-macos'])",
  )

  http_archive(
      name = "etcd",
      urls = ["https://github.com/etcd-io/etcd/releases/download/v3.4.5/etcd-v3.4.5-linux-amd64.tar.gz"],
      strip_prefix = "etcd-v3.4.5-linux-amd64",
      build_file_content = "exports_files(['etcd', 'etcdctl'])",
  )

  http_archive(
      name = "helm",
      urls = ["https://get.helm.sh/helm-v3.2.4-linux-amd64.tar.gz"],
      strip_prefix = "linux-amd64",
      build_file_content = "exports_files(['helm'])",
  )

  http_archive(
      name = "helm_osx",
      urls = ["https://get.helm.sh/helm-v3.2.4-darwin-amd64.tar.gz"],
      strip_prefix = "darwin-amd64",
      build_file_content = "exports_files(['helm'])",
  )

  http_archive(
      name = "bat",
      urls = ["https://github.com/sharkdp/bat/releases/download/v0.15.4/bat-v0.15.4-x86_64-unknown-linux-gnu.tar.gz"],
      strip_prefix = "bat-v0.15.4-x86_64-unknown-linux-gnu",
      build_file_content = "exports_files(['bat'])",
  )

  http_archive(
      name = "bat_osx",
      urls = ["https://github.com/sharkdp/bat/releases/download/v0.15.4/bat-v0.15.4-x86_64-apple-darwin.tar.gz"],
      strip_prefix = "bat-v0.15.4-x86_64-apple-darwin",
      build_file_content = "exports_files(['bat'])",
  )

  http_archive(
      name = "k9s",
      urls = ["https://github.com/derailed/k9s/releases/download/v0.21.7/k9s_Linux_x86_64.tar.gz"],
      build_file_content = "exports_files(['k9s'])",
  )

  http_archive(
      name = "k9s_osx",
      urls = ["https://github.com/derailed/k9s/releases/download/v0.21.7/k9s_Darwin_x86_64.tar.gz"],
      build_file_content = "exports_files(['k9s'])",
  )
