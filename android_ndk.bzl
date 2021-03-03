def _android_ndk_impl(ctx):

    ctx.file("README.md", '# Hello, Android!')

    is_host_ndk = "ANDROID_NDK_HOME" in ctx.os.environ

    is_bazel_ndk = "ANDROID_NDK_BAZEL" in ctx.os.environ

    path_ndk = ctx.os.environ["ANDROID_NDK_HOME"] if is_host_ndk else ctx.path(".").realpath

    print('ANDROID_NDK_HOME =', path_ndk)
    print('ANDROID_NDK_BAZEL =', is_bazel_ndk)
    print('OS =', ctx.os.name)

    if not is_host_ndk:
    #   if is_bazel_ndk:
        if True:
            print('downloading android ndk for', ctx.os.name)
            if ctx.os.name == "mac os x":
                ctx.download_and_extract(
                    "https://dl.google.com/android/repository/android-ndk-r22-darwin-x86_64.zip",
                    stripPrefix = "android-ndk-r22",
                    sha256 = "14fce4dea7fb3facbc0e3d20270007bffec3ba383aec02e8b0e0dad8d8782892"
                )
            if ctx.os.name == "linux":
                ctx.download_and_extract(
                    "https://dl.google.com/android/repository/android-ndk-r22-linux-x86_64.zip",
                    stripPrefix = "android-ndk-r22",
                    sha256 = "d37fc69cd81e5660234a686e20adef39bc0244086e4d66525a40af771c020718"
                )
    content1 = """
ANDROID_NDK_HOME = "{}"

def print_android_ndk_home():
    print(ANDROID_NDK_HOME)
"""

    content2 = """
ANDROID_NDK_HOME = "{}"
exports_files(["ANDROID_NDK_HOME"])
"""

    content3 = "{}\n"

    ctx.file("android_ndk.bzl.template", content1.format(path_ndk))
    ctx.file("BUILD.bazel.template", content2.format(path_ndk))
    ctx.file("ANDROID_NDK_HOME", content3.format(path_ndk))
    ctx.template(
        "android_ndk.bzl",
        "android_ndk.bzl.template",
        substitutions = {},
        executable = False,
    )
    ctx.template(
        "BUILD.bazel",
        "BUILD.bazel.template",
        substitutions = {},
        executable = False,
    )

android_ndk = repository_rule(
    implementation = _android_ndk_impl,
    environ = [
        "ANDROID_NDK_HOME",
        "ANDROID_NDK_BAZEL"
    ],
)
