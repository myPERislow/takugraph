```ruby
class Album < ApplicationRecord
  mount_uploaders :photographs, PhotoUploader
end
```

- モデルファイルにcarrierwaveをマウントする
- 「マウントする」とは、コンピュータ本体に接続した周辺機器をOSなどのソフトウェアに認識させ、操作・利用可能な状態にすること。
- コンピュータに接続した機器やメディアをコンピュータに認識させ、使える状態にすること。
- carrierwaveのアップロード機能を実装するモデルにアップローダーを設置しておく必要がある。
- マウントすることによって、
- モデルへの画像ファイルのアップロードが可能になる。

これは画像を一枚だけアップロードする時
```ruby
u.avatar.url # => 'url/to/file.png'
u.avatar.current_path # => 'path/to/file.png'
u.avatar_identifier # => 'file.png'
```

画像を複数枚アップロードする時
- ActiveRecordにarrayを保存できるcolumnを追加する。
- これは例えば、array columnや JSON column が使える。
- PostgreSQLやMySQLといったActiveRecord json data typeをもったdatabasesを使おう!

`rails g migration add_avatars_to_users avatars:JSON`
`rake db:migrate`

- そしてmodel fileには以下のように記述
```ruby
class User < ActiveRecord
  mount_uploaders :avatars, AvatarUploader
end
```

- file input fieldではmultiple file fieldsにセットアップする。
- Railsであれば以下のように例えば行う。

```ruby
<%= form.file_field :avatars, multiple: true %>
```

- また、upload controllerでは、multiple file upload attributeを許可する。
- hashに入った空のarrayを例えば以下のように追加する。

```ruby
params.require(:user).permit(:email, :first_name, :last_name, {avatars: []})
```

- これでmultipe fileを選べるようになった

```ruby
u = User.new(params[:user])
u.save!
u.avatars[0].url # => '/url/to/file.png'
u.avatars[0].current_path # => 'path/to/file.png'
u.avatars[0].identifier # => 'file.png'
```


- imageのresizingを行いたい時はImagemagickとMiniMagickをinstallする必要がある。
- MiniMagickじゃなくてRMagickがオススメされる時もあるが、MiniMagickの方がいい。
- ImagemagickはOSXではhomebrewで以下のようにtypeしてdownloadできる。
` $ brew install imagemagick`
```ruby
class MyUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process resize_to_fit: [800, 800]

  version :thumb do
    process resize_to_fill: [200, 200]
  end
end
```

- これでuploaderが使われた時、uploadされたimageは800 by 800 pixels以上にはならない。
- オリジナルのアスペクト比(縦横比率)は保たれたままである。
- thumbと言われるversionが作られ、スケールはぴったり200 by 200 pixelsにされる。
- listは以下の例のように作られる
```ruby
  uploader = AvatarUploader.new
  uploader.store!(my_file)  # size: 1024×768

  uploader.url # => 'url/to/my_file.png' #size: 800×800
  uploader.thumb.url # => '/url/to/thum_my_file.png'  # size: 200×200
```


### CarrierWaveのuploaderクラス修正
- 元画像の縦横比を維持したままwidthを最大300px,heightを最大200pxにリサイズする。
```ruby
process resize_to_limit: [300, 200]
```
- 元画像から width 100px, height 100pxで切り抜きを行う。
- 第3引数で、切り抜きを行う際の中心点を指定。
```ruby
process resize_to_fill: [100, 100, "Center"]
```
- 元画像の縦横比を維持したままwidthを最大300px, heightを最大200pxにリサイズする。
- リサイズ後のファイルが300px ×200px になるように、余白部分を指定色で塗りつぶす。
- 第3引数で塗りつぶしの色を指定
- 第4引数で、余白が発生した際の画像の配置を指定
```ruby
process resize_to_limit: [300, 200, "#ffffff", "Center"]
```
- サムネイル用、フォトギャラリー用等、別バージョンでリサイズした画像を作成する。

```ruby
version :thubm do
  process resize_to_fill: [50, 50]

  # thumb.jpgという固定ファイル名で作成( full_filename メソッドをオーバーライド)
  def full_filename for_file
    "thumb.jpg"
  end
end

version :gallery do
  process resize_to_limit: [300, 200]

  # gallery.jpg という固定ファイル名で作成
  def full_filename for_file
    "gallery.jpg"
  end
end
```
