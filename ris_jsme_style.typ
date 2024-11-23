/* --------------------------------------------------
             TYPST JSME BIB STYLE FILE
  file: ris_jsme_style.typ
  author: T.Hashimoto
-------------------------------------------------- */

// IMPORT PACKAGE
#import "@preview/unichar:0.3.0" : *

// TAG LIST

#let tag_list = ([A1],[A2],[A3],[A4],[A5],[A6],[AB],[AD],[AN],[AU],[AV],[BT],[C1],[C2],[C3],[C4],[C5],[C6],[C7],[C8],[CA],[CL],[CN],[CP],[CR],[CT],[CY],[DA],[DB],[DI],[DO],[DO],[DP],[DS],[ED],[EP],[ER],[ET],[FD],[H1],[H2],[ID],[IP],[IS],[J1],[J2],[JA],[JF],[JO],[K1],[KW],[L1],[L2],[L3],[L4],[LA],[LB],[LK],[LL],[M1],[M2],[M3],[N1],[N2],[NO],[NV],[OL],[OP],[PA],[PB],[PM],[PM],[PP],[PY],[RD],[RI],[RN],[RP],[RT],[SE],[SF],[SL],[SN],[SP],[SR],[ST],[SV],[T1],[T2],[T3],[TA],[TI],[TT],[TY],[U1],[U2],[U6],[UR],[VL],[VO],[WP],[WT],[WV],[Y1],[Y2],[YR])

// --------------------------------------------------

// content型からstr型へ変換
#let from_content_to_string(body) = {
  let contents = body
  let output_str = ""
  for value in body.children{
    if value.has("text"){//テキスト
      output_str += value.text
    }
    else if value == [ ]{//空白文字
      output_str += " "
    }
    else if value.has("dest"){//url
      output_str += value.dest
    }
  }
  return output_str
}

// ris型からtagとその内容をリストへ追加
#let make_bib_list-en(ris) = {
  let output = ()
  let line_output1 = ()
  let line_output2 = ()
  let line_output2_str = ""
  let now_pos = 0
  let now_value_num = 0
  //for value in ris.fields().children {
  for value in ris.children {

    if now_pos == 0{
      if value != [ ] {
        if tag_list.contains(value){
          now_pos = 1
          line_output1.push(value)
        }

      }
    }
    else if now_pos == 1{
      if value == [-]{
        now_pos = 2
      }
    }
    else if now_pos == 2{
      if value == [ ]{
        now_pos = 3
      }
    }
    else if now_pos == 3{
      if value != [ ]{
        line_output2_str += value
      }
      else{
        if now_value_num < ris.children.len() - 1{
          if tag_list.contains(ris.children.at(now_value_num + 1)){
            line_output2.push(from_content_to_string(line_output2_str))
            line_output2_str = ""
            now_pos = 0
          }
          else{
            line_output2_str += value
          }
        }

      }
    }
    now_value_num += 1
  }
  output.push(line_output1)
  output.push(line_output2)
  return output
}

//2次元配列 arr の1列目と find_term が同じものの2列目を find_arr に返す
#let find_array(arr, find_term) = {
  let find_arr = ()
  let find_num = 0
  for value in arr.at(0){
    if value  == find_term{
      find_arr.push(arr.at(1).at(find_num))
    }
    find_num += 1
  }
  return find_arr
}

//入力された文字列が日本語かどうかを判定
#let check_japanese(str) = {
  let arr = str.clusters()
  let tmp = ""
  for value in arr{
    tmp = codepoint(value).block.name
    if tmp == "Hiragana" or tmp == "Katakana" or tmp == "CJK Unified Ideographs" or tmp == "Halfwidth and Fullwidth Forms"{
      return true
    }
  }
  return false
}

#let check_japanese_ris(ris_list) = {
  let output = false

  for value in ris_list.at(1){
    if check_japanese(value){
      output = true
    }
  }
  return output
}

// --------------------------------------------------

#let authorlist_to_author(author, is_japanese) = {
  let author_arr = author.split(",")

  let output_str = author_arr.remove(0)//名字の追加

  if is_japanese{//日本語のとき

    for value in author_arr{

      let value_arr = value.split(" ")//スペースで分割
      for value2 in value_arr{
        if value2 != ""{
          output_str += value2
        }
      }
    }

  }
  else{//英語のとき

    if author_arr.len() != 0{
      output_str += ","
    }

    for value in author_arr{

      let value_arr = value.split(" ")//スペースで分割
      for value2 in value_arr{
        if value2 != ""{
          output_str += " " + upper(value2.first()) + "."
        }
      }
    }
  }

  output_str
}

