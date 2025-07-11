#!/bin/bash

set -e

build_count=0
failed_builds=()

check_directory() {
    local cwd="$(pwd)"
    local script_dir=$(dirname $(realpath "$0"))

    if ! [[ $cwd = $script_dir ]]; then
        echo "Please run script in the containing directory!" >&2
        exit 1
    fi
}

build_image() {
    local distro_dir="$1"
    local version="$2"
    local dockerfile_dir="$distro_dir/$version"
    local dockerfile_path="$distro_dir/$version/Dockerfile"

    if docker build -f "$dockerfile_path" --tag="ghcr.io/cmakelib/test_$distro_dir:$version" "$dockerfile_dir"; then
        #((build_count++))
        return 0
    else
        echo "[FAIL] Failed to build $distro_dir:$version" >&2 
        #failed_builds+=("$distro_dir:$version")
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

        echo "Processing $dockerfile_path"

        if [[ -f "$dockerfile_path" ]]; then
            build_image "$distro_dir" "$version"
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