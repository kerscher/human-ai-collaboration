# Specification: Repository conventions

## 1. Purpose

Define repository-wide conventions for document formatting and git commit messages so
that contributions remain mechanically consistent and reviewable.

## 2. Scope

This specification covers the required formatting baseline for repository artefacts
maintained by the documentation formatter and the required shape of git commit messages.
It does not define branch strategy, release tagging, or the detailed content of
individual commits.

## 3. Requirements

- `formatting-matches-format-script`: Repository artefacts maintained by the formatter
  MUST match the output produced by `./scripts/doc/format.sh`.
- `commit-subjects-use-conventional-commits`: Git commit messages MUST use the
  Conventional Commits structure and MUST follow these repository constraints:
  - the commit type MUST be one of `feat`, `doc`, `refactor`, `fix`, or `test`;
  - the optional scope MAY be used when needed to identify the affected subject;
  - the subject line MUST be succinct and descriptive;
  - when a message body is present, it MUST use succinct descriptive noun phrases and
    MUST avoid verbs.

### 3.1 Examples for `commit-subjects-use-conventional-commits`

Valid examples:

``` text
feat(spec): repository conventions baseline
doc(readme): contribution flow clarification
refactor(format): script output normalisation
fix(test): flaky fixture path handling
test(spec): commit examples coverage
```

Valid example with body:

``` text
doc(spec): commit style constraints

- allowed types list
- optional scope guidance
- subject clarity rule
- body noun phrase style
```

Invalid examples:

``` text
chore(spec): update conventions
feat: add new behaviour
fix(spec): fixes the failing tests
```

Why invalid:

- `chore` is outside the allowed type set.
- `add new behaviour` uses a verb in the subject.
- `fixes the failing tests` uses a verb in the subject and does not list which failing
  tests were affected.

## 4. Risks and limitations

- Risk A: The formatter scope may expand over time and affect additional files.
  Mitigation: keep formatter behaviour reviewable through changes to
  `./scripts/doc/format.sh`.
