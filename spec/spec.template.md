# Specification: ${subject}

## 1. Purpose

Briefly state what this specification defines and why it exists.

## 2. Scope

Describe what is in scope and what is explicitly out of scope.

## 3. Requirements

Each requirement MUST use RFC 2119 / RFC 8174 language and MUST have a stable `kebab-case` slug.

Before a verification artefact exists:

- `${slug}`: The system MUST ...

Once a canonical verification artefact exists, link the slug directly from the one-line requirement:

- [`${slug}`](../test/<tool-or-language-specific-path>): The system MUST ...
- [`${slug}`](../test/<tool-or-language-specific-path>): The system MUST NOT ...
- [`${slug}`](../test/<tool-or-language-specific-path>): The system SHOULD ...

Do not keep the guidance above on any documented using this template. It's meant as reference only.

## 4. Risks and limitations

Omit entire section if none.

- Risk A: [description]. Mitigation: [mitigation or rationale].

## 5. References

Omit entire section if none.

- Reference A