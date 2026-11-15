# places — NYC Dining Map (Bilt / Rakuten)

An interactive map of 155 NYC restaurants, bars/rooftops and cafés from a saved Instagram collection, cross-checked against Bilt Neighborhood Dining and Rakuten Dining eligibility.

**Live site:** https://jeetgalani.github.io/places/

## Monorepo layout
| Folder | What's in it |
|---|---|
| `frontend/` | The static site (`index.html`, Leaflet + OpenStreetMap, data embedded) and `data/map-data.json`. Deployed to GitHub Pages on every push to `main`. |
| `backend/` | The dataset as SQL (`db/`) and CSV (`csv/`), ready for a future API. No server yet. |
| `docs/` | `DATA.md` (schema), `DESIGN-SPEC.md` (design tokens), `research/` (eligibility research), and the original build prompt. |
| `.github/workflows/pages.yml` | Deploys `frontend/` to GitHub Pages. |

## Data
155 places: 66 restaurants, 73 bars & rooftops, 16 cafés. 111 have map pins; 44 are list-only ("Location TBD"). The site asks the browser for your current location and computes straight-line miles from there; if location is denied or unavailable it falls back to Hell's Kitchen (40.764195, -73.987652), which is also the reference point for the precomputed `distance_mi` in the backend data.

Eligibility (researched Nov 13, 2026): 2 Verified (Carbone, Hutong — Bilt), 4 High-likelihood maybe (Tatiana, A Pasta Bar, Grimaldi's, Torrisi), 149 No evidence. Neither program publishes its full list; "no evidence" does not mean not participating.

## Run locally
`cd frontend && python3 -m http.server 8000` → open http://localhost:8000
