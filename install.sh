#!/bin/bash
set -e

BUILD_DIR="${BUILD_DIR:-build}"

if [ -d "$BUILD_DIR" ] && [ ! -w "$BUILD_DIR/.ninja_log" ]; then
    echo "Build directory $BUILD_DIR contains files not writable by $USER; using build-local instead."
    echo "To clean the old directory manually, run: sudo rm -rf $BUILD_DIR"
    BUILD_DIR=build-local
fi

if [ -d "$BUILD_DIR" ]; then
    meson setup "$BUILD_DIR" --wipe --buildtype plain --prefix=/usr
else
    meson setup "$BUILD_DIR" --buildtype plain --prefix=/usr
fi

sudo ninja -C "$BUILD_DIR" install
