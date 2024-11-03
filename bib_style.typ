
#let bibliography-list(lang: "jp", body) = {

  if lang == "jp"{
    heading("文　　　献", numbering: none)
  }
  else if lang == "en"{
    heading("References", numbering: none)
  }
  set par(first-line-indent: 0em)
  set par(leading: 1em)

  show figure.where(kind: "bib"): it =>{
    align(left, it)
    v(-2em)
  }

  body
}

#let bib-item(it, key: none, label: none) = {
    set par(hanging-indent: 2em)
    let key_str = "(" + key + ")"

    [#figure(it, kind: "bib", supplement: key_str, numbering: "a")#label]
    linebreak()
}
