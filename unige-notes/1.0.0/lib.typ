#import "@preview/cetz:0.2.2": canvas, plot
#import "@preview/fletcher:0.5.1" as fletcher: diagram, node, edge

#let config(
  title: none,
  author: none,
  class: none,
  professor: none,
  semester: none,
  doc
) = {
  set text(font: "New Computer Modern")
  set align(center)

  let sem_title = if calc.even(semester) {
    "Spring"
  } else {
    "Fall"
  } + " " + datetime.today().display("[year]")

  set document(title: class + " Notes - " + sem_title)
  set page(
    header: context {
      if counter(page).get().first() > 7 {
        let elems = query(selector(heading).before(here()))
        let notes = smallcaps(class)
        if elems.len() == 0 {
          align(right, notes)
        } else {
          let body = elems.last().body
          sem_title + h(1fr) + notes + h(1fr) + body
        }
      }
    },
    footer: context {
      let current = counter(page).get().first()
      if current > 6 {
        if calc.even(current) [
          #text(size: 11pt, weight: "regular")[#counter(page).display("1")]
          #h(1fr)
        ] else [
          #h(1fr)
          #text(size: 11pt, weight: "regular")[#counter(page).display("1")]
        ]
      }
    }
  )

  v(1fr)
  text(size: 18pt, weight: "thin")[
    #class \
    Prof. #professor #sym.bar.h UNIGE
  ]
  v(10pt)
  "Notes by" + author
  v(10pt)
  "Computer Science Master " + sym.bar.h + " Semester " + str(semester)
  linebreak()
  sem_title
  v(1fr)

  set align(left)
  pagebreak()
  pagebreak()

  "This document is based on the work on Joachim Favre, a friend who studied at EPFL and wrote all of his classes notes using this method. To view the original repository, please visit the link bellow:"

  align(center)[#link("https://github.com/JoachimFavre/UniversityNotes")]

  "I made this document for my own use, but I thought that typed notes might be of interest to others. There are mistakes, it is impossible not to make any. If you find some, please feel free to share them with me (grammatical and vocabulary errors are of course also welcome). You can contact me at the following e-mail address:"

  align(center)[#text(font: "PT Mono", size: 9pt)[#link("mailto:tanguy.cavagna@etu.unige.ch")]]

  "If you did not get this document through my GitHub repository, then you may be interested by the fact that I have one on which I put those typed notes and their \LaTeX{} code. Here is the link (make sure to read the README to understand how to download the files you're interested in):"

  align(center)[#link("https://github.com/ToguyC/Computer-Science-Master-Notes")]

  "Please note that the content does not belong to me. I have made some structural changes, reworded some parts, and added some personal notes; but the wording and explanations come mainly from the Professor, and from the book on which they based their course."

  "Since you are reading this, I will give you a little advice. Sleep is a much more powerful tool than you may imagine, so do not neglect a good night of sleep in favour of studying (especially the night before an exam). I wish you to have fun during your exams."

  v(1fr)
  align(center)[#text(style: "italic")[Version 2024-10-03]]
  v(1fr)

  pagebreak()
  pagebreak()

  v(1fr)
  grid(
    columns: (1fr, 0.5fr, 1fr),
    "",
    "",
    text(style: "italic")[To Gilles Castel, whose work has inspired me this note taking method. \ \ Rest in peace, nobody deserves to go so young.]
  )
  v(1fr)

  pagebreak()
  pagebreak()

  outline(title: [Table of Contents])

  pagebreak()
  doc
}

#let chapterHeader(date: none, course: ()) = {
  grid(
    columns: (1fr, auto),
    align: horizon + center,
    column-gutter: 5pt,
    line(length: 100%, stroke: rgb("#004A7F")),
    text(fill: rgb("#004A7F"), size: 10pt)[#date.display("[weekday] [day] [month repr:long] [year]") #sym.bar.h #text(weight: "bold")[Course #course.number : #course.name]]
  )
}

#let parag(title: none, body) = {
  grid(
    columns: (3cm, auto),
    column-gutter: 0.3cm,
    [*#title*],
    body
  )
}

#let subparag(title: none, body) = {
  grid(
    columns: (2cm, auto),
    column-gutter: 0.3cm,
    grid.vline(x: 0, position: left, stroke: 0.5pt),
    h(0.3cm) + text(size: 8pt)[_ #title _],
    body
  )
}

#let important(body) = {
  text(weight: "bold", fill: rgb("#004A7F"))[#body]
}

#show: doc => config(
  author: [Tanguy Cavagna],
  class: [Data Science],
  professor: [Stéphane Marchand-Maillet],
  semester: 1,
  doc
)

#chapterHeader(
  date: datetime(year: 2024, month: 9, day: 17),
  course: (name: [Concepts fondamentaux et applications], number: 1)
)

= Organisation

awdoiajwdoiawjdoiawjd

#parag(title: "Ouvrages de références")[
  - *awdoiajwdoiawjdoiawjd*: awodij
  - #important[wadoawdioj / awd $a*2+5^5$]

  #subparag(title: "Question")[
  ]

  #let style = (stroke: black, fill: rgb(0, 0, 200, 75))

  #canvas(length: 1cm, {
    plot.plot(size: (8, 6),
      x-tick-step: none,
      x-ticks: ((-calc.pi, $-pi$), (0, $0$), (calc.pi, $pi$)),
      y-tick-step: 1,
      {
        plot.add(
          style: style,
          domain: (-calc.pi, calc.pi), calc.sin)
        plot.add(
          hypograph: true,
          style: style,
          domain: (-calc.pi, calc.pi), calc.cos)
        plot.add(
          hypograph: true,
          style: style,
          domain: (-calc.pi, calc.pi), x => calc.cos(x + calc.pi))
      })
  })

  #canvas({
    plot.plot(size: (8, 6),
    {
      plot.add(domain: (0.1, 5), x => 1 / x)
    }
    )
  })

  $tilde(a)$
]