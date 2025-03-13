#import "jsme_style.typ" : *
#import "bib-style/lib.typ" : *

#show: jsme_init
#import bib_setting_jsme: *
#show: bib_init
#show: equate.with(breakable: true, number-mode: "line")

#show: jsme_title.with(
  title: [投稿論文作成について],
  subtitle: [(日本機械学会指定テンプレートファイル利用について)],
  authors: (
    (
      name: "機械 太郎",
      english_name: "Taro KIKAI",
      thanks: "正員，日本機械学会(〒160-0016 東京都新宿区信濃町35)",
      english_thanks: "Japan Society of Mechanical Engineering",
      english_place: "35Shinanomachi,Shinjuku-kuTokyo160-0016,Japan"
    ),
    (
      name: "技術 さくら",
      english_name: "Sakura GIJYUTSU",
      thanks: "学生員，日本機械大学工学部(〒160-0001 東京都新宿区工学町1)",
      english_thanks: "Department of Mechanical Engineering, Kikai University",
      english_place: "1 Kogakumachi, Shinjuku-ku, Tokyo 160-0001, Japan"
    ),
    (
      name: "東京 花子",
      english_name: "Hanako TOKYO",
      thanks: "日本機械大学 工学部",
      english_thanks: "Department of Mechanical Engineering, Kikai University",
      english_place: "1 Kogakumachi, Shinjuku-ku, Tokyo 160-0001, Japan"
    ),
  ),
  english_title: [Making research paper],
  english_subtitle: [(About the use of the JSME specification template file)],
  abstruct: [The length of the abstract should be 200-300 words. In the beginning of the abstract, the subject of the paper should be stated clearly, together with its scope and objectives. Then, the methods, equipment, results and conclusions in the paper should be stated concisely in a sufficiently logical manner. The discussion on the results may also be stated to emphasize their importance appropriately.],
  keywords: ("Term1", "Term2", "Term3", "Term4", "...(Show five to ten key words)"),
  email: "taro@jsme.or.jp"
)

= 緒　　　言

このテンプレートファイルは，原稿体裁を整えて投稿することができるようにスタイルファイルとして，フォントサイズなどの書式を設定し，登録している．1行の文字数，1ページの行数など定められた形式で作成することができる．

本文の文字数は，1ページ当たり，50文字×46行×1段組で2300字とする．また，文章の区切りには全角の読点「，」（カンマ）と句点「．」（ピリオド）を用いる．カッコも全角入力する．

本文中の文字の書式は，明朝体・Serif系（Century，Times New Romanなど）を利用し，章節項については，ゴシック体を使用する．

= このテンプレートファイルの使い方

このテンプレートの表題（副題），著者名，本文などはあらかじめ本会指定のフォントサイズなどの書式が設定されている．この書式を崩さずに入力すれば，文字数，行数など定められた体裁で論文を作成することができる．しかし，絶対的な出来上がりのレベルを保証するものではないので，体裁が望むレベルに達しない場合には，使用の環境に合わせ，投稿者各自において微調整を行うなど，本会の論文集掲載の体裁に最も近い設定を行う必要がある．なお，書式を崩してしまった場合は，段落内にカーソルを置き，［書式設定］ツールバーの「スタイル」ボックスで，指定したいスタイルをクリックすると体裁を容易に整えることができる．

#pagebreak()
= 原稿執筆の手引き
#v(-15pt)
== 構成について

+ 原稿は，左横書きとし，表題・著者名などは本会指定の様式に従って作成する．
+ 原稿の構成は，次の順序に従うとよい．

　　　英文抄録\
　　　緒言（まえがき）（研究の目的，文献サーベイによる論文の位置付け，内容の概略説明，など）\
　　　主部（理論解析，実験装置・方法およびその結果，結果の解釈および考察，など）\
　　　結言（むすび）　（全体として得られた結論，など）\
　　　謝辞\
　　　文献\
　　　References\
　　　付録\
ただし，以上は一つの例であって，著者は内容に適した最も効果的な形式を選ぶことが望ましい．


== 原稿の規定ページ数について

論文集に掲載される原稿1編当たりのページ数は，投稿規定に定められるとおりとする．また，編修委員が特に必要と認めた原稿については超過を認めることがある．しかし，本文の記述はできるだけ簡潔・的確に整理することが望ましい．

