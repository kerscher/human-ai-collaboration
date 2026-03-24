# Tests

This directory stores verification artefacts for repository specifications. It does so
by having reproducible verification procedures that check if specifications have been
fulfilled.

- Verification artefacts SHOULD be written to fail before the corresponding
  implementation is added, where feasible.
- A specification requirement SHOULD link its slug directly to the canonical
  verification artefact once that artefact exists.
- Verification artefacts MAY use different tools or languages.

Recommended layout for discoverability and locality:

- `test/<spec-slug>/<requirement-slug>/verify.sh` for canonical verification scripts.
- Use `test/<spec-slug>/fixtures/` only when fixtures are shared across requirements.
- Otherwise keep fixtures local to the requirement directory, for example
  `test/<spec-slug>/<requirement-slug>/fixtures/`.

Repository summary reporter:

- Run `sh ./scripts/test/report.sh` to discover all `verify.sh` scripts and print a
  one-line-per-check summary.
- Output is human-readable first, followed by compact machine-readable fields after `|`,
  e.g.
  `✅ Repository conventions / Commit subjects use conventional commits | status=pass spec=repository-conventions requirement=commit-subjects-use-conventional-commits verifier=repository-conventions/commit-subjects-use-conventional-commits/verify.sh`.
