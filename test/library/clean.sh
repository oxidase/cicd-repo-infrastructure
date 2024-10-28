#!/bin/bash

set -euo pipefail

rm -f .clang-format
rm -f .clang-tidy
rm -f .cmake-format.yaml
rm -f mull.yml
rm -f .gitignore
rm -f CMakePresets.json
rm -f toolchains
rm -f requirements.txt
rm -f docs/puppeteer_config.json

rm -rf build
rm -rf .github
