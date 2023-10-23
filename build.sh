#!/usr/bin/env bash

set -e

# depends on https://github.com/mermaid-js/mermaid-cli

mmdc -c config.js -i bidding.mmd -o bidding.svg

