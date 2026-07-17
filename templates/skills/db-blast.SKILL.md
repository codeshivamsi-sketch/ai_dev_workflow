---
name: db-blast
description: Trace the database impact of code changes — changed symbols → endpoints → ORM models → tables, read vs write, plus migration SQL preview and risk flags. Use before merging any change that touches models, schema files, or migrations.
---

# DB blast radius

When invoked:

1. From `git diff main --name-only` (fall back to `git diff HEAD --name-only`
   if there is no main branch), or the given paths, use codegraph to trace:
   changed symbols → endpoints that reach them → ORM models
   (SQLAlchemy/Prisma) they use → underlying tables. Mark each model access
   READ or WRITE by the call it makes (select/find/get = read;
   insert/update/delete/save/create = write).
2. If any migration files changed (alembic `versions/`,
   `prisma/schema.prisma`, `prisma/migrations/`), render — never apply —
   the exact SQL: `alembic upgrade --sql` or `prisma migrate diff
   --from-schema-datamodel <prev> --to-schema-datamodel <current> --script`.
   Never run `alembic upgrade` or `prisma migrate deploy`/`dev` — SQL/diff
   preview only.
3. Scan that SQL (or the model diff, if no migration exists yet) for risky
   ops: DROP TABLE/COLUMN, column type changes, `ADD COLUMN ... NOT NULL`
   on an existing table without a default, and ALTERs that lock large
   tables (full-table rewrites, missing `CONCURRENTLY` on Postgres indexes).
4. Output, in this order:
   - endpoint → table map, each edge marked READ or WRITE
   - the migration SQL block, or "no migration files changed"
   - a one-paragraph risk assessment naming every flagged op in plain
     language
