#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/../../.." && pwd)
fixture_root="$repo_root/test/repository-conventions/commit-subjects-use-conventional-commits/fixtures"

if [ ! -d "$fixture_root/valid" ] || [ ! -d "$fixture_root/invalid" ]; then
	echo "error: fixture directories are missing under $fixture_root" >&2
	exit 1
fi

contains_forbidden_verb() {
	text=$(printf '%s' "$1" | tr '[:upper:]' '[:lower:]')
	printf '%s\n' "$text" | grep -Eq '\b(add|adds|added|change|changes|changed|create|creates|created|fix|fixes|fixed|implement|implements|implemented|improve|improves|improved|introduce|introduces|introduced|remove|removes|removed|rename|renames|renamed|update|updates|updated)\b'
}

validate_message() {
	message_file=$1
	subject=$(sed -n '1p' "$message_file")

	if [ -z "$subject" ]; then
		echo "invalid: empty subject in $message_file" >&2
		return 1
	fi

	if ! printf '%s\n' "$subject" | grep -Eq '^(feat|doc|refactor|fix|test)(\([a-z0-9][a-z0-9-]*\))?: .+$'; then
		echo "invalid: subject header format in $message_file" >&2
		return 1
	fi

	subject_text=${subject#*: }
	if contains_forbidden_verb "$subject_text"; then
		echo "invalid: subject contains verb in $message_file" >&2
		return 1
	fi

	# If present, body lines should remain short descriptive noun phrases.
	sed -n '2,$p' "$message_file" |
	while IFS= read -r body_line; do
		trimmed=$(printf '%s' "$body_line" | sed 's/^[[:space:]]*//; s/[[:space:]]*$//')
		[ -n "$trimmed" ] || continue
		trimmed=$(printf '%s' "$trimmed" | sed 's/^- //')

		if contains_forbidden_verb "$trimmed"; then
			echo "invalid: body contains verb in $message_file" >&2
			exit 1
		fi
	done
}

status=0

for file_path in "$fixture_root"/valid/*.txt; do
	if ! validate_message "$file_path"; then
		echo "expected valid fixture to pass: $file_path" >&2
		status=1
	fi
done

for file_path in "$fixture_root"/invalid/*.txt; do
	if validate_message "$file_path"; then
		echo "expected invalid fixture to fail: $file_path" >&2
		status=1
	fi
done

exit "$status"