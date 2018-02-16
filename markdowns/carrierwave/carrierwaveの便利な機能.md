#### 画像の拡張子の制限
- ファイルには拡張子の種類がたくさんありますが、アップロードする画像の拡張子を制限したいと思うことがある。
- carrierwaveではそれを簡単に実装することができる。

```ruby
# app/uploaders/picture_uploader.rb
def extension_white_list
  %w(jpg jpeg gif png)
end
```

- これだけでファイルの拡張子の制限ができる。
- この場合はjpg,jpeg,gif,pngの拡張子だけを許可する。

#### 拡張子の種類を指定する。
- 投稿した画像の拡張子を保存するときに指定した拡張子にすることもできる。
- やり方はアップローダーファイルに指定したい拡張子を記載するだけ
```ruby
# picture_uploader.rb
  process :convert => 'jpg'
```
- この場合は投稿した画像が保存された時に「jpg」に拡張子を変えてくれる。

#### 画像のリサイズ
- 画像をアップロードする上で、あまりにも大きなサイズの画像を投稿されてしまうとレイアウトが崩れてしまう。
- そこでcarrierwaveには簡単に画像のリサイズができる機能が用意されている。

- 下準備が必要
- まずはじめに画像をリサイズするためにImageMagickという画像操作プログラムをインストールする。
`$ brew install imagemagick`

- 次にImageMagickを使えるようにするためにMiniMagickをGemに記載します。

```ruby
# Gemfile

gem 'mini_magick'
```

- インストール
`$ bundle install`

- そしてMiniMagickを対応されるためにアップローダーファイルを編集する。

```ruby
# app/uploaders/picture_uploader.rb

include CarrieWave::MiniMagick
```

- 以上で準備は完了。

- 例えがindexページにサムネイル、showページに大きな画像を表示
```ruby

# app/uploaders/picture_uploader.rb

  #showページ(大きな画像)
  process :resize_to_fit => [ 200, 200 ]

  # indexページ(サムネイル)
  version :thumb do
    process :resize_to_fit => [ 50, 50 ]
  end
```

- これで画像のリサイズができた。

```ruby
# app/posts/index.html.erb
  # 表示したいところに記載
  <%= image_tag post.picture.url(:thumb) %>
```

```ruby
# app/posts/show.html.erb
  # 表示したいところに記載
  <%= image_tag @post.picture.url %>
```

- バリデーションエラー時に画像を保持
- 画像を投稿した際、もしもバリデーションに引っかかった場合(名前とか内容が空だったり)で、carrierwaveはデフォオルトでは画像のキャッシュが残りません。
- なのでバリデーションに引っかかった時にサイド投稿フォームが表示されますが、投稿したはずの画像はフォーム上に表示されません。
- これだとユーザーがちょっと戸惑ってしまうと思うのですが、実はcarrierwaveでは簡単に画像のキャッシュの設定ができる。

- まずはcontrollerのストロングパラメーターの箇所でcacheを受け取るように追加
```ruby

# posts_controller.rb
  private

  def post_params
    params.require(:post).permit(:picture, :title, :content, :picture_cache)
  end
```

- そして画像を保持したい該当のフォームにimage_tagとhidden_fieldを書く。
- ここにバリデーションに引っかかった場合に画像が表示される。

```ruby

# _form.html.erb

  <div class="field">
    # ここから追加
    <%= image_tag @post.picture.url(:thumb) if @post.picture? %>
    <%= f.hidden_field :picture_cache %>
    # ここまで追加
```
