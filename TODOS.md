# TODOS

## 1. Purpose

This file lists and sequences development work for this repository.

It is intended to be easy to review in code review, auditable (links to evidence and decisions), and usable by both humans and AI agents.

## 2. Normative language

The key words MUST, MUST NOT, REQUIRED, SHALL, SHALL NOT, SHOULD, SHOULD NOT, RECOMMENDED, MAY, and OPTIONAL are to be interpreted as described in RFC 2119 and RFC 8174.

## 3. Validation criteria

A `TODOS.md` entry is considered validated only when:

- it links to a task detail page (see §4, [Task structure](#4-task-structure));
- the task detail page defines acceptance criteria using RFC keywords;
- the task detail page defines verification steps and/or required evidence artefacts;
- a human has explicitly approved the task for execution in the current session.

AI agents MUST NOT treat an unvalidated entry as authorisation to execute changes.

## 4. Task structure

Each task entry MUST link to a task detail page.

Task pages:

- SHOULD live under `todos/`;
- SHOULD be created from `doc/develop/task.template.md`;
- MUST state acceptance criteria using RFC keywords;
- MUST state verification steps and/or required evidence artefacts;
- SHOULD link to relevant RFCs under `doc/rfcs/` where design decisions are required.

If a task requires a new design decision, the task page SHOULD require an RFC to be drafted and approved before implementation begins.

### 4.1 Acceptance-criteria slugs

Acceptance criteria in task pages MUST be identified by slugs.

A slug is a short, human-readable identifier that is safe to use in file names, anchors, and references (for example, `no-network-by-default`).

Slug rules:

- Each slug MUST be unique within the task.
- Each slug MUST use `kebab-case` ASCII.
- Each slug SHOULD be short and specific (typically 2–6 words).
- Each slug MUST NOT encode modality (for example, MUST/SHOULD/MUST NOT).
- Once a task is validated, slugs SHOULD NOT change. If a slug changes, all references MUST be updated (verification steps, evidence artefacts, links, and any tests).

Good examples:

- `no-network-by-default`
- `deterministic-build`
- `reject-invalid-input`
- `docs-consumable-by-humans-and-agents`
- `confirm-before-execution`

Bad examples (and why):

- `AC-1` (not descriptive; encourages renumbering churn)
- `MustNoNetwork` (not `kebab-case`)
- `must-no-network` (encodes modality)
- `no network` (contains whitespace; ambiguous normalisation)
- `no_network` (underscores; inconsistent with `kebab-case`)
- `fix-stuff` (non-specific; not falsifiable)
- `handle-errors` (too broad; not verifiable without further specification)

## 5. Workflow (human and agent)

For each task:

1. Clarify requirements and risks (Discussion mode).
2. Produce or update task page until validated (human approval).
3. Implement changes (Development mode).
4. Verify changes with reproducible steps and attach evidence.
5. Request review with links to evidence.

Agents MUST ask for confirmation before executing commands or modifying repository artefacts (see `AGENTS.md`, §5.3: [AGENTS.md](./AGENTS.md)).

## 6. Task list

- [ ] [Repository landing page](./todos/landing-page.md)