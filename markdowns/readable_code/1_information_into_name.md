## 名前に情報を詰め込む
名前を見ただけで情報を読み取れるようにする
- 明確な単語を選ぶ

例えば、Getではなく、状況に応じてFetchやDownloadなどを使う
- tmp や retvalなどの汎用的な名前を避ける。

ただし、明確な理由がる場合は話は別だ
- 具体的な名前を使って、物事を詳細に説明する。

ServerCanStart() よりも CanListenOnPort() のほうが明確だ。
- 変数名に大切な情報を追加する。

ミリ秒を表す変数名には、後ろに_msをつける。これからエスケープが必要な変数名には、前にraw_をつける
- スコープの大きな変数には長い名前をつける。

スコープが数画面に及ぶ変数に1~2文字の短い暗号めいた名前をつけてはいけない。短い名前はスコープが数行の変数につけるべきだ。

- 大文字やアンダースコアなどに意味を含める。

例えば、クラスのメンバー変数にアンダースコアをつけて、ローカル変数と区別する。