== 原稿の作成に際して

原稿の冒頭には，和文の表題・副題，著者名，英文の表題・副題，英文著者名（苗字は例に従い大文字），著者全員の英文連絡先（部署名・所属機関名，所在地）を入れる．著者の記載順は，電子投稿・審査システムと同じ著者順位とする．投稿後の著者の追加，削除，表示変更および順番変更等は認められない．機械工学関係の用語は，原則として文部科学省制定の「学術用語集・機械工学編」（昭和60年）およびJIS（日本工業規格）に規定する標準用語を用いる．制定のないものは，適当と思われる慣用語を用いる．意味のあいまいな用語を定義なしに使ったり，新造語を不用意に使ったりすることは，避けなければならない．

== 表題および副題の付け方

原稿の表題は内容を明確に表現するもので，しかも簡潔なものが望まれる．また，必要に応じて副題を付けてもよいが，第1報，第2報という表現は極力避けるようにする．やむをえず第1報，第2報とする場合でも，校閲の際にはすべて独立した原稿として取り扱われるので，続報論文でも内容が理解できるように記述する．なお，副題をつける場合には両括弧でくくる．

== 英文抄録の書き方

原稿には本文の前に英文抄録を載せる．英文抄録には研究目的と結論を必ず記述する（必要に応じ研究の方法論も含む）．長さは200〜300語程度で，途中で改行をしない．本文と切り離してそれだけを読んでも，論文の内容がある程度把握できるようにすること（“〜については，本文において述べる”，などの記述を避ける）．また，本文中の図・表・文献は引用しない．式を書く必要がある場合は，式の番号を引用せずに，式をそのまま書く．

== キーワードの付け方

キーワードは，論文の内容を代表する重要な用語である．これによって論文の分類，検索が迅速になる．キーワードは，本文を執筆した後に書くのが望ましい．

+ キーワードは，5〜10語句とする．
+ キーワードは，英文抄録の直下に英語で記載する．キーワードにはハイフンは使用せず（ハイフンを使用してひとつの言葉として一般に認識されるものを除く），前置詞・冠詞も含めない．

\ #v(-3em)
== 脚注の書き方

原稿用紙1ページ下に本文との間に線を入れ，論文番号（投稿時はxx-xxxx），著者全員の会員資格，著者の所属機関名，所属機関所在地，代表著者1名のE-mailアドレスを書く．著者の所属機関名については，当該研究が行われた時点での所属機関名・部署名等を記載する．研究を行った後に著者の所属機関に変更があった場合は，投稿時の機関名を記入し，現所属についてはカッコ書きにて（現$circle.big$$circle.big$）のように，必要に応じて記載することもできる．

== 見出し（章，節，項）の付け方および書き方

本文は適当に区分して，見出しを付ける．体裁としては，章は2行分をとって，行の中ほどに書く．また，節・項は行の左端より1文字あけて書き，改行して本文を記載する．ただし節の後に項がくるときは改行する．書体は，ゴシック体を使用する．

== 量記号・単位記号の書き方

量記号はイタリック体，単位記号はローマン体とする．無次元数はイタリック体で書く．

== 用いる単位について

単位は，SI単位を使用する．数学記号・単位記号および量記号は，半角英数字を使用する．なお，SI単位については，本会発行の「機械工学SIマニュアル」および「JIS Z 8203 国際単位系（SI）およびその使い方」を参照する．記載時には，例「200 MPa」のように数値と物理単位記号の間には半角スペースを設ける．

== 用いる記号

数学記号は，JIS Z 8201に従う．また，量を表す文字記号（量記号）は，JIS Z 8202に従う．なお，数字の書き方は，表1の例に従う．年度の表し方については，本年または昨年などとせず，かならず2007年のように西暦ではっきり記述する．

数量を表す場合および序数的表現の場合には，アラビア数字を使う．ただし，漢字などと結合して名称を表す用語および概数を表す場合は，漢字とする．

〔例〕

アラビア数字の場合：10 m，図1，表3，2010年9月1日

漢字の場合：三角形，三条ねじ，二サイクル機関，数百例

= 図および写真・表の作成に関して

