#!/bin/bash
set -e

BUILD_DIR="${BUILD_DIR:-build}"

if [ -d "$BUILD_DIR" ] && [ ! -w "$BUILD_DIR/.ninja_log" ]; then
    echo "Build directory $BUILD_DIR contains files not writable by $USER; using build-local instead."
    BUILD_DIR=build-local
fi

if [ -d "$BUILD_DIR" ]; then
    sudo ninja -C "$BUILD_DIR" uninstall || true
    rm -rf "$BUILD_DIR"
fi

meson setup "$BUILD_DIR" --buildtype plain --prefix=/usr
sudo ninja -C "$BUILD_DIR" install
