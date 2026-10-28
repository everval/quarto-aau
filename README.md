# AAU formats for Quarto

> **Unofficial:** made by [J. Eduardo Vera-Valdés](https://everval.github.io), not by AAU Kommunikation.

A [Quarto](https://quarto.org) extension in the Aalborg University visual identity (AAU colours, the Barlow typeface, and the AAU logo) with two formats:

- `aau-revealjs`: lecture slides.
- `aau-typst`: PDF documents such as exercise sheets and handouts.

## Installing

**Start a new presentation** (copies the extension, a starter presentation, and a starter exercise sheet `exercises.qmd`):

```bash
quarto use template <github-user>/quarto-aau
```

**Add it to an existing folder or project:**

```bash
quarto add <github-user>/quarto-aau
```

Until the repository is on GitHub, use the local path instead, e.g. `quarto add ../quarto-aau`.

Both commands copy the extension into an `_extensions/` folder next to your document. Commit that folder with your project so it renders anywhere.

## Using

**Slides:**

```yaml
format:
  aau-revealjs:
    footer: Course Name
```

Defaults: slide numbers, scrollable slides, speaker notes (press `S`), a table of contents ("Outline") from the `#` section titles, wrapped code, MathJax, and a single self-contained HTML file.

**Exercise sheets and other PDFs:**

```yaml
format: aau-typst
```

Defaults: A4, Barlow 11pt, AAU logo in the top-right corner, a title block in AAU Blå, page numbers ("1 / 4"), shaded code blocks, and tables with an AAU Blå header line. Barlow is bundled in the extension (`fonts/`, SIL Open Font License), so nothing needs to be installed.

In both formats, the usual Quarto options still work and override the defaults, e.g. `toc: false`, `fontsize: 12pt`, or `margin: {x: 2cm}`.

## Styling

- **Definitions and theorems:** a block quote with a level-3 heading.

  ```markdown
  > ### Definition
  > A **definition** written as a block quote.
  ```

- **Coloured text:** `[important]{.aau-orange}`. Available: `aau-blue`, `aau-sapphire`, `aau-azure`, `aau-petroleum`, `aau-pine`, `aau-orange`, `aau-watermelon`, `aau-coral`, `aau-hazelnut`, `aau-moss`, `aau-gray`.

- **Overriding the defaults:** create your own `.scss` and add it after the extension's theme. Every variable can be changed:

  ```yaml
  format:
    aau-revealjs:
      theme: [default, _extensions/aau/aau.scss, custom.scss]
  ```

  ```scss
  /*-- scss:defaults --*/
  $aau-gradient: false;               // plain white background
  $presentation-font-size-root: 36px; // larger text (default 32px)
  ```

## Colours

| Name | HEX | Source |
|------|-----|--------|
| AAU Blå | `#211A52` | Official RGB logo |
| Sapphire | `#007FA3` | aau.dk |
| Azure | `#008BB2` | aau.dk |
| Petroleum green | `#0E8563` | aau.dk |
| Pine green | `#0E8583` | aau.dk |
| Orange | `#BB5B17` | aau.dk |
| Watermelon | `#CC445B` | aau.dk |
| Coral | `#E74B65` | aau.dk |
| Hazelnut | `#A16547` | aau.dk |
| Moss | `#97701F` | aau.dk |

The secondary colours match the CMYK values in AAU's official swatch file. The background gradient (`#C4F4F1` → `#7BA5E4`) uses light tints from aau.dk. The typeface is [Barlow](https://fonts.google.com/specimen/Barlow), loaded from Google Fonts, with Arial as fallback, following the [AAU design guide](https://www.aaukommunikation.aau.dk/design-og-skabeloner).

## License

The code and templates are released under the [MIT License](LICENSE), with two exceptions:

- **The AAU logo** (`_extensions/aau/logo.png`) is a trademark of Aalborg University. It is included only for use in AAU teaching and communication material, following AAU's design guidelines, and is not covered by the MIT License.
- **The Barlow typeface** (`_extensions/aau/fonts/`) is licensed under the [SIL Open Font License 1.1](_extensions/aau/fonts/OFL.txt).
