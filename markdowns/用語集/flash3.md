
- 何らかの処理をした際に簡易的なメッセージを画面に表示したい場合があります。

- 長友佑都さんの電話番号を変更した際に、こういうのが出てくれると分かりやすいと思います。
- ※ちょっと見た目がショボいですが、スタイルシートを当てるなりすればそれなりの見た目にできるので、そこはお任せします。

- ここでは、連絡先の新規作成や更新、削除といった処理をして一覧画面に戻ってきた際に、それぞれの通知メッセージを表示する機能を実装したいと思います。

- Railsではそういう簡易メッセージを実装するために、flashという仕組みがあります。

- コントローラーにて、flashにメッセージを格納して、それをビューで表示させます。

- コントローラーにてflashにメッセージを格納する
- /app/controllers/members_controller.rbを開いて下さい。

- まず新規登録が完了した際の処理を実装します。
- 新規登録処理を行うのはupdateアクションでした。

```ruby
# members_contoller.rb

def create
  @member = Member.new(member_params)
  if @member.save
    flash[:notice] = "連絡先を登録しました"
    redirect_to members_path
  else
    render action: :new
  end
end
```
- saveメソッドによる保存処理が成功した際に、flashという名前の連想配列のnoticeというキーの値に、メッセージを代入しています。

- キーの名前は原則的には任意です。

- このflashをビューから参照することで、画面に表示します。

- ビューでflashを表示する
- /app/views/members/index.html.erbを開いて下さい。

- 1行目から3行目にflash[:notice]にメッセージが入っている場合のみ、それを出力する処理を書いています。

```ruby
 # index.html.erbRuby

<% if flash[:notice] %>
  <p><%= flash[:notice] %></p>
<% end %>

<% @members.each do |member|%>
  <div class="member">
  <p><%= link_to member.name, edit_member_path(member.id) %></p>
  <p><%= member.yomi %></p>
  <p><%= member.phone %></p>
  </div>
<% end %>
<%= link_to "新規登録", new_member_path %>
```

- flashというのは内部的に何をしているのかというと、HTTPレスポンスを返す際にそのレスポンスヘッダーにそのメッセージを仕込ませるという処理を行っています。
- その都度レスポンスヘッダーに情報を渡すだけなので、このflashによるメッセージが表示されるのは一回限りです。
- ブラウザの更新ボタンを押したりして再度リクエストを送るとメッセージは表示されません。

- redirect_toメソッドでflashに値を渡す
- このflashによる簡易メッセージの仕組みは、何らかの処理をした後、リダイレクトした際に使われることが多いです。

- 今回の例では、updateアクションでデータベースへの書き込み処理を行った後、一覧画面へとリダイレクトした際に、簡易メッセージを表示しています。

- そのリダイレクトを行う為のredirect_toメソッドが実は非常に便利に出来ていて、引数に文字列を渡すことで簡単にflash配列へとメッセージを格納することが可能になっています。

- 例えば、上記のコントローラーによる処理は以下のように書き換えることができます。

```ruby
# members_contoller.rbRuby

def create
  @member = Member.new(member_params)
  if @member.save
     redirect_to members_path, notice: "連絡先を登録しました"
  else
    render action: :new
  end
end
```

- redirect_toメソッドの第二引数に、noticeというキーでメッセージを渡すだけです。

- 上述したように、flashのキーは原則的には任意（なんでも良い）のですが、redirect_toメソッドはnoticeとalertというキーだけを特別にサポートしており、以下の様な書き方ができます。

`redirect_to path, notice: "通知メッセージ"`

`redirect_to path, alert: "エラーメッセージ"`
- notice、alert以外のキーにメッセージを格納したい場合は以下のように書くことで可能です。
- 以下ではkeyというキーでmessageというメッセージをflashに登録しています。

`redirect_to path, flash: {key: "message"}`
- メッセージを動的に変える
- もちろんメッセージはただの文字列だけでなく、動的に変えることも可能です。登録した人の名前をメッセージに入れてみましょう。

```ruby
# members_controller.rbRuby

def create
  @member = Member.new(member_params)
  if @member.save
    redirect_to members_path, notice: "#{@member.name}を登録しました"
  else
    render action: :new
  end
end
```

`"#{@member.name}を登録しました"`
- という書き方はRuby特有の書き方で、文字列の中にコードを入れる際の記法です。

- #{ }の中にコードを入れることで、文字列の中でもプログラムとして認識されます。

　以下の２つは同じことです。

- "#{@member.name}を登録しました"

- @member.name + "を登録しました"
- updateアクション、destroyアクションも同様に、メッセージを表示させましょう。

```ruby
# members_controller.rbRuby

def update
  @member = find_member_by_id
  if @member.update(member_params)
    redirect_to members_path, notice: "#{@member.name}を更新しました"
  else
    render action: :edit
  end
end
```

```ruby
# members_controller.rbRuby

def destroy
  @member = find_member_by_id
  @member.destroy
  redirect_to members_path, notice: "#{@member.name}を削除しました"
end
```
- これで、それぞれの処理をした際に、メッセージが表示されるようになりましたので、確認してみてください。
