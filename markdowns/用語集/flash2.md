- application.html.erbの編集
- フラッシュメッセージはメッセージを表示したい部分に書きます。

- サイトの上部(ヘッダーの下)にメッセージを表示したいと思うので、ここではapplication.html.erbに書いていきます。


- まずapplication.html.erbの<%= yield %>の上の部分に以下のようなコ-ードを書きます。

```ruby
# application.html.erb

<% flash.each do |key, value| %>
  <div class="alert alert-<%= key %>">
    <%= value %>
  </div>
<% end %>
<%= yield %>
```

- これでアプリケーション全体でフラッシュメッセージを表示できるようになりました。


- controllerのコード
application.html.erbを修正したので今度はcontrollerを見ていきましょう。

- 今回はユーザーが投稿して成功したらフラッシュメッセージを表示するようにしたいと思います。

- 成功した時のメッセージはcreateアクションにメッセージを明示します。

- flashオブジェクトはハッシュのように扱うことができるのでcontrollerを以下のようにかきます。

```ruby
# posts_controller.rb

def create
  @post = Post.new(post_params)
     if @post.save
       flash[:success] = 'Post was successfully created.'
       redirect_to @post
     else
       render :new
     end
end
```

- では試しに投稿してみましょう。