// --------------------------------------------------
//  TYPE ELEMENT FUNCTION
// --------------------------------------------------

#let make_author(ris_list, is_japanese) = {
  let output_str = ""
  let author = find_array(ris_list, [AU])
  author += find_array(ris_list, [A1])
  author += find_array(ris_list, [A2])
  author += find_array(ris_list, [A3])
  author += find_array(ris_list, [A4])
  let author_num = author.len() - 1
  let num = 0

  for value in author{
    let tmp = authorlist_to_author(value, is_japanese)
    output_str += tmp
    if num == author_num - 1{
      let tmp2 = " and "
      if is_japanese{
        tmp2 = ", "
      }
      output_str += tmp2
    }
    else{
      output_str += ", "
    }
    num += 1
  }

  return output_str
}

#let make_page(ris_list) = {

  let output_str = ""
  let start_page = find_array(ris_list, [SP])
  let end_page = find_array(ris_list, [EP])

  if start_page.len() != 0{
    if end_page.len() != 0{
      if start_page.at(0) == end_page.at(0){
        output_str += "p. " + start_page.at(0) + ", "
      }
      else{
        output_str += "pp. " + start_page.at(0) + "–" + end_page.at(0) + ", "
      }
    }
    else{
      output_str += "p. " + start_page.at(0) + ", "
    }
  }
  else if end_page.len() != 0{
    output_str += "p. " + end_page.at(0) + ", "
  }

  return output_str
}

#let make_title(ris_list, is_japanese) = {

  let output_str = ""
  let first_str = true

  let tmp = find_array(ris_list, [TI])
  tmp += find_array(ris_list, [T1])

  if tmp.len() != 0{

    if is_japanese{//日本語のとき
      output_str += tmp.at(0)
    }
    else{//英語のとき
      let title_arr = tmp.at(0).split("{")
      for value in title_arr{

        tmp = value.split("}")
        if tmp.len() == 1{//通常処理

          if first_str{//先頭文字のみ大文字
            first_str = false
            output_str += upper(tmp.at(0).first()) + lower(tmp.at(0).slice(1, tmp.at(0).len()))
          }else{
            output_str += lower(tmp.at(0))
          }

        }else{//例外処理
          first_str = false
          output_str += tmp.at(0)
          output_str += lower(tmp.at(1))
        }
      }
    }

  }

  return output_str

}

#let make_period(str) = {
  let output_str = str

  if output_str.len() > 2{
    output_str = str.slice(0, str.len() - 2)
    output_str += "."
  }

  return output_str
}

#let make_note(str, ris_list) = {

  let output_str = str
  let str_rm = true

  let tmp = find_array(ris_list, [NO])
  tmp += find_array(ris_list, [N1])
  tmp += find_array(ris_list, [N2])
  for value in tmp{
    if value == "(in Japanese)" and str_rm{
      str_rm = false
      if str.len() > 2{
        output_str = output_str.slice(0, output_str.len() - 2) + " "
      }
    }
    output_str += value + ", "
  }

  return output_str
}

#let change_number_to_month(month_str) = {
  if month_str == "1"{
    return "January"
  }
  else if month_str == "2"{
    return "February"
  }
  else if month_str == "3"{
    return "March"
  }
  else if month_str == "4"{
    return "April"
  }
  else if month_str == "5"{
    return "May"
  }
  else if month_str == "6"{
    return "June"
  }
  else if month_str == "7"{
    return "July"
  }
  else if month_str == "8"{
    return "August"
  }
  else if month_str == "9"{
    return "September"
  }
  else if month_str == "10"{
    return "October"
  }
  else if month_str == "11"{
    return "November"
  }
  else if month_str == "11"{
    return "December"
  }
  else{
    return none
  }
}

#let make_year_to_english(year_str) = {
  let output_str = ""
  let year_arr = year_str.split("/")

  if year_arr.len() == 3{
    output_str = year_arr.at(2)
    output_str += " " + change_number_to_month(year_arr.at(1)) + ", "
    output_str += year_arr.at(0)
  }
  else if year_arr.len() == 2{
    output_str = change_number_to_month(year_arr.at(1)) + ", "
    output_str += year_arr.at(0)
  }
  else{
    output_str = year_str
  }
  return output_str
}

#let make_year_to_japanese(year_str) = {
  let output_str = ""
  let year_arr = year_str.split("/")

  if year_arr.len() == 3{
    output_str = year_arr.at(0) + "年"
    output_str += year_arr.at(1) + "月"
    output_str += year_arr.at(2) + "日"
  }
  else if year_arr.len() == 2{
    output_str = year_arr.at(0) + "年"
    output_str += year_arr.at(1) + "月"
  }
  else{
    output_str = year_str
  }
  return output_str
}

