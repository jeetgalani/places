# Backend

No server yet — the frontend is static and reads its data from `frontend/data/map-data.json` (also embedded in `frontend/index.html`).

This folder holds the same 155-place dataset in relational form, ready for a future API:
- `db/schema.sql` — tables (PostgreSQL; also loads in SQLite)
- `db/data.sql` — data (re-runnable: clears and reloads)
- `csv/` — the same tables as CSV

Load locally: `sqlite3 places.db < db/schema.sql && sqlite3 places.db < db/data.sql`

See `../docs/DATA.md` for the schema and the counts to verify.
