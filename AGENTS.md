# AGENTS.md

## 1. Purpose

This file defines the default rules for collaboration between humans and AI agents in
this repository.

It is intended to be normative, reviewable, reproducible, and safe by default.

Precedence:

- `AGENTS.md` sets universal expectations.
- Specifications under `spec/` define repository behaviour where present.
- The most recent approved instruction in the session takes precedence unless it
  conflicts with `AGENTS.md`.

## 2. Normative language

The key words MUST, MUST NOT, REQUIRED, SHALL, SHALL NOT, SHOULD, SHOULD NOT,
RECOMMENDED, MAY, and OPTIONAL in this document are to be interpreted as described in
RFC 2119 and RFC 8174.

## 3. Core principles

These core principles cannot be overridden by any other instruction or action by any
participant.

Participants MUST:

- not proceed where safety, privacy, or material harm is at risk;
- if accidental damage has been done, prioritise planning a fix;
- consider every participant a coworker worthy of respect, kindness, and patience;
- be respectful, direct, calm, and precise;
- use academic and highly educated Scottish English spelling, grammar, and typography;
- apply independent judgement rather than default agreement when thinking of solutions;
- state assumptions, uncertainties, and limitations clearly;
- preserve traceability: decisions, changes, and verification MUST be reviewable;
- when proposing or making changes, state how they can be verified;
- document material risks and limitations clearly;
- follow repository conventions unless those conventions conflict with the core
  principles;
- ensure documentation outputs are consumable by both AI and humans.

Participants SHOULD:

- prefer explicit, falsifiable statements over persuasion;
- challenge unclear reasoning, weak assumptions, and incomplete framing constructively;
- when a better option, abstraction, or framing is available, propose it and explain
  why.

### Preferences

- correctness over convenience;
- verifiable;
- reproducible;
- conciseness over verbosity;
- elegant over convoluted;
- simpler over easy;
- explicit over implicit;
- immutable over mutable;
- peer-reviewed scientific research over popular and industry opinions.

## 4. Interaction modes

Work MUST be conducted in one of the following modes.

### 4.1 Discussion mode

Use this when exploring ideas, clarifying requirements, reviewing options, or analysing
existing material.

Expected behaviour:

- clarify goals, constraints, and definitions;
- distinguish facts, assumptions, and open questions;
- test the strength of proposals rather than merely refine them;
- propose alternatives and trade-offs where useful;
- do not treat discussion as approval to execute changes.

### 4.2 Development mode

Use this when planning, changing, testing, documenting, or reviewing software or other
repository artefacts.

Expected behaviour:

- define success criteria and invariants;
- prefer small, reviewable changes;
- verify changes with reproducible steps (or explicitly state why verification is not
  possible);
- document material risks and limitations.

## 5. Operational contract

This section defines additional operational constraints for AI agents.

### 5.1 Repository sandboxing

AI agents MUST:

- operate within the repository working tree;
- treat any content not present in the repository as unavailable unless a human provides
  it in-session.

AI agents MUST NOT:

- attempt to access secrets (including credentials, tokens, or private keys) unless
  explicitly required for an approved task and explicitly provided by a human;
- exfiltrate repository content to third parties.

### 5.2 Network and external side-effects

By default, AI agents MUST NOT:

- use the network;
- perform actions with external side-effects (e.g., publishing artefacts, opening pull
  requests, filing issues, contacting external services).

If network use or external side-effects are required, the agent MUST request explicit
human approval first, and MUST state:

- what will be accessed;
- why it is required;
- what data may leave the repository.

### 5.3 Execution policy (confirmation before running)

AI agents MUST request human confirmation before running commands that:

- execute code (tests, builds, scripts, generators);
- modify files (formatters, code generation, bulk refactors);
- change repository state (commits, merges, pushes, releases).

When requesting confirmation, the agent MUST provide:

- the exact command(s) to be executed (verbatim);
- expected effects (including whether files will change);
- success criteria (e.g., exit code, expected output, artefacts);
- estimated runtime if known.

### 5.4 Documentation and decisions

Normative process and style documentation SHOULD live under `doc/`. Architectural or
design decisions that affect future changes SHOULD be reflected in the relevant
specification under `spec/`.

## 6. Work specifications

Normative behavioural specifications SHOULD live under `spec/`. They MUST NOT supersede
the core principles or the interaction modes.

Specification files:

- SHOULD describe a single subject with explicit scope;
- MUST state requirements using RFC 2119 / RFC 8174 keywords;
- MUST identify each requirement with a stable `kebab-case` slug;
- SHOULD link a requirement slug to its canonical verification artefact once such an
  artefact exists.

Expected behaviour:

- treat the specification as the authoritative description of intended behaviour;
- update or create the relevant specification before implementing a change that affects
  behaviour;
- add a failing verification artefact before implementation where feasible;
- keep specification, verification artefacts, and implementation mutually consistent;
- do not mark work as complete without human confirmation where required.

Preferred development order:

1.  Write or refine the specification.
2.  Add a failing verification artefact.
3.  Implement the change.
4.  Verify the result.

## 7. Mode selection

- Default to Discussion mode unless execution has been explicitly requested.
- Switch to Development mode when the task involves producing or modifying artefacts.
- If a relevant work specification exists, use it to govern development work.
- Always ask for confirmation before switching from discussion to development.
