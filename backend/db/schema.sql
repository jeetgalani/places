-- NYC Dining Map — relational schema (PostgreSQL; also loads in SQLite with minor type tolerance)
-- Import: psql <db> -f db/schema.sql && psql <db> -f db/data.sql
-- Or SQLite: sqlite3 site.db < db/schema.sql && sqlite3 site.db < db/data.sql

CREATE TABLE IF NOT EXISTS place_types (
  type TEXT PRIMARY KEY
);
CREATE TABLE IF NOT EXISTS cuisines (
  cuisine TEXT PRIMARY KEY
);
CREATE TABLE IF NOT EXISTS eligibility_tiers (
  tier TEXT PRIMARY KEY
);
CREATE TABLE IF NOT EXISTS places (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  type TEXT NOT NULL REFERENCES place_types(type),
  original_category TEXT,
  cuisine TEXT REFERENCES cuisines(cuisine),
  neighborhood TEXT,
  address TEXT,
  lat DOUBLE PRECISION,
  lon DOUBLE PRECISION,
  distance_mi DOUBLE PRECISION,
  note TEXT,
  eligibility_tier TEXT REFERENCES eligibility_tiers(tier),
  eligibility_program TEXT,
  eligibility_note TEXT,
  eligibility_source TEXT
);
CREATE INDEX IF NOT EXISTS idx_places_type ON places(type);
CREATE INDEX IF NOT EXISTS idx_places_cuisine ON places(cuisine);
CREATE INDEX IF NOT EXISTS idx_places_tier ON places(eligibility_tier);
CREATE INDEX IF NOT EXISTS idx_places_distance ON places(distance_mi);

CREATE TABLE IF NOT EXISTS place_instagram_links (
  place_id TEXT NOT NULL REFERENCES places(id),
  instagram_url TEXT NOT NULL,
  PRIMARY KEY (place_id, instagram_url)
);
CREATE TABLE IF NOT EXISTS reference_locations (
  label TEXT PRIMARY KEY,
  lat DOUBLE PRECISION NOT NULL,
  lon DOUBLE PRECISION NOT NULL,
  as_of TEXT
);
