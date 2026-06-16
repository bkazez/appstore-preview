# appstore-preview

A reusable, static App Store listing preview. Renders an Apple-style product
page from a small JSON file, so you can mock up any app and send a link for
feedback before it is live. Hosted on GitHub Pages.

**Live:** https://bkazez.github.io/appstore-preview/?app=wavelength

## Add an app

One folder per app under `apps/<slug>/`:

```
apps/
  myapp/
    app.json
    assets/
      icon.png
      ss1.png ss2.png ...
```

Then open `?app=myapp`. Nothing else changes — `index.html` is a generic
template that loads `apps/<slug>/app.json` and its `assets/` at runtime.

## app.json

```json
{
  "name": "MyApp: Tagline",
  "subtitle": "One-line subtitle",
  "developer": "Your Company",
  "icon": "assets/icon.png",
  "facts": [
    { "k": "No Ratings", "v": "★ ★ ★ ★ ☆", "sub": "New app" },
    { "k": "Age", "v": "4<small>+</small>", "sub": "Years Old" }
  ],
  "screenshots": [
    { "src": "assets/ss1.png", "caption": "Benefit-first caption", "alt": "accessible description" }
  ],
  "description": "Full App Store description.\n\nBlank lines and bullet lists render as-is.",
  "info": [
    { "k": "Seller", "v": "Your Company LLC" },
    { "k": "Compatibility", "v": "iPhone · iOS 17.0 or later" }
  ],
  "note": "Optional footnote shown below the device (HTML allowed)."
}
```

- `facts` and `info` `v` fields allow inline HTML (e.g. `<small>+</small>`).
- Screenshot/icon paths are relative to the app folder.
- Use the real App Store screenshot PNGs (6.7" / iPhone 16 Pro Max) for an accurate preview.

## Preview locally

GitHub Pages serves over HTTP, so `app.json` loads via `fetch`. For local
preview, serve over HTTP (not `file://`):

```
python3 -m http.server 8000   # then open http://localhost:8000/?app=wavelength
```
