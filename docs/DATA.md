# Data — formats in this bundle

## Canonical: data/map-data.json
{ "user_location": {label, lat, lon, as_of}, "places": [155 objects] }
Place fields: name, type (Restaurant | Bar / Rooftop | Café), original_category, cuisine, neighborhood, address, lat, lon (null = no pin), distance_mi (from user_location, null when no coords), note, ig_urls[], eligibility_tier (Verified | High-likelihood maybe | No evidence), eligibility_program, eligibility_note, eligibility_source.

## Relational import (db/ + csv/)
Schema (db/schema.sql, PostgreSQL — also loads in SQLite):
- places(id TEXT PK slug, name, type FK, original_category, cuisine FK, neighborhood, address, lat, lon, distance_mi, note, eligibility_tier FK, eligibility_program, eligibility_note, eligibility_source)
- place_types(type PK) · cuisines(cuisine PK) · eligibility_tiers(tier PK) — lookup tables
- place_instagram_links(place_id FK, instagram_url, PK both) — 165 links for the 155 places
- reference_locations(label PK, lat, lon, as_of) — the "you are here" point the distances were computed from

Load it:
- Postgres: `psql <db> -f db/schema.sql` then `psql <db> -f db/data.sql` (data.sql is re-runnable: it clears and reloads)
- SQLite: `sqlite3 site.db < db/schema.sql` then `sqlite3 site.db < db/data.sql`
- Any other database / ORM: import csv/places.csv, csv/place_instagram_links.csv, csv/reference_location.csv instead — same columns as the tables (places.csv uses the slug `id`).

Counts to verify after import: places = 155, place_instagram_links = 165, places with lat NOT NULL = 111, eligibility_tier counts: Verified 2, High-likelihood maybe 4, No evidence 149.
Example check: `SELECT eligibility_tier, COUNT(*) FROM places GROUP BY 1;`
Example site query (Italian restaurants within 1 mile, nearest first):
`SELECT name, cuisine, distance_mi FROM places WHERE type='Restaurant' AND cuisine LIKE '%Italian%' AND distance_mi <= 1 ORDER BY distance_mi;`