// --------------------------------------------------
//  TYPE FUNCTION
// --------------------------------------------------

#let jsme_type_JOUR(ris_list, is_japanese) = {

  let output_str = ""
  let year_num1 = -1
  let year_num2 = -1

  //著者名
  output_str += make_author(ris_list, is_japanese)

  //タイトル
  output_str += make_title(ris_list, is_japanese) + ", "

  //ジャーナル
  let tmp = find_array(ris_list, [JO])
  tmp += find_array(ris_list, [JA])
  tmp += find_array(ris_list, [T2])
  if tmp.len() != 0{
    output_str += tmp.at(0) + ", "
  }

  //vol.
  tmp = find_array(ris_list, [VL])
  tmp += find_array(ris_list, [VO])
  if tmp.len() != 0{
    output_str += "Vol. " + tmp.at(0) + ", "
  }

  //No.
  tmp = find_array(ris_list, [IS])
  if tmp.len() != 0{
    output_str += "No. " + tmp.at(0) + ", "
  }

  //year
  tmp = find_array(ris_list, [PY])
  tmp += find_array(ris_list, [Y1])
  tmp += find_array(ris_list, [Y2])
  if tmp.len() != 0{
    if output_str.len() > 2{
      if output_str.slice(output_str.len()-2, output_str.len()) == ", "{
        output_str = output_str.slice(0, output_str.len()-2) + " "
      }
    }
    output_str += "("
    year_num1 = output_str.len()
    output_str += make_year_to_english(tmp.at(0))
    year_num2 = output_str.len()
    output_str += "), "
  }

  //ページ番号
  output_str += make_page(ris_list)

  //ノート
  output_str = make_note(output_str, ris_list)

  //最終文字調整
  output_str = make_period(output_str)

  return (output_str, (year_num1, year_num2))
}

#let jsme_type_BOOK(ris_list, is_japanese) = {

  let output_str = ""
  let year_num1 = -1
  let year_num2 = -1

  //著者名
  output_str += make_author(ris_list, is_japanese)

  //タイトル
  output_str += make_title(ris_list, is_japanese) + ", "

  //year
  let tmp = find_array(ris_list, [PY])
  tmp += find_array(ris_list, [Y1])
  tmp += find_array(ris_list, [Y2])
  if tmp.len() != 0{
    if output_str.len() > 2{
      if output_str.slice(output_str.len()-2, output_str.len()) == ", "{
        output_str = output_str.slice(0, output_str.len()-2) + " "
      }
    }
    output_str += "("
    year_num1 = output_str.len()
    output_str += make_year_to_english(tmp.at(0))
    year_num2 = output_str.len()
    output_str += "), "
  }

  //ページ番号
  output_str += make_page(ris_list)

  //出版社
  let tmp = find_array(ris_list, [PB])
  tmp += find_array(ris_list, [T2])
  if tmp.len() != 0{
    output_str += tmp.at(0) + ", "
  }

  //ノート
  output_str = make_note(output_str, ris_list)

  //最終文字調整
  output_str = make_period(output_str)

  return (output_str, (year_num1, year_num2))
}

#let jsme_type_ELEC(ris_list, is_japanese) = {

  let output_str = ""
  let year_num1 = -1
  let year_num2 = -1

  //著者名
  output_str += make_author(ris_list, is_japanese)

  //タイトル
  output_str += make_title(ris_list, is_japanese) + ", "

  //URL
  let tmp = find_array(ris_list, [UR])
  if tmp.len() != 0{
    if is_japanese{
      output_str += "<" + tmp.at(0) + "> "
    }
    else{
      output_str += "available from <" + tmp.at(0) + ">, "
    }
  }

  //year
  let tmp = find_array(ris_list, [Y2])
  tmp += find_array(ris_list, [PY])
  tmp += find_array(ris_list, [Y1])
  if tmp.len() != 0{
    if output_str.len() > 2{
      if output_str.slice(output_str.len()-2, output_str.len()) == ", "{
        output_str = output_str.slice(0, output_str.len()-2) + " "
      }
    }
    if is_japanese{
      output_str += "(参照日 "
      year_num1 = output_str.len()
      output_str += make_year_to_japanese(tmp.at(0))
      year_num2 = output_str.len()
      output_str += "), "
    }
    else{
      output_str += "(accessed on "
      year_num1 = output_str.len()
      output_str += make_year_to_english(tmp.at(0))
      year_num2 = output_str.len()
      output_str += "), "
    }

  }

  //ノート
  output_str = make_note(output_str, ris_list)

  //最終文字調整
  output_str = make_period(output_str)

  return (output_str, (year_num1, year_num2))
}

