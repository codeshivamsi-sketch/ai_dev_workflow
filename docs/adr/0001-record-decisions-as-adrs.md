# 0001 — Record decisions as ADRs

Date: 2026-07-14
Status: Accepted

## Context
AI agents refactor confidently. Code contains the "what" but not the
"why not" — an agent that doesn't know why polling was chosen will
happily "upgrade" it to websockets. Wikis go stale; stale docs
mislead agents worse than no docs.

## Decision
Every significant technical decision gets an ADR in docs/adr/,
drafted by the /adr skill at decision time, approved by a human.
ADRs are immutable; changes are new ADRs that supersede old ones.

## Consequences
+ The "why" survives; agents and new teammates read it before refactoring
+ Cannot go stale — each ADR records a moment, not the present
− Small per-decision writing cost (~5 min with the /adr skill)
