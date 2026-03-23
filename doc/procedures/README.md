# Procedures

This directory stores shared procedures and style guides for repository contributors.
Its name is intentionally neutral. The purpose is to hold operational guidance that humans can read directly and agents can also consume reliably.

## How material is added

1. Draft or update an RFC when introducing a new framework-level procedure or repository-wide guidance pattern.
2. Create or update a task under `todos/`.
3. Ensure the task's first acceptance criterion is `rfc-approved` where RFC approval is required before implementation.
4. Add the procedure document and link it back to its RFC and task.

## Index

- Framework: `doc/rfcs/procedures-framework.md`

## Authoring expectations

Procedure documents SHOULD:

- state their purpose and scope clearly;
- identify their intended audience;
- use explicit, reviewable language;
- define verification or evidence expectations where relevant;
- link to the RFC and task that introduced them.
