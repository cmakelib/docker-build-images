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

docker push "ghcr.io/cmakelib/test_$DISTRO_NAME:$DISTRO_VERSION"