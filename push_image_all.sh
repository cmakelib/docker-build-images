#!/bin/bash

set -e

check_directory() {
    local cwd="$(pwd)"
    local script_dir=$(dirname $(realpath "$0"))

    if ! [[ $cwd = $script_dir ]]; then
        echo "Please run script in the containing directory!" >&2
        exit 1
    fi
}

push_image() {
    local distro_dir="$1"
    local version="$2"
    local image_tag="ghcr.io/cmakelib/test_$distro_dir:$version"

    if docker push "$image_tag"; then
        return 0
    else
        echo "[FAIL] Failed to push $distro_dir:$version" >&2
        return 1
    fi
}

process_distro() {
    local distro_dir="$1"

    if ! [[ -d "$distro_dir" ]]; then
        return
    fi

    for version_dir in "$distro_dir"/*; do
        if ! [[ -d "$version_dir" ]]; then
            continue
        fi

        local version=$(basename "$version_dir")
        local dockerfile_path="$version_dir/Dockerfile"

        if [[ -f "$dockerfile_path" ]]; then
            push_image "$distro_dir" "$version"
        fi
    done
}

main() {
    check_directory

    for distro in debian fedora ubuntu; do
        process_distro "$distro"
    done
}

main "$@"