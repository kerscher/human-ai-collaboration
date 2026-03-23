---
RFC Name: Procedures framework
Status:   Approved
---
# RFC: Procedures framework

## 1. Summary

Define a neutral documentation framework under `doc/procedures/` for shared procedures and style guides that are consumable by both humans and agents.

## 2. Context

The repository needs a stable, reviewable location for operational guidance. The current `TODOS` process already supports governance and verification, but this RFC formalises where procedure documentation lives and how it is introduced.

Constraints:

- Changes should remain reviewable and auditable.
- Framework-level guidance should require explicit approval.
- The directory name should remain neutral (`doc/procedures/`).

## 3. Proposal

Adopt the following rules:

- `doc/procedures/` is the canonical location for shared procedures and style guides.
- New framework-level additions require both:
  - an RFC approved by maintainers; and
  - an associated task in `todos/`.
- Where RFC approval is required before implementation, the task's first acceptance criterion MUST be `rfc-approved`.
- `doc/procedures/README.md` MUST index procedure documents and link each one to its originating RFC and task.
- Procedure documents SHOULD include: purpose, scope, audience, explicit required/optional steps, and verification/evidence expectations.

## 4. Alternatives considered

| Mechanism | Description | Pros | Cons |
|-----------|-------------|------|------|
| `doc/skills/` | Use an AI-specific directory name | Familiar term in agent tooling | Signals AI-primary framing; less neutral for human contributors |
| Keep guidance dispersed | Leave guidance in multiple existing files | No new structure required | Lower discoverability; weaker governance traceability |
| `doc/procedures/` (chosen) | Neutral directory with RFC + task gate | Clear ownership, discoverable, reviewable | Slight process overhead for framework-level changes |

## 5. Consequences

Expected benefits:

- Improved discoverability of shared operational guidance.
- Clear governance path for introducing or changing framework-level procedures.
- Better traceability from procedure document to task and decision record.

Risks and limitations:

- Overly strict process may slow low-risk updates.
- Overly loose interpretation of “framework-level” may create inconsistent review quality.

### 5.1. Costs

Low direct cost (documentation only). Moderate review cost when introducing framework-level procedure categories.

## 6. Verification

This RFC is validated when:

- the associated task `todos/procedures-framework.md` records explicit maintainer approval for this RFC (`rfc-approved`);
- `doc/procedures/README.md` exists and documents the addition workflow;
- `TODOS.md` links to the associated task.
