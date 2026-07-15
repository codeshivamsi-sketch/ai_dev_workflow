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

## Where the "why" lives
- Decisions: `docs/adr/` — read before refactoring anything structural
- Module intent: `src/<module>/README.md`

## Gotchas
- <things that will bite an agent>
