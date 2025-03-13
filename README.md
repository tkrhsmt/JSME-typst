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
v
本テンプレートをクローンして，ローカル環境で利用できるようにします．

```zsh
git clone https://github.com/tkrhsmt/JSME-typst.git
```

または，zipファイルをダウンロードしてください．

## 文献について

Typstでは，文献をBibLaTeXで管理するのが主流です．
しかしJSMEテンプレートでは，日本語文献と英語文献の2つに分けて入力する必要があります．
現状のTypstでは，複数のBibLaTeXを読み込むことができないため，[独自の文献管理システム](https://github.com/tkrhsmt/typst-BibTeX-jp)を導入しています．
文献の直書き方法に関しては，[文献の直書き方法](https://zrbabbler.hatenablog.com/entry/2024/05/06/180901) を参考にして作成しており，これを拡張しています．

現状，JSME-typst内では2通りの文献の記述方法ができます．

1. 文献を直書きする
1. BibTeX形式で記述する

BibTeX形式は，[JSME-bst](https://github.com/Yuki-MATSUKAWA/JSME-bst)で対応している形式のみ使用できますが，まったく同じ動作をするとは限りません．
基本的な文献はBibTeXで対応できますので，原則BibTeX形式を選択するのが良いと思います．
もちろん，2つの書き方を混在させることも可能で，上記で対応できない文献のみ直書きが推奨されます．


## 参考文献

1. [日本機械学会オリジナルのテンプレート](https://www.jsme.or.jp/publish/transact/for-authors.html)
1. [Typst公式ドキュメント](https://typst.app/docs/)
1. [文献の直書き方法](https://zrbabbler.hatenablog.com/entry/2024/05/06/180901)
1. [JSME-bst](https://github.com/Yuki-MATSUKAWA/JSME-bst)
