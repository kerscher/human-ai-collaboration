#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/../../.." && pwd)
columns=${PANDOC_COLUMNS:-88}

if ! command -v pandoc >/dev/null 2>&1; then
	echo "error: pandoc is required but was not found in PATH" >&2
	exit 127
fi

status=0

file_list=$(mktemp)

cleanup_file_list() {
	rm -f -- "$file_list"
}
trap cleanup_file_list EXIT HUP INT TERM

git -C "$repo_root" ls-files '*.md' >"$file_list"

while IFS= read -r relative_path; do
	[ -n "$relative_path" ] || continue
	file_path="$repo_root/$relative_path"
	tmp_file=$(mktemp)

	pandoc \
		--from=gfm+yaml_metadata_block \
		--to=gfm+yaml_metadata_block \
		--wrap=auto \
		--columns="$columns" \
		--output="$tmp_file" \
		"$file_path"

	if ! cmp -s -- "$file_path" "$tmp_file"; then
		echo "not formatted: $relative_path" >&2
		status=1
	fi

	rm -f -- "$tmp_file"
done <"$file_list"

exit "$status"