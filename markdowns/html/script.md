- <script>タグは、文書にJavaScriptなどのスクリプトや、データブロックを組み込む際に使用します。
- <script>タグは、<head>～</head>の中に配置することが多いですが、 <body>～</body>の中に配置しても問題ありません。

- type属性には、スクリプト言語やデータ形式を指定します。
- 利用するスクリプトがJavaScriptの場合にはtype="text/javascript"となりますが、 type属性の初期値はtype="text/javascript"なので、JavaScriptの場合にはtype属性の指定を省略することができます。
- スクリプト言語のタイプがtype="text/javascript"以外となる場合にはtype属性は必須です。

- HTML文書でJavaScriptなどのスクリプトを利用する際には、 HTML文書の<script>～</script>の中にスクリプトを記述するか、src属性で外部スクリプトファイルのURIを指定します。
- src属性でJavaScriptの外部jsファイルを読み込む場合には、例えば以下のように記述します。

`<script src="sample.js"></script>`
- charset属性は、外部スクリプトファイルの文字エンコーディングを指定する際に使用します。
- スクリプトをHTML文書の<script>～</script>の中に直接記述する場合には、charset属性を使用することはできません。

- async属性とdefer属性は、スクリプトをどのように実行するかを指定する属性です。
- async属性は利用可能な時点でスクリプトを実行するよう指定する際に使用します。
- また、defer属性はHTML文書の読み込みが完了した時点でスクリプトを実行するよう指定する際に使用します。

- script要素の内容はブラウザ上には表示されないことになっていますが、 <script>～</script>の中にスクリプトを記述する場合、 その内容をコメントアウトしておくのが一般的です。

- これは、<script>タグに対応していない旧式のブラウザで、スクリプトの記述がそのままテキストとして表示されてしまうのを防ぐためですが、 現在、<script>タグは主要なブラウザでサポートされているので、コメントアウトしなくても問題が起きることはほとんどないでしょう。

- ■HTML4.01からHTML5へのバージョンアップによる変更点
- HTML4.01では<script>タグにはtype属性が必須でしたが、 HTML5ではtype属性の初期値はtype="text/javascript"とされており、 スクリプト言語のタイプがtype="text/javascript"となる場合には、type属性を省略してもよいことになっています。

- ■属性
- src属性
- 外部スクリプトファイルのURLを指定
- async属性
- 利用可能な時点でスクリプトを実行
- defer属性
- HTML文書を読み込んだ時点でスクリプトを実行
- type属性
- スクリプトのMIMEタイプを指定（初期値は"text/javascript"）
- charset属性
- 外部スクリプトファイルの文字エンコーディングを指定
- 以下は、W3Cの公式サイトにscript要素の使用例として掲載されているものです。
- ２つの<script>タグが使用されていますが、一つは外部jsファイルを指定しており、もう一つはデータブロックを記述しています。
- これは、“外部jsファイルのスクリプトが、ビデオゲームの地図を作成するためのデータブロックを利用する…”という想定のサンプルのようです。

■使用例
```
<script type="text/javascript">
    document.write("この部分にテキストを表記します。");
</script>
<script type="text/javascript">
    <!--
    document.write("この部分にテキストを表記します。");
    // -->
</script>
<script type="text/javascript" src="sample.js"></script>
```