+ 本文中では，@fig1，@fig2 のように日本語で書く．写真は，図として扱う．カラーで掲載できる．
+ 番号・説明などは，図についてはその下に，表についてはその上に書く．
+ 本文と，図・表の間は1行以上の空白を空けて，見やすくする．
+ 図中・表中の説明および題目はすべて英語で書く（最初の文字は大文字とする）．例に従い該当図表が示す重要知見に係る説明もあわせて記述すること．図のCaptionの書体は，Serif系を利用し，9.5ポイントの大きさで記載する．
+ 図および表の横に空白ができても，その空白部には本文を記入してはならない．
+ 図および表は，余白部分にはみ出してはならない．
+ 論文の内容をわかりやすく的確に伝えるために，図・表を適当に用いて，本文と対応するページにレイアウトする．

#grid(
  columns: (50%, 50%),
  [#figure(
    table(
      columns: 2,
      align: left,
      [Recommended], table.vline(start: 0, stroke: 0.5pt), [Not recommende],
      [$0.357$], [$.357$],
      [$3.141 6$], [$3.141,6$],
      [$3.141 6 times 2.5$], [$3.141 6 dot 2.5$],
      [$3.141 6 times 10^3$], [$3.141 6 "E"+3$],
      [$1000" or "1 000$], [$1,000$],
    ),
    caption: [Examples of writing numbers.]
  )<fig1>],
  [#figure(
    table(
      columns: 2,
      align: left,
      [Recommended], table.vline(start: 0, stroke: 0.5pt), [Not recommende],
      [$sqrt(x - y)$], [$sqrt("") x-y $],
      [$(a+b)\/(c+d)$], [$a+b\/c+d$]
    ),
    caption: [Examples of writing a square root and a fraction.]
  )]
)

#figure(
  image("figure/1.svg", width: 50%),
  caption: [
    The nonlinear propagation of plane acoustic wave radiated by the sound source. Using the exact solution of the system of Euler equations, the nondimensional profiles of fluid velocity, acoustic pressure and temperature variation at the time of shock formation are plotted with the solid (black), dashed (red) and dash-dotted (blue) curves, respectively. As the wave propagates, the nonlinear effect accumulates to distort the profile, and ultimately leads to the formation of shock wave. The shock formation point is denoted by a small arrow in the figure.
  ]
)<fig2>
#v(3em)
#figure(
  table(
    columns: 8,
    align: center,
    stroke: (top: none, bottom: none, right: none, left: none),
    table.hline(start: 0, stroke: 0.5pt, y: 0),
    table.header([$T [upright(degree C)]$], table.vline(start: 0, stroke: 0.5pt),
    [$rho ["kg/m"^3]$], table.vline(start: 0, stroke: 0.5pt),
    [$c_p ["J/(kg" dot "K)"]$], table.vline(start: 0, stroke: 0.5pt),
    [$eta ["Pa" dot upright(s)]$], table.vline(start: 0, stroke: 0.5pt),
    [$nu [upright(m)^2"/s"]$], table.vline(start: 0, stroke: 0.5pt),
    [$k ["W/(m" dot "K)"]$], table.vline(start: 0, stroke: 0.5pt),
    [$a [upright(m)^2"/s"]$], table.vline(start: 0, stroke: 0.5pt), [$P r$]),
    table.hline(start: 0, stroke: 0.5pt),
    [], [], align(right)[$times 10^3$], align(right)[$times 10^(-5)$], align(right)[$times 10^(-5)$], align(right)[$times 10^(-2)$], align(right)[$times 10^(-5)$], [],
    [0], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
    [10], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
    [20], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
    [27], [1.1763], [1.007], [1.862], [1.583], [2.614], [2.207], [0.717],
    [30], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
    [40], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
    [50], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
    [60], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
    [70], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
    [80], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
    [90], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx], [x.xxxx],
  ),
  caption: "Physical properties of air at atmospheric pressure"
)

= 数式の書き方

式番号は，式と同じ行に右寄せして（ ）の中に書く．また，本文で式を引用するときは，式（1）のように書く．式を書くときは，行頭に2文字分空白を空ける．また，必要行数分を必ず使うようにして書く．3行必要とする式を2行につめて書いたり，2行に分かれる式を1行に収めたりしない．なお，本文と式，式相互間は1行以上の空白を空けて，見やすくする．

また，原則として数式エディタのポイント数は本文に準じるものとするが，添え字等が小さく読みにくくなるときは適宜拡大する．

