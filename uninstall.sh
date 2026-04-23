#!/bin/bash
set -e

BUILD_DIR="${BUILD_DIR:-build}"

if [ ! -d "$BUILD_DIR" ] && [ -d build-local ]; then
    BUILD_DIR=build-local
fi

if [ ! -d "$BUILD_DIR" ]; then
    echo "No build directory found."
    exit 0
fi

sudo ninja -C "$BUILD_DIR" uninstall
rm -rf "$BUILD_DIR"
