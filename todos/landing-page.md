---
Task name: Repository landing page
Task type: Docs
Status:    Draft
Owners:    [optional GitHub handles]
RFCs:      [optional: ../doc/rfcs/<rfc>.md]
---

# Repository landing page

## Summary

Create an initial repository landing page for downstream forks that explains project purpose, governance flow, and how to start work from `TODOS.md` and task pages.

## Acceptance criteria

- [ ] `readme-exists`: The repository MUST contain a landing page document in the agreed location.
- [ ] `links-to-governance`: The landing page MUST link to `AGENTS.md` and `TODOS.md`.
- [ ] `explains-task-flow`: The landing page MUST describe how to use task detail pages under `todos/`.

## Verification

- `readme-exists`: Verify by inspecting the repository root for the landing page file.
- `links-to-governance`: Verify by inspecting landing page links to `AGENTS.md` and `TODOS.md`.
- `explains-task-flow`: Verify by reading the section that describes task execution flow.

## Evidence

- [ ] `landing-page-link-check` (covers: `links-to-governance`): Link targets resolve in repository.

## Dependencies

- None.

## Risks and limitations

- Risk A: Scope may expand beyond initial onboarding notes. Mitigation: keep first version minimal and factual.
