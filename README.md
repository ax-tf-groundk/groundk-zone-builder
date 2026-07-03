# GroundK Zone Builder

Internal testing package for drawing operating zones on Google Maps and exporting them as GeoJSON/KML.

## Open the web app

Use this link:

https://lsjlwj5371.github.io/groundk-zone-builder/

Paste the Google Maps API key into the top input field, then click `지도 로드`.

If the map does not load, check the Google Cloud API key settings:

- Allowed referrer must include:
  - `https://lsjlwj5371.github.io/groundk-zone-builder/*`
- Allowed APIs must include:
  - `Maps JavaScript API`
  - `Places API`
- Billing must be enabled for the Google Cloud project.

## Files

- `index.html` - Google Maps Zone Builder
- `zone_google_maps_builder_config.js` - local Google Maps API key config
- `start_zone_google_maps_builder.bat` - Windows local-server launcher

## How to run locally

1. Download this repository as a ZIP file.
2. Extract the ZIP.
3. Double-click `start_zone_google_maps_builder.bat`.
4. Keep the black server window open while using the tool.
5. The browser should open at `http://127.0.0.1:8793/...`.
6. Paste the Google Maps API key into the top input field.
7. Click `지도 로드`.

For convenience, after downloading the repository you may also open
`zone_google_maps_builder_config.js` locally and put the key in:

```js
window.GROUNDK_GOOGLE_MAPS_API_KEY = "YOUR_KEY_HERE";
```

Do not commit the real key back to GitHub.

## Google Cloud key restrictions

Restrict the API key in Google Cloud Console:

- Application restriction: HTTP referrers
- GitHub Pages referrer:
  - `https://lsjlwj5371.github.io/groundk-zone-builder/*`
- Local test referrers:
  - `http://127.0.0.1:*/*`
  - `http://localhost:*/*`
- API restriction:
  - `Maps JavaScript API`
  - `Places API`

If this is later deployed through GitHub Pages or a custom domain, add that URL to the key's allowed referrers.
