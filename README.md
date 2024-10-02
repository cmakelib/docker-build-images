
# CMake-lib docker images for CI/CD

Build images used as a test environment for Linux builds.

Images are stored as packages in [Github Docker Packages].

Images are named as test_\<distro_name>:\<version>.
For Debian Buster the image name is test_debian:buster and URI is ghcr.io/cmakelib/test_debian:buster

To build/push new images use {build|push}_image.sh

[Github Docker Packages]: https://github.com/orgs/cmakelib/packages