#!/bin/bash
# Copyright (c) 2024 RFull Development
# This source code is managed under the MIT license. See LICENSE in the project root.
npm install -g serve
if [ $? -ne 0 ]; then
    echo "Failed to install serve"
    exit 1
fi
exit 0
