#let config(
  title: none,
  authors: (),
  abstract: [],
  class: (),
  doc,
) = {
  set page(
    header: context {
      if counter(page).get().first() > 1 {
        for author in authors {
          author.name.first() + ". "
          
          let split = author.name.split(" ")
          let s = 1
          while s < split.len() {
            split.at(s) +" "
            s += 1
          }
          
        }
        h(1fr)
        title
        linebreak()
        v(-9pt)
        line(length: 100%, stroke: 0.5pt)
      }
    },
    footer: context {
      if counter(page).get().first() > 1 {
        h(1fr)
        "Page " + counter(page).display()
      }
    },
  )
  set heading(numbering: "1.a")

  set align(center)
  v(10pt)

  text(18pt, smallcaps("Université de Genève"))
  
  v(15pt)
  
  text(14pt, smallcaps(class.name))
  linebreak()
  text(14pt, class.id)

  v(15pt)

  line(length: 100%, stroke: 2pt)
  text(size: 18pt, weight: "bold")[#title]
  line(length: 100%, stroke: 2pt)

  v(15pt)

  let count = authors.len()
  let ncols = calc.min(count, 3)
  grid(
    columns: (1fr,) * ncols,
    row-gutter: 24pt,
    ..authors.map(author => [
      #author.name \
      #author.affiliation \
      #link("mailto:" + author.email)
    ])
  )

  v(4fr)
  let date = datetime.today()
  date.display("[month repr:long] [year]")
  v(1fr)  

  image("images/unige_csd.png", width: 50%)

  v(0.3fr)

  pagebreak()
  counter(page).update(2)

  set align(left)
  set par(justify: true)
  doc
}
