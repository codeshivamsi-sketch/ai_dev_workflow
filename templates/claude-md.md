# Project context for AI agents

## Stack
- <language + version, framework, key libraries>

## Commands
- dev: `<npm run dev>`
- test: `<npm test>`
- lint: `<npm run lint>`
- typecheck: `<npm run typecheck>`

## Conventions
- <e.g. all API calls go through src/lib/api.ts>
- <e.g. never use `any`; strict types are documentation>

## Invariants (never violate)
- <e.g. orders are never deleted, only cancelled>

## Tool routing
- Before creating any new function or utility: query codegraph — does it already exist?
- Before refactoring anything shared: run /blast on the affected files
- Any non-trivial feature: plan first (Superpowers)

## Where the "why" lives
- Decisions: `docs/adr/` — read before refactoring anything structural
- Architecture map: `docs/architecture.md` (regenerate with /arch)
- Blast-radius snapshots: `docs/blast/`
- Module intent: `src/<module>/README.md`

## Gotchas
- <things that will bite an agent>
