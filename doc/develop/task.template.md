---
Task name: ${task name}
Task type: [Bug, Feature, Refactor, Docs, Chore]
Status:    [Draft, Open, Build, Review, Done]
Owners:    [optional GitHub handles]
RFCs:      [optional: ../doc/rfcs/<rfc>.md]
---
# ${Task name}

## Summary

One paragraph describing intent and scope. State what is explicitly out of scope.

## Acceptance criteria

Each acceptance criterion MUST be objectively verifiable and MUST have a slug identifier.

- [ ] `${slug}`: The system MUST ...
- [ ] `${slug}`: The system MUST NOT ...
- [ ] `${slug}`: The system SHOULD ...

## Verification

Verification steps MUST be reproducible. Each acceptance-criteria slug MUST be referenced by at least one verification item.

- `${slug}`: Verify by running: `<command>` and observing: `<expected result>`.
- `${slug}`: Verify by inspecting: `<file path>` and confirming: `<property>`.
- `${slug}`: Verify by review of: `<evidence>` (and optionally running: `<command>`).

## Evidence

List artefacts that MUST be attached before review where required by the task.

- [ ] `<evidence slug>` (covers: `${slug}`, `${slug}`): `<path or link>`

## Dependencies

Omit if none.

- Dependency A

## Risks and limitations

Omit if none.

- Risk A: [description]. Mitigation: [mitigation or rationale].