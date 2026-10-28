// AAU colours (AAU Blå from the official RGB logo; secondary colours from aau.dk)
#let aau-blue = rgb("#211A52")
#let aau-sapphire = rgb("#007FA3")
#let aau-gray = rgb("#667985")
#let aau-light-gray = rgb("#F1F1F3")

#let article(
  title: none,
  subtitle: none,
  authors: none,
  keywords: (),
  date: none,
  abstract-title: none,
  abstract: none,
  thanks: none,
  cols: 1,
  lang: "en",
  region: "US",
  font: none,
  fontsize: 11pt,
  title-size: 1.8em,
  subtitle-size: 1.2em,
  heading-family: none,
  heading-weight: "semibold",
  heading-style: "normal",
  heading-color: aau-blue,
  heading-line-height: 0.65em,
  mathfont: none,
  codefont: none,
  linestretch: 1,
  sectionnumbering: none,
  linkcolor: none,
  citecolor: none,
  filecolor: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  doc,
) = {
  set document(title: title, keywords: keywords)
  set document(
    author: authors.map(author => content-to-string(author.name)).join(", ", last: " & "),
  ) if authors != none and authors != ()
  set par(justify: false, leading: linestretch * 0.65em)
  set text(lang: lang, region: region, size: fontsize)
  set text(font: font) if font != none
  show math.equation: set text(font: mathfont) if mathfont != none
  show raw: set text(font: codefont) if codefont != none

  set page(
    numbering: "1 / 1",
    footer: context align(center, text(size: 0.85em, fill: aau-gray, counter(page).display("1 / 1", both: true))),
  )

  set heading(numbering: sectionnumbering)
  show heading: set text(fill: heading-color, weight: heading-weight)
  show heading: set block(above: 1.4em, below: 0.8em)

  show link: set text(fill: if linkcolor != none { rgb(content-to-string(linkcolor)) } else { aau-sapphire })
  show ref: set text(fill: rgb(content-to-string(citecolor))) if citecolor != none

  show raw.where(block: true): block.with(fill: aau-light-gray, inset: 8pt, radius: 3pt, width: 100%)

  show table.cell.where(y: 0): set text(fill: aau-blue, weight: "semibold")
  set table(stroke: (x, y) => if y == 0 { (bottom: 1pt + aau-blue) } else { (bottom: 0.4pt + aau-light-gray.darken(10%)) })

  if title != none {
    block(width: 100%, below: 1.5em)[
      #set par(leading: heading-line-height)
      #text(size: title-size, weight: "bold", fill: aau-blue)[#title #if thanks != none {
        footnote(thanks, numbering: "*")
        counter(footnote).update(n => n - 1)
      }]
      #if subtitle != none {
        v(0.2em)
        text(size: subtitle-size, fill: aau-sapphire)[#subtitle]
      }
      #if authors != none and authors != () {
        v(0.4em)
        text(size: 0.9em, fill: aau-gray)[
          #authors.map(author => [#author.name #if author.email != [] [· #author.email]]).join([ \ ])
          #if date != none [ · #date]
        ]
      }
      #v(0.3em)
      #line(length: 100%, stroke: 1.5pt + aau-blue)
    ]
  }

  if abstract != none {
    block(inset: (x: 1em))[#text(weight: "semibold")[#abstract-title] #h(1em) #abstract]
  }

  if toc {
    block(above: 0em, below: 2em)[
      #outline(title: toc_title, depth: toc_depth, indent: toc_indent)
    ]
  }

  doc
}

#set table(inset: 6pt)
