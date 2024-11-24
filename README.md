# JSME-typst
【非公式】日本機械学会 Typst 用テンプレート

## `JSME-typst`の概要

[日本機械学会オリジナルのテンプレート](https://www.jsme.or.jp/publish/transact/for-authors.html)を再現するTypst用テンプレートです．

- `main.typ` : 文書本体ファイル
- `jsme_style.typ` : JSMEテンプレート用の設定ファイル
- `bib_style.typ` : 参考文献の設定ファイル
- `ris_jsme_style.typ` : RIS形式文献の設定ファイル

使用方法は，次章を参考にしてください．
必要なTypstファイル一式は，GitHub上の本レポジトリから入手可能で，自由に改変ができます．
本テンプレートを使用したことにより発生した問題に対しては，一切の責任を持ちませんのでご了承ください．
また，本レポジトリ内のファイルは全て日本機械学会の書式の再現のために作成した非公式ファイルなので，使用方法等を日本機械学会に問い合わせることもご遠慮ください．

## 使用方法

`JSME-typst` の使用方法について説明します．

### 1. Typstのインストール

[Visual Studio Code](https://code.visualstudio.com/) を利用する方法が最も簡単です．
ローカル環境にダウンロードし，インストールを行ってください．

Visual Studio Code内の拡張機能から，`Tinymist Typst` を選択し，インストールします．
インストールが終わると，Typstがローカル環境で使用可能になります．

### 2. フォントのインストール

本テンプレートと同一の文書を作るには，使用するコンピュータにフォントのインストールが必要です．
本テンプレートで使用しているフォントは，全て無料でダウンロードが可能です．
使用しているフォントは，以下の通りです．

| 形式 | フォント名 |
| ---- | ---- |
| ゴシック体 | [Harano Aji Gothic](https://github.com/trueroad/HaranoAjiFonts) |
| 明朝体 | [Harano Aji Mincho](https://github.com/trueroad/HaranoAjiFonts) |
| 英字 | [Times New Roman](https://www.freefontdownload.org/ja/times-new-roman.font) |
| 数式 | [Latin Modern Math](https://ctan.org/tex-archive/fonts/lm-math) |

これ以外のフォントを使用したい場合，`jsme_style.typ`ファイル内の`setting font`のフォント名を変更することで使用できます．

### 3. 本テンプレートをコピー

本テンプレートをクローンして，ローカル環境で利用できるようにします．

```zsh
git clone https://github.com/tkrhsmt/JSME-typst.git
```

または，zipファイルをダウンロードしてください．

## 文献について

Typstでは，文献をBibLaTeXで管理するのが主流です．
しかしJSMEテンプレートでは，日本語文献と英語文献の2つに分けて入力する必要があります．
現状のTypstでは，複数のBibLaTeXを読み込むことができないため，独自の文献管理システムを導入しています．
文献の直書き方法に関しては，[文献の直書き方法](https://zrbabbler.hatenablog.com/entry/2024/05/06/180901) を参考にして作成しており，これを拡張しています．

現状，JSME-typst内では2通りの文献の記述方法ができます．

1. 文献を直書きする
1. RIS形式で記述する

RIS形式は現時点で全ての形式に対応できておらず(JOUR・BOOK・ELEC・WEB・PATの5つのみ)，これ以外は直書きをする必要があります．
基本的な文献は上記の5つで対応できますので，原則RIS形式を選択するのが良いと思います．
もちろん，2つの書き方を混在させることも可能で，上記で対応できない文献のみ直書きが推奨されます．

### 文献を直書きする方法

- 文献は，`bibliography-list`関数の中に書きます．
- `bibliography-list`関数の引数には，言語：`lang`(英語：`"en"`，日本語：`"jp"`)を指定できます．この設定は，headingのみに使用されます．デフォルトは日本語です．
- 直書き文献を記述するには，`bib-item`関数を利用します．

例：
```typst
#bibliography-list(lang: "jp")[
    #bib-item()[Ahrendt, W. R. and Taplin, J. F., Automatic Feedback Control (1951), p.12, McGraw-Hill.]
]
```

`bib-item`関数には，以下の引数を設定できます．

- `author` : 文献の著者を入力します．これは，文献を引用する際の著者名として利用されます．(例：`author: "Ahrendt"`)
- `year` : 文献の出版年を入力します．これは，文献を引用する際の年として利用されます．(例：`year: "1951"`)
- `label` : ラベルを設定します．これは，文献を引用する際の参照ラベルとして機能します．設定しない場合，文献を文中で引用することはできません．また，`author`と`year`が設定されていないと，labelが正しく表示されません．（例：`label: <Ahrendt:1951>`）
- `yomi` : 文献の"読み"を英語で入力します．これは，文献を名前順に並び替えるときに利用されます．英語文献の際には設定する必要はありませんが，日本語文献の場合正しい並び順にするため，設定する必要があります．このとき，最初の文字は大文字にしてください．（例：`yomi: "Ahrendt"`）
- `yearnum` : 文献に含まれる年の最初の文字数と最後の文字数を入力します．上記の例では，文献中の「1951」が年に当たり，「..."1"951...」は63文字目で，「...195"1"...」は66文字目です．このため，yearnumには(62, 66)と入力します．これは，文献の著者と年が重複した場合に自動で年に番号振りを行います．（例：`yearnum: (62, 66)`）

### RIS形式で文献を書く方法

- 文献は，`bibliography-list`関数の中に書き，直書きと同列に扱えます．
- RIS形式で文献を記述するには，`bib-ris`関数を利用します．

例：
```typst
#bib-ris()[
    TY  - BOOK
    TI  - Automatic feedback control
    AU  - Ahrendt, W. R.
    AU  - Taplin, John Ferguson
    PY  - 1951
    SP  - 12
    PB  - McGraw-Hill
    LA  - English
    UR  - https://nla.gov.au/nla.cat-vn2276067
    Y2  - 2024/11/24
    ER  -
]
```

`bib-ris`関数には，以下の引数を設定できます．

- `label` : ラベルを設定します．これは，文献を引用する際の参照ラベルとして機能します．設定しない場合，文献を文中で引用することはできません．直書きの場合と異なり，`author`と`year`はRIS形式内から自動で識別します．（例：`label: <Ahrendt:1951>`）
- `yomi` : 文献の"読み"を英語で入力します．これは，文献を名前順に並び替えるときに利用されます．英語文献の際には設定する必要はありませんが，日本語文献の場合正しい並び順にするため，設定する必要があります．このとき，最初の文字は大文字にしてください．（例：`yomi: "Ahrendt"`）
- `lang` : 文献の言語を設定します．デフォルトは英語で，日本語の場合は`true`を選択します．文献の言語は原則自動的に識別できますが，RIS形式内の文字が全て英字であり，かつ文献を日本語として認識させたい場合には明示的に`lang`を設定する必要があります．（例：`lang: true`）

## 参考文献

1. [日本機械学会オリジナルのテンプレート](https://www.jsme.or.jp/publish/transact/for-authors.html)
1. [Typst公式ドキュメント](https://typst.app/docs/)
1. [文献の直書き方法](https://zrbabbler.hatenablog.com/entry/2024/05/06/180901)