#let jsme_type_PAT(ris_list, is_japanese) = {

  let output_str = ""
  let year_num1 = -1
  let year_num2 = -1

  //著者名
  output_str += make_author(ris_list, is_japanese)

  //タイトル
  output_str += make_title(ris_list, is_japanese) + ", "

  //特開平
  let tmp = find_array(ris_list, [DP])
  if tmp.len() != 0{
    if is_japanese{
      output_str += "特開平 " + tmp.at(0) + ", "
    }
    else{
      output_str += "Japanese patent disclosure " + tmp.at(0) + ", "
    }
  }

  //year
  let tmp = find_array(ris_list, [Y2])
  tmp += find_array(ris_list, [PY])
  tmp += find_array(ris_list, [Y1])
  if tmp.len() != 0{
    if output_str.len() > 2{
      if output_str.slice(output_str.len()-2, output_str.len()) == ", "{
        output_str = output_str.slice(0, output_str.len()-2) + " "
      }
    }
    output_str += "("
    year_num1 = output_str.len()
    output_str += make_year_to_english(tmp.at(0))
    year_num2 = output_str.len()
    output_str += "), "
  }

  //ノート
  output_str = make_note(output_str, ris_list)

  //最終文字調整
  output_str = make_period(output_str)

  return (output_str, (year_num1, year_num2))
}

#let jsme_author(ris_list, is_japanese) = {

  let output_str = ""
  let author = find_array(ris_list, [AU])
  author += find_array(ris_list, [A1])
  author += find_array(ris_list, [A2])
  author += find_array(ris_list, [A3])
  author += find_array(ris_list, [A4])
  let author_num = author.len()
  let num = 0

  let output_author = ()
  for value in author{
    output_author.push(value.split(",").at(0))
  }
  if is_japanese{//日本語のとき
    if author_num == 0{//著者が書かれていないとき

    }
    else if author_num == 1{//著者数が一人のとき
      output_str = output_author.at(0)
    }
    else if author_num == 2{//著者が二人のとき
      output_str = output_author.at(0) + ", " + output_author.at(1)
    }
    else{//著者が三人以上のとき
      output_str = output_author.at(0) + "他"
    }
  }
  else{//英語のとき
    if author_num == 0{//著者が書かれていないとき

    }
    else if author_num == 1{//著者数が一人のとき
      output_str = output_author.at(0)
    }
    else if author_num == 2{//著者が二人のとき
      output_str = output_author.at(0) + " and " + output_author.at(1)
    }
    else{//著者が三人以上のとき
      output_str = output_author.at(0) + " et al."
    }
  }


  return  output_str

}

#let jsme_year(ris_list) = {
  let tmp = find_array(ris_list, [PY])
  tmp += find_array(ris_list, [Y1])
  tmp += find_array(ris_list, [Y2])

  if tmp.len() != 0{
    return tmp.at(0)
  }
  else{
    return none
  }

}

#let jsme_yomi(ris_list, is_japanese) = {
    let tmp =  make_author(ris_list, is_japanese)

    if tmp.len() == 0{
      return none
    }else{
      return tmp.slice(0, tmp.len() - 2)
    }

}


// --------------------------------------------------
//  MAIN FUNCTION
// --------------------------------------------------

#let from_ris_to_biblist(ris) = {

  //出力するリスト
  let it_arr = ()
  let it_str = ""
  let author = ""
  let year = ""
  let year_range = ()
  let yomi = ""

  //ris形式をリストへ変換
  let ris_list = make_bib_list-en(ris)
  //文献typeを取得
  let TYPE = find_array(ris_list, [TY]).at(0)
  //日本語が含まれているかどうか
  let is_japanese = check_japanese_ris(ris_list)

  if TYPE == "JOUR"{
    it_arr = jsme_type_JOUR(ris_list, is_japanese)
  }
  else if TYPE == "BOOK"{
    it_arr = jsme_type_BOOK(ris_list, is_japanese)
  }
  else if TYPE == "ELEC" or TYPE == "WEB"{
    it_arr = jsme_type_ELEC(ris_list, is_japanese)
  }
  else if TYPE == "PAT"{
    it_arr = jsme_type_PAT(ris_list, is_japanese)
  }
  else{
    panic("実装されていないtypeが渡されました．typeを変更するか，bib-itemの直書き形式で書き直してください．")
  }

  //出力準備
  it_str = it_arr.at(0)
  year_range = it_arr.at(1)
  author = jsme_author(ris_list, is_japanese)
  year = jsme_year(ris_list)
  yomi = jsme_yomi(ris_list, is_japanese)

  return (it_str, year_range, author, year, yomi)
}
