---
Task name: Governance docs remediation baseline
Task type: Docs
Status:    Review
Approved by: in-session user approval
Approval date: 2026-03-23
---

# Governance docs remediation baseline

## Summary

Create a first-pass governance remediation task that defines and tracks corrections for missing pages, broken or unresolved references, and policy-template alignment across repository governance documents. This task establishes verification commands and evidence placeholders so follow-on remediation is reviewable and auditable. It does not implement all corrections itself.

## Acceptance criteria

Each acceptance criterion MUST be objectively verifiable and MUST have a slug identifier.

- [x] `task-is-first-in-todos`: The remediation task MUST be the first entry in the task list in `TODOS.md`.
- [x] `task-page-exists-and-links`: The task list entry MUST link to this task page and the linked path MUST exist in the repository.
- [x] `omissions-captured`: The task MUST enumerate known governance omissions to be remediated, including missing task pages, missing templates, and missing RFC support location.
- [x] `heading-style-normalized`: Governance markdown documents MUST use a single heading style per heading level and MUST NOT combine hash-style headings with underline separators for the same heading. This includes this document and other TODOS and their template.
- [x] `verification-defined-per-slug`: Each acceptance-criteria slug MUST be referenced by at least one reproducible verification item.
- [x] `evidence-mapped-per-slug`: Each acceptance-criteria slug MUST be covered by at least one evidence checklist item.

## Verification

Verification steps MUST be reproducible. Each acceptance-criteria slug MUST be referenced by at least one verification item.

- `task-is-first-in-todos`: Verify by inspecting `TODOS.md` and confirming this task appears as the first checkbox item under "Task list".
- `task-page-exists-and-links`: Verify by inspecting `TODOS.md` and confirming the link target `./todos/governance-docs-remediation-baseline.md` exists.
- `omissions-captured`: Verify by inspecting this task page and confirming explicit listed omissions include:
  - missing task detail page for existing task-list entries;
  - missing `TODOS.template.md` fallback referenced by `AGENTS.md`;
  - missing `doc/rfcs/` support location referenced by governance docs.
- `heading-style-normalized`: Verify by inspecting `AGENTS.md` and `TODOS.md` and confirming headings that use `#`, `##`, or `###` do not also include underline separator lines immediately below.
- `verification-defined-per-slug`: Verify by review of this "Verification" section and confirming every slug from "Acceptance criteria" appears at least once.
- `evidence-mapped-per-slug`: Verify by review of this "Evidence" section and confirming every slug from "Acceptance criteria" is covered.

## Verification results

- `task-is-first-in-todos`: Passed. Confirmed in `TODOS.md` under "Task list".
- `task-page-exists-and-links`: Passed. `./todos/governance-docs-remediation-baseline.md` exists and is linked from `TODOS.md`.
- `omissions-captured`: Passed. Supporting artefacts now created: `todos/landing-page.md`, `TODOS.template.md`, and `doc/rfcs/` with seed documents.
- `heading-style-normalized`: Passed. `AGENTS.md` and `TODOS.md` use hash-style headings without underline separators for those headings.
- `verification-defined-per-slug`: Passed. Each acceptance slug appears in Verification section.
- `evidence-mapped-per-slug`: Passed. Each acceptance slug is covered by at least one evidence item below.

## Evidence

List artefacts that MUST be attached before review where required by the task.

- [x] `todos-order-snapshot` (covers: `task-is-first-in-todos`): `TODOS.md` reviewed with task order confirmed.
- [x] `task-link-resolution-note` (covers: `task-page-exists-and-links`): Path existence confirmed for `todos/governance-docs-remediation-baseline.md`.
- [x] `omissions-register` (covers: `omissions-captured`): Remediations created at `todos/landing-page.md`, `TODOS.template.md`, and `doc/rfcs/README.md` + `doc/rfcs/rfc.template.md`.
- [x] `heading-style-check` (covers: `heading-style-normalized`): `AGENTS.md`, `TODOS.md`, `TODOS.template.md`, task pages under `todos/`, and `doc/develop/task.template.md` use hash-style headings without underline separators for the same headings.
- [x] `verification-coverage-check` (covers: `verification-defined-per-slug`): Slug-to-verification mapping confirmed complete.
- [x] `evidence-coverage-check` (covers: `evidence-mapped-per-slug`): Slug-to-evidence mapping confirmed complete.


## Risks and limitations

- Risk A: This task closes baseline governance omissions but does not validate future drift automatically. Mitigation: enforce checks during task review and keep templates aligned with policy docs.