$
upright("d") {sum_(i = 1)^N 1 / 2 m_i [(frac(upright("d") x_i, upright("d") t))^2 + (frac(upright("d") y_i, upright("d") t))^2 + (frac(upright("d") z_i, upright("d") t))^2 +]} = sum_(i = 1)^N (X_i upright("d") x_i + Y_i upright("d") y_i + Z_i upright("d") z_i)\
C^(‾) (t) = 1 / N sum_(i = 1)^N C_i (t)\
frac(p_v - p_(s a t), p_(s a t)) = - (2.13204 + 2 sqrt(pi) frac(1 - zeta, zeta)) frac((u_v - u_(i n t)) dot.op n, sqrt(2 R T_(i n t)))\
frac(T_v - T_(i n t), T_(i n t)) = - 0.44675 frac((u_v - u_(i n t)) dot.op n, sqrt(2 R T_(i n t)))
$

= 文献・Referencesの書き方

他者の報告・データなどを引用するときには，必ずその出所を明示しなければならない．また，研究の背景を説明する際には，必ず必要な文献を引用する．できるだけ最近発行された文献を引用するとよい．できれば，日本機械学会の発行する論文集に掲載された論文を引用するのが望ましい．文献は日本語版と英語版を記載すること（このテンプレートの末尾にある記載例参照）．引用文献がすべて英語版のみ（日本語の文献を含まない）であれば*References*のみの記載でよい．

+ 一般に公表されていない文献（投稿予定および投稿中で未発表の論文も含む）は，できるだけ引用しない．また，Webサイトの引用については止むを得ない場合を除き，できるだけ引用しない．引用せざるを得ない場合は，必ず参照日付を明記する．（例　*文献* (参照日 2013年8月14日)　*References* (accessed on 14 August, 2013)）

+ 本文中の引用箇所には，著者名と発行年を記載する．

   （日本語文献例　著者1名の場合：#citep(<Takeuchi-2005>)　著者2名の場合： (山田，佐藤，2013)

  英語文献例　著者1名の場合：#citep(<Nagashima-2005-en>)　著者2名の場合：#citep(<Ahrendt-1951-en>)）

  3名以上の著者がいる場合の著者名の記載方法は，代表著者名他の記載とする．

  （日本語文献例 #citep(<Tsutahara-2003>) 英語文献例 #citep(<Takeuchi-2006-en>)）

  発行年が同じである同じ著者からの２つ以上の引用を記載する場合には，発行年の後にa，b，cを記載する．

  （例　@Karin-2010b-en[Karin and Hanamura, 2010a], @Karin-2010a-en[2010b)]）

+ 引用した文献は，本文末尾に*文献*および*References*としてアルファベット順にまとめて記載する．

+ 著者名，誌名は*文献*では日本語標記にし，*References*ではすべて英語表記にしたものを記載する．

  日本機械学会論文集（2014年1月以降発刊される新学術誌）の英語表記は，Transactions of the JSME (in Japanese) とする．

+ 書き方は，次の形式に従う．*文献*および*References*に記載された例を参照のこと．

    （著者名）

  - *文献*では著者全員の姓名，*References*では著者全員の姓，および名のイニシャルを記載例に従って書く．

    （誌名・書名）

  - 誌名・書名は略記せず，そのままの誌名・書名を記入する．英語がない場合は*References*ではローマ字で記載する．文献が日本語の場合は，*References*には(in Japanese) と記載する．

    （巻，号，発行年）

  - 巻，号は，Vol.$circle.big$，No.$circle.big$とする．発行年は，（西暦）とする．

    （ページ数）

  - ページ数は，雑誌・講演論文集などで論文を引用した場合は，始まりのページと終わりのページをpp.$circle.big$-$circle.big$と明示する．単行本などで引用したページが単ページの場合は，p.$circle.big$と明示する．

  - 雑誌などで，通しページ（例えば通年）のある場合は，原則として通しページを記入する．

  - CD-ROMの引用においては，ページのある場合は，講演論文集と同様とする．ページのない場合は，論文を特定できる番号，ファイル名等を明示する．

= 結　　　言

本テンプレートファイルのスタイルを利用すると，各々の項目の書式が自動的に利用できるので便利である．

#bibliography-list(..bib-file(read("japanese-bib.bib")))

#bibliography-list(..bib-file(read("english-bib.bib")), lang: "en")
