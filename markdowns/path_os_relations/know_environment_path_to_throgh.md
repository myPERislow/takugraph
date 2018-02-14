# PATHを通すために環境変数の設定を理解する。

#### PATHの通し方
`~/.bashrc`や`~/.bash_profile`に以下のコマンドを記述する。(記述はどちらかで良い。)

.bashrc
```
export PATH=$PATH:追加したいコマンド検索パス
```
.bash_profile
```
export PATH=$PATH:追加したいコマンド検索パス
```
- 記述後は編集したファイルに対して`source`コマンドを実行しないとPATHが通らない。

```
source ~/.bashrc
source ~/.bash_profile
```

#### exportコマンドとは?
- 以下のことができるコマンド
- 環境変数を**表示**する
- 環境変数を**設定**する

#### 環境変数を表示する
- 設定されている環境変数を表示する

```
export -p

# 出力結果(一部のみ記載)
declare -x PATH="/usr/local/bin:/bin:/usr/sbin:/sbin"
declare -x LANG="ja_JP.UTF-8"
declare -x SHELL="/bin/bash"
```

#### 環境変数を設定する
- 例えば`$ULB`という環境変数を設定したい場合、以下のように入力をする。
```
export ULB=/usr/local/bin
```
- 結果は表示されないが、環境変数`$ULB`が設定されたので`echo $ULB`で確認できる。

```
echo $ULB
/usr/local/bin #出力結果
```
- 設定した環境変数を利用してみる。
```
# どちらのコマンドでも同じ結果が出力される
ls /usr/local/bin
ls $ULB
```

- すでに存在する環境変数を設定すると**上書き**される

#### 環境変数を削除したい
- `unset`コマンドで環境変数を削除できる
```
unset ULB #[$]は入力しなくて良い。

echo $ULB
```
