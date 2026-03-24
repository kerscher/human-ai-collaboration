#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
columns=${PANDOC_COLUMNS:-88}

if ! command -v pandoc >/dev/null 2>&1; then
	echo "error: pandoc is required but was not found in PATH" >&2
	exit 127
fi

find "$repo_root" \
	-type d \( -name .git -o -name node_modules \) -prune -o \
	-type f -name '*.md' -print |
while IFS= read -r file_path; do
	tmp_file=$(mktemp)
	cleanup() {
		rm -f -- "$tmp_file"
	}
	trap cleanup EXIT HUP INT TERM

	pandoc \
		--from=gfm+yaml_metadata_block \
		--to=gfm+yaml_metadata_block \
		--wrap=auto \
		--columns="$columns" \
		--output="$tmp_file" \
		"$file_path"

	mv -- "$tmp_file" "$file_path"
	trap - EXIT HUP INT TERM
done