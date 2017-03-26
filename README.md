# 修士論文テンプレート #

シンプルな日本語修士論文テンプレート

[見本(PDF)](https://drive.google.com/open?id=0B2ubwGivupfFLTlQc1ozRS0tZms)

## PDFファイル作成手順 ##

BibTeXを使っているので，

1. 文献データベース（bibファイル）を用意する．
2. `platex` を実行し，参照情報をauxファイルに書き出す．
3. `pbibtex` を実行し，bblファイルを作る．
4. `platex` を実行し，bblファイルを取り込む．
5. `platex` を実行し，相互参照の解決をする．
6. `dvipdfmx` を実行し，pdfファイルを作る．

といった流れでコンパイルを行い，pdfファイルを作成します．以下，具体的に
説明します．

まず，文献データベース `library.bib` に文献を列挙していきます．論文や書
籍のBibTeX情報は，たいていWebからダウンロードできます．コピペしていきま
しょう．

`library.bib` を書き終わったら，auxファイルを作ります．以下のように
`platex` を実行します． `-shell-escape` はpdfファイルを図として取り込む
ときには必要です（xbbファイルの生成のため）．

    $ platex -shell-escape thesis.tex

つぎに， `pbibtex` を実行してbblファイルを作ります．

    $ pbibtex thesis.aux

そして， `platex` を *2回* 実行してdviファイルを作ります．

    $ platex thesis.tex
    $ platex thesis.tex

最後に，pdfファイルを作成するには `dvipdfmx` コマンドを使います．

    $ dvipdfmx thesis.dvi

参考文献を更新する必要がなければ，以降は，

    $ platex thesis.tex
    $ dvipdfmx thesis.dvi

のようにすればpdfファイルが作成できます．

## ライセンス ##

二条項BSDライセンス（BSD 2-clause License）です．
