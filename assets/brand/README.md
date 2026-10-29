# Media Grid Software Development Labs — logo package

Production vector reconstruction of the approved blue and teal concept.

## Files

- mgsdl-horizontal-light.svg: website header on light backgrounds.
- mgsdl-horizontal-dark.svg: white and teal artwork for dark backgrounds.
- mgsdl-stacked-light.svg / mgsdl-stacked-dark.svg: stacked layouts.
- mgsdl-symbol-light.svg / mgsdl-symbol-dark.svg: standalone marks.
- Matching PNGs: transparent, at twice the SVG's nominal dimensions.
- favicon.svg / favicon.ico: navy-backed site icon.
- icon-180.png: Apple touch icon; icon-192.png and icon-512.png: app icons.
- preview.png: light and dark horizontal logo reference.

## Colours

Midnight navy: #06243E
Teal: #08B9C1
White: #FFFFFF

SVG lettering is outlined for reliable display without installed fonts. The production wordmark uses Avenir Next Bold and the subtitle uses Avenir Next Medium, converted to paths. This is a clean reconstruction of the approved concept; generated lettering was not a font source.

## Website use

Copy the selected files into /assets/brand/ in the GitHub Pages repository.

```html
<img src="/assets/brand/mgsdl-horizontal-light.svg"
     alt="Media Grid Software Development Labs"
     width="455" height="108">
<link rel="icon" href="/assets/brand/favicon.ico" sizes="any">
<link rel="icon" href="/assets/brand/favicon.svg" type="image/svg+xml">
<link rel="apple-touch-icon" href="/assets/brand/icon-180.png">
```

Use the dark logo on navy or similarly dark backgrounds. Its PNG/SVG background is transparent; the favicon has its own navy tile. At narrow mobile widths, use the symbol alongside accessible site-name text rather than shrinking the long subtitle. Keep clear space around the artwork and retain its aspect ratio.

No live website changes are included in this package.
