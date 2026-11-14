# Design spec — NYC Dining Map — Bilt / Rakuten
Extracted from the reference build (index.html). Preserve these tokens if refactoring.

## Layout
- Header: title, subtitle (data source + date), stat chips row (155 places / 2 Verified / 0 Reddit-reported / 4 Maybe / 149 No evidence)
- "Check these first" spotlight: horizontal cards for the 6 flagged places (Tatiana, Carbone, Hutong, A Pasta Bar, Grimaldi's, Torrisi), each with tier badge + distance
- Main split view: map (Leaflet, OpenStreetMap tiles) on one side, scrollable list panel on the other; stacks vertically on mobile
- Filter bar above the list: type chips, cuisine select, tier select, distance select, search input (name or cuisine)
- Detail panel/modal on selection: name, badges, address, neighborhood, distance, saved-post note, eligibility note + source link, Instagram link, Google Maps link
- Footer explainer section: Reddit result, app-only lists, "No evidence ≠ not participating", one-card rule

## Colors (CSS variables from the reference build)
Light theme:
- --bg #f4f3ef (warm off-white page)
- --surface #ffffff, --surface2 #eceae3
- --ink #191c1f, --muted #5c646b, --line #ddd9cf
- Verified: --green #147a45, bg #e2f2e7
- Maybe: --amber #9a6a12, bg #fdf0d3
- No evidence: --grey #5f6b76, bg #e8ecef
Dark theme: supported via `color-scheme: light dark` and matching dark variants in index.html — copy the full :root / dark block from index.html rather than reinventing it.

## Typography & style
- System font stack (no webfont), title ~22-24px semibold, body 14-15px, small caps muted labels for neighborhoods/meta
- Cards: 10-12px radius, 1px border in --line, subtle shadow on detail/spotlight
- Badges: pill, tier color bg + darker tier text, uppercase 11px
- Pins: circular Leaflet div markers in tier color with white border; "YOU" marker distinct (dark, labeled)

## Interactions
- Any filter change re-renders both list and pins together; result count shown
- List sorted by distance_mi ascending; Location TBD places (null distance) sort last, still filterable by type/cuisine/tier/search
- Clicking a list item highlights/centers its pin and opens detail; clicking a pin opens the same detail
- Search matches name OR cuisine

## Tech
- Single HTML file, inline CSS/JS, Leaflet 1.9.4 from unpkg CDN + OpenStreetMap tiles — no build step, no keys
- Data embedded in the page in the reference build; canonical source is data/map-data.json (identical content)
