#!/bin/bash

if ! command -v cross &> /dev/null; then
    cargo install cross --git https://github.com/cross-rs/cross
fi

# Test issue #416
# Test without LTO
cross rustc --target armv7-unknown-linux-musleabihf --verbose

# Test with fat LTO
cross rustc --target armv7-unknown-linux-musleabihf --verbose --release
