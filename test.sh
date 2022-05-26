#!/bin/bash

if ! command -v cross &> /dev/null; then
    cargo install cross --git https://github.com/cross-rs/cross
fi

rustup toolchain install nightly-2021-03-25
toolchain="rustup run nightly-2021-03-25-x86_64-unknown-linux-gnu"

# Test issue #416
# Test without LTO
$toolchain cross rustc --target armv7-unknown-linux-musleabihf --verbose

# Test with fat LTO
$toolchain cross rustc --target armv7-unknown-linux-musleabihf --verbose --release
