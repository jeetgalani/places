# Give this prompt to Claude (copy everything in the block below)

```
Rebuild the "NYC Dining Map — Bilt / Rakuten" site from the files in this bundle and publish it to a new GitHub repository, deployed with GitHub Pages.

Bundle contents:
- index.html — the complete reference build (single-file, working). Use it as the source of truth for behavior and design. You may ship it as-is, or refactor it into separate files (styles.css / app.js / data) — behavior and content must not change.
- DESIGN-SPEC.md — layout, colors, typography, components and interactions to preserve if you refactor.
- data/map-data.json — the canonical dataset: 155 places. Do not invent, add, or remove places.
- db/schema.sql + db/data.sql and csv/*.csv — the same dataset in relational form (see DATA.md). If you add a backend, load the site data from these tables; if you keep it static (preferred for GitHub Pages), embed data/map-data.json instead and keep the SQL/CSV in the repo under /db and /data for future use.
- docs/ — the research behind the eligibility tiers (summary.md, restaurant-checklist.md, reddit-crosscheck.md). Content for the explainer section comes from these; do not upgrade any eligibility tier beyond what they state.

Site requirements (all already implemented in index.html — preserve them):
1. Interactive Leaflet/OpenStreetMap centered on the user location (40.764195, -73.987652, Hell's Kitchen, "YOU" marker).
2. Pins colored by eligibility tier: Verified = green, High-likelihood maybe = amber, No evidence = grey. Places with lat/lon = null (44) appear in the list only, labeled "Location TBD", with no pin.
3. Filters: type (Restaurant / Bar / Rooftop / Café), cuisine (populated from the data), eligibility tier, distance (0.5 / 1 / 2 / 5 mi / all), and search by name or cuisine.
4. List sorted by distance_mi nearest-first. Clicking a pin, list item, or spotlight card opens a detail view: address, saved-post note, eligibility note + source link, Instagram link(s), Google Maps link.
5. Header stats: 155 places · 2 Verified (Carbone — Bilt; Hutong — Bilt experience only) · 0 Reddit-reported · 4 High-likelihood maybe (Tatiana, A Pasta Bar, Grimaldi's, Torrisi) · 149 No evidence.
6. "Check these first" spotlight with the 6 flagged places, Tatiana (0.64 mi) first.
7. Explainer section: Reddit yielded no lists or names; both Bilt and Rakuten dining lists are app-only; "No evidence" does NOT mean not participating; one-card rule (a card can be enrolled in only one Rewards Network program at a time).
8. Responsive, works on mobile, light + dark friendly per DESIGN-SPEC.md.

Publishing:
- Create a public GitHub repo named nyc-dining-map, push the site, enable GitHub Pages from the main branch root, and give me the live URL.
- Include a README.md (use the one in this bundle as the starting point).
- No build step, no API keys, no backend required for the static version. Leaflet loads from the unpkg CDN as in index.html.
- Verify the published page loads, the list renders 155 items, filters work, and at least one detail view (Carbone) opens, before reporting done.
```
