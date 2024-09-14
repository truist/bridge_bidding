#!/usr/bin/env bash

set -e

# depends on https://github.com/mermaid-js/mermaid-cli

OPEN=0

generate() {
	file="$1"

	base="$(basename "$file" .mmd)"
	echo "$base.mmd -> $base.svg"
	mmdc -c config.js -i "$base.mmd" -o "$base.svg"

	if [[ "$OPEN" -eq 1 ]]; then
		open "$base.svg"
	fi
}

if [[ "$1" == "-o" ]]; then
	OPEN=1
	shift
fi

if [[ $# -gt 0 ]]; then
	generate "$1"
else
	for mmd in *.mmd ; do
		generate "$mmd"
	done
fi


# mmdc -c config.js -i bidding.mmd -o bidding.svg
# mmdc -c config.js -w 3840 -s 2 -i bidding.mmd -o bidding.png

