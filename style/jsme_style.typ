// ==================================================
//                jsme_style.typ
//
// first version: 2024/11/8   Takeru HASHIMOTO
// ==================================================


// import equate package
#import "@preview/equate:0.2.1": equate

// setting font
#let gothic = ("Harano Aji Gothic")
#let mincho = ("Harano Aji Mincho")
#let english = ("Times New Roman")
#let mathf = ("Latin Modern Math")

//setting font size
#let title_fontsize = 14pt
#let subtitle_fontsize = 12pt
#let text_fontsize = 9.6pt
#let english_thanks_fontsize = 8pt

#let jsme_init(body) = {

  // setting japanese language
  set text(lang: "ja")
  // setting page size
  set page(
    paper:"a4",
    margin: (left: 20mm, right: 20mm, top: 20mm, bottom: 20mm),
    numbering: none,
    number-align: center,
  )

  // setting normal font
  set text(font: (english, mincho), size: text_fontsize, cjk-latin-spacing: auto, weight: 250)
  // setting line spacing
  set par(leading: english_thanks_fontsize)
  // set heading
  set heading(numbering: "1·1")
  show heading.where(level: 1): it => {// if header level 1 ...
    v(1em)
    set align(center)
    set text(size: text_fontsize, weight: "bold", font: (english, gothic))
    if it.numbering != none{
      counter(heading).display() + [.　]
    }
    else{
      line(length: 100%, stroke: 0pt)
    }
    it.body
    v(0.5em)
  }
  show heading.where(level: 2): it => {// if header level 2 ...
    set align(left)
    v(1em)
    set text(size: text_fontsize, weight: "bold", font: (english, gothic))
    counter(heading).display() + [　]
    it.body
  }
  show heading.where(level: 3): it => {// if header level 3 ...
    set align(left)
    v(1em)
    set text(size: text_fontsize, weight: "bold", font: (english, gothic))
    counter(heading).display() + [　]
    it.body
  }
  // set footnote line
  set footnote.entry(separator: line(length: 100%, stroke: 0.5pt))
  // set enumering style
  set enum(numbering: "　（1）")

  // set table and figure style
  set table(
    stroke: (top: 0.5pt + black, bottom: 0.5pt + black, right: none, left: none),
    align: (x, y) => (
      if x > 0 { center }
      else { left }
    )
  )
  show figure.where(// if figure kind is table ...
    kind: table
  ): set figure.caption(position: top)
  show figure.where(
    kind: table
  ): set figure(supplement: "Table")
  show figure.where(// if figure kind is image ...
    kind: image
  ): set figure(supplement: "Fig.")
  set figure.caption(separator: [　])
  show figure.caption: it => {// if figure caption is image ...
    set text(size: 9.5pt)
    set par(leading: 4.5pt, justify: true)
    grid(
      columns: 2,
      [#it.supplement #it.counter.display()　],
      align(left)[#it.body]
    )
  }
  //setting equation
  set math.equation(numbering: "(1)")// equation numbering
  show math.equation.where(block: true): set align(left)// set block equation align
  show math.equation.where(block: true): it => {// set block equation space
    grid(
      columns: (2em, auto),
      [],it
    )
  }
  // setting ref
  // In reference, set figures and tables to 図 or 表
  set ref(supplement: it=>{
    let body-func = it.body.func()
    if body-func == table{
      [図]
    }else if body-func == image{
      [表]
    }else{
      it.supplement
    }
  })

  //setting strong text
  show strong: set text(font: (english, mincho), weight: "bold")

  body
}

#let jsme_title(
  title: [],
  subtitle: [],
  authors: (),
  english_title: [],
  english_subtitle: [],
  abstruct: [],
  keywords: (),
  email: "",
  body) = {

    //setting document
    set document(author: authors.map(a => a.name), title: title)

    //setting title
    v(5em)
    set text(font: (english, gothic))
    align(center)[
      #text(size: title_fontsize, weight: "bold", title)
    ]
    v(-0.75em)
    align(center)[
      #text(size: subtitle_fontsize, weight: "bold", subtitle)
    ]
    set text(font: (english, mincho))
    set align(right)
    v(0.25em)

    //setting DOI
    set footnote(numbering: (..args) => {})
    footnote("No.xx-xxxx [DOI: 10.1299/transjsme.1x-xxxxx]")
    counter(footnote).update(0)

    //setting footnote style
    set footnote(numbering: (..args) => {
        args.pos().map(x => {
          "*" + str(x)
        }).join(" | ")
    })
    //setting authors
    let value = 0
    let input_value = ()
     while value < authors.len(){
      set text(size: subtitle_fontsize)
      authors.at(value).name
      if (authors.at(value).thanks != "") {
        let check_thanks_duplicate = -1
        let check_num = 0
        while check_num < value{
          if authors.at(value).thanks == authors.at(check_num).thanks{
             check_thanks_duplicate = check_num
          }
          check_num += 1
        }
        if check_thanks_duplicate == -1{//thanks was not duplicated
          footnote(text(font: (english, mincho), authors.at(value).thanks))
          input_value.insert(input_value.len(), value)
        }
        else{// thanks was duplicated
        check_thanks_duplicate = check_thanks_duplicate
          super("*" + str(check_thanks_duplicate + 1))
          input_value.insert(input_value.len(), check_thanks_duplicate)
        }
      }
      if (value != authors.len()-1) {
        [，]
      }
      value = value + 1
    }

    //setting english title
    set text(font: (english, gothic))
    align(center)[
      #text(size: subtitle_fontsize, weight: "bold", english_title)
    ]
    v(-0.75em)
    align(center)[
      #text(size: subtitle_fontsize, weight: "bold", english_subtitle)
    ]
    set text(font: (english, mincho))

    //setting english authors
    v(0.25em)
    let value = 0
    let foot_value = 0
    set align(center)
     while value < authors.len(){
      set text(size: subtitle_fontsize)
      authors.at(value).english_name
      if (authors.at(value).thanks != "") {
        super("*" + str(input_value.at(foot_value)+1))
        foot_value += 1
      }
      if (value != authors.len()-1) {
        if (value == authors.len()-2) {
          [ and ]
        }
        else{
          [, ]
        }

      }
      value = value + 1
    }

    //setting english thanks
    v(-0.5em)
    let value = 0
    let remove_value = ()
    while value < authors.len(){
      if remove_value.contains(value) == false {
        super("*" + str(input_value.at(value) + 1))
        let value2 = value + 1
        let output_val = ()
        output_val.insert(output_val.len(), input_value.at(value))
        while value2 < authors.len(){
          if authors.at(value).english_thanks == authors.at(value2).english_thanks{
            if output_val.contains(input_value.at(value2)) == false{
              super(",*" + str(input_value.at(value2) + 1))
              output_val.insert(output_val.len(), input_value.at(value2))
            }
            remove_value.insert(remove_value.len(), value2)
          }
          value2 += 1
        }
        super(" ")
        set text(size: english_thanks_fontsize)
        text(font: (english, mincho), authors.at(value).english_thanks)
        v(-0.75em)
        text(font: (english, mincho), authors.at(value).english_place)
        v(-0.75em)
      }
      value = value + 1

    }

    v(1em)
    text(font: english, weight: "bold")[Received: XXXX; Revised: XXXX; Accepted: XXXX]
    v(1em)

    set align(left)

    //setting abstruct
    if abstruct != [] {
      text(font: english, weight: "bold")[Abstruct\ ]
      abstruct
    }
    v(1em)

    //setting keywords
    set text(font: (english, mincho))
    let value = 0
    if keywords.len() != 0 {
      text(font: english, weight: "bold", style: "italic")[Keywords] + [ :　]
    }
    while value < keywords.len(){

      keywords.at(value)

      if value != keywords.len() - 1{
        [, ]
      }

      value = value + 1
    }

    if email != ""{
      set footnote(numbering: (..args) => {})
      footnote("E-mail of corresponding author: " + email)
    }
    set footnote(numbering: "1")
    v(0.5em)

    set par(leading: english_thanks_fontsize, first-line-indent: 1em)
    body
}

#let nonumber = <equate:revoke>
