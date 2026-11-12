#!/bin/bash

# Fix WSL PATH to prioritize Linux binaries
echo 'export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"' >> ~/.bashrc
# shellcheck disable=SC1090
source ~/.bashrc
