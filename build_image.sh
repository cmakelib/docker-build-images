#!/bin/bash

set -e

DISTRO_NAME="$1"
DISTRO_VERSION="$2"
DOCKER_FILE="${DISTRO_NAME}/${DISTRO_VERSION}/Dockerfile"

if [[ $DISTRO_NAME = "" ]] || [[ $DISTRO_VERSION = "" ]]; then
	echo ""
	echo "Usage: build_docker.sh <distro_name> <distro_version>"
	echo "\timage_name - name of the directory located inside docker directory"
	echo ""
	exit 1
fi

if ! [[ -f $DOCKER_FILE ]]; then
	echo "Docker file '$DOCKER_FILE' for '$DISTRO_NAME', version '$DISTRO_NAME' does not exist" >&2
	exit 1
fi

cwd="$(pwd)"
script_dir=$(dirname $(realpath "$0"))
echo $cwd
echo $script_dir
if ! [[ $cwd = $script_dir ]]; then
	echo "Please run script in the caintaining directory!" >&2
	exit 1
fi

docker build -f $DOCKER_FILE --tag="ghcr.io/cmakelib/test_$DISTRO_NAME:$DISTRO_VERSION" .