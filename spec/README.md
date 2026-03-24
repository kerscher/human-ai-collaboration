# Specifications

This directory stores normative behavioural specifications for repository subjects.

Specifications in this directory SHOULD:

- define one subject per file;
- use RFC 2119 / RFC 8174 language for requirements;
- identify each requirement with a stable `kebab-case` slug;
- link a slug directly to its canonical verification artefact once such an artefact exists.

Preferred development order:

1. Write or refine the specification.
2. Add a failing verification artefact.
3. Implement the change.
4. Verify the result.

Use `doc/develop/spec.template.md` when creating a new specification.