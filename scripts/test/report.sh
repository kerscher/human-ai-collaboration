#!/bin/sh
set -eu

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
test_root="$repo_root/test"
spec_root="$repo_root/spec"

pass_mark=${PASS_MARK:-✅}
fail_mark=${FAIL_MARK:-❌}

humanise_slug() {
	printf '%s\n' "$1" |
		tr '-' ' ' |
		awk '{ if (length($0) > 0) { $1=toupper(substr($1,1,1)) substr($1,2) } print }'
}

spec_title_from_slug() {
	spec_slug=$1
	spec_file="$spec_root/$spec_slug.md"

	if [ -f "$spec_file" ]; then
		first_line=$(sed -n '1p' "$spec_file")
		case "$first_line" in
		"# Specification: "*)
			printf '%s\n' "${first_line#\# Specification: }"
			return 0
			;;
		esac
	fi

	humanise_slug "$spec_slug"
}

verify_file_list=$(mktemp)
check_output_file=$(mktemp)

cleanup_verify_file_list() {
	rm -f -- "$verify_file_list"
	rm -f -- "$check_output_file"
}
trap cleanup_verify_file_list EXIT HUP INT TERM

find "$test_root" -type f -name verify.sh | sort >"$verify_file_list"

if [ ! -s "$verify_file_list" ]; then
	echo "No verify.sh scripts found under $test_root" >&2
	exit 1
fi

overall_status=0
total_checks=0
passed_checks=0
failed_checks=0

while IFS= read -r verify_path; do
	[ -n "$verify_path" ] || continue
	total_checks=$((total_checks + 1))

	relative_path=${verify_path#"$test_root"/}
	spec_slug=${relative_path%%/*}
	remainder=${relative_path#*/}
	requirement_slug=${remainder%%/*}
	spec_title=$(spec_title_from_slug "$spec_slug")

	requirement_title=$(humanise_slug "$requirement_slug")

	if sh "$verify_path" >"$check_output_file" 2>&1; then
		passed_checks=$((passed_checks + 1))
		printf '%s %s / %s | status=pass spec=%s requirement=%s verifier=%s\n' \
			"$pass_mark" \
			"$spec_title" \
			"$requirement_title" \
			"$spec_slug" \
			"$requirement_slug" \
			"$relative_path"
	else
		failed_checks=$((failed_checks + 1))
		first_failure_line=$(sed -n '1p' "$check_output_file" | tr '\t' ' ')
		if [ -n "$first_failure_line" ]; then
			printf '%s %s / %s (%s) | status=fail spec=%s requirement=%s verifier=%s\n' \
				"$fail_mark" \
				"$spec_title" \
				"$requirement_title" \
				"$first_failure_line" \
				"$spec_slug" \
				"$requirement_slug" \
				"$relative_path"
		else
			printf '%s %s / %s | status=fail spec=%s requirement=%s verifier=%s\n' \
				"$fail_mark" \
				"$spec_title" \
				"$requirement_title" \
				"$spec_slug" \
				"$requirement_slug" \
				"$relative_path"
		fi
		overall_status=1
	fi
done <"$verify_file_list"

printf 'Summary: %d passed, %d failed, %d total | passed=%d failed=%d total=%d\n' \
	"$passed_checks" \
	"$failed_checks" \
	"$total_checks" \
	"$passed_checks" \
	"$failed_checks" \
	"$total_checks"

exit "$overall_status"