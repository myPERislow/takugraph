## データを一つだけ取得する
### 特定のIDのデータを取得したい
- 使用例：IDがわかっているデータをあるモデルから取得したいとき
- よくある利用ケース：RailsのshowアクションであるIDのデータを取得
- 複数条件：不可

``` ruby
class AtriclesController > ApplicationController

  def show
    @article = Article.find(params[:id])
  end
end

# URLは例えば、http://localhost:3000/articles/1
```
**findはモデルのインスタンス(すぐに利用できるデータ)を返す** ので、例えば「@article.title」のように使える。取得したデータがインスタンスかどうかは非常に重要。

### 特定のカラムの値から１つのデータを取得したい
- 使用例：ID以外のカラムデータから1つのデータを取得したいとき
- よくある利用ケース：Emailからユーザーを取得したいとき
- 複数条件：可

```ruby
class UsersController < ApplicationController

  def edit
    @user = User.find_by(email: params[:email])
  end
end

# URLは例えば http://localhost:3000/articles/1/edit
```

find_byも **指定したモデルのインスタンス(すぐに利用できるデータ)を返す** ので、「@user.email」などの使い方ができる。
また、下記のように複数条件の指定もできる

```ruby
@user = User.find_by(email: params[:email], name: '田中太郎')
```

## 複数データの取得
### ある条件に当てはまるものを複数取得する
- 使用例：全データをリストで表示したいとき
- よくある利用ケース：indexアクションでモデルのデータをリスト的に表示したいとき

```ruby
class ArticlesController < ApplicationController

  def index
    # 有効な全記事を取得してきます
    @articles = Article.where(active:true)
  end
end
```

この場合、whereメソッドは指定したモデルのインスタンスを取得するものではないのでそのままデータを利用できない。
よって、その範囲の中でどれを使うかを指定する必要がある。
よく使うのがeachです。

```ruby
<% @articles.each do |article| %>
  <ul>
    <li>タイトル: <%= article.title%> </li>
    <li>内容: <%= article.count%> </li>
    <li>投稿日: <%= article.created_at%> </li>
  </ul>
<% end %>
```

ここで需要なのは、 **eachで回っているとき(ブロック変数のarticleにデータが入るとき)には,Articleのインスタンスになっている** ということです。
これによって、もともとはwhereで範囲を絞っただけのものだったのに、「article.title」などというように利用できる。


- 取得したいデータの数	　　使用メソッド
- 1つ（idがわかっている）　	find
- 1つ（idがわからない）	　　find_by
- 複数　  　　　　　　　　　where
