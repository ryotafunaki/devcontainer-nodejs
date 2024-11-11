#!/bin/bash
# Copyright (c) 2024 RFull Development
# This source code is managed under the MIT license. See LICENSE in the project root.

# Install development tools
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup-init.sh
bash rustup-init.sh -y
rm rustup-init.sh
source $HOME/.cargo/env
cargo install wasm-pack
exit 0
