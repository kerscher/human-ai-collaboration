#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/../../.." && pwd)
fixture_root="$repo_root/test/repository-conventions/commit-subjects-use-conventional-commits/fixtures"
commit_range=${COMMIT_RANGE:-HEAD}
forbidden_verbs_pattern='\b(add|adds|added|change|changes|changed|create|creates|created|fix|fixes|fixed|implement|implements|implemented|improve|improves|improved|introduce|introduces|introduced|remove|removes|removed|rename|renames|renamed|update|updates|updated)\b'

if [ ! -d "$fixture_root/valid" ] || [ ! -d "$fixture_root/invalid" ]; then
	echo "error: fixture directories are missing under $fixture_root" >&2
	exit 1
fi

contains_forbidden_verb() {
	text=$(printf '%s' "$1" | tr '[:upper:]' '[:lower:]')
	first_word=$(printf '%s\n' "$text" |
		sed 's/^[^[:alnum:]]*//' |
		awk 'NF { print $1; exit }')
	printf '%s\n' "$first_word" | grep -Eq '^add(s|ed)?$|^change(s|d)?$|^create(s|d)?$|^fix(es|ed)?$|^implement(s|ed)?$|^improve(s|d)?$|^introduce(s|d)?$|^remove(s|d)?$|^rename(s|d)?$|^update(s|d)?$'
}

validate_message_parts() {
	message_source=$1
	subject=$2
	body=$3

	if [ -z "$subject" ]; then
		echo "invalid: empty subject in $message_source" >&2
		return 1
	fi

	if ! printf '%s\n' "$subject" | grep -Eq '^(feat|doc|refactor|fix|test)(\([a-z0-9][a-z0-9-]*\))?: .+$'; then
		echo "invalid: subject header format in $message_source" >&2
		return 1
	fi

	subject_text=${subject#*: }
	if contains_forbidden_verb "$subject_text"; then
		echo "invalid: subject contains verb in $message_source" >&2
		return 1
	fi

	# If present, body lines should remain short descriptive noun phrases.
	if printf '%s\n' "$body" |
		sed 's/^[[:space:]]*//; s/[[:space:]]*$//; s/^- //' |
		awk 'NF { print tolower($1) }' |
		grep -Eq '^add(s|ed)?$|^change(s|d)?$|^create(s|d)?$|^fix(es|ed)?$|^implement(s|ed)?$|^improve(s|d)?$|^introduce(s|d)?$|^remove(s|d)?$|^rename(s|d)?$|^update(s|d)?$'; then
		echo "invalid: body contains verb in $message_source" >&2
		return 1
	fi

	return 0
}

validate_message_file() {
	message_file=$1
	subject=$(sed -n '1p' "$message_file")
	body=$(sed -n '2,$p' "$message_file")
	validate_message_parts "$message_file" "$subject" "$body"
}

status=0

for file_path in "$fixture_root"/valid/*.txt; do
	if ! validate_message_file "$file_path"; then
		echo "expected valid fixture to pass: $file_path" >&2
		status=1
	fi
done

for file_path in "$fixture_root"/invalid/*.txt; do
	if validate_message_file "$file_path" >/dev/null 2>&1; then
		echo "expected invalid fixture to fail: $file_path" >&2
		status=1
	fi
done

for commit_hash in $(git -C "$repo_root" rev-list "$commit_range"); do
	commit_subject=$(git -C "$repo_root" show -s --format=%s "$commit_hash")
	commit_body=$(git -C "$repo_root" show -s --format=%b "$commit_hash")

	if ! validate_message_parts "commit $commit_hash" "$commit_subject" "$commit_body"; then
		status=1
	fi
done

exit "$status"