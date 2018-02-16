```ruby
# app/uploaders/image_uploader.rb
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  ...

  # resize_to_fitはファイルのサイズを変更します
  # アップロードされたファイルを200〜200以下に変換する
  process :resize_to_fit => [200, 200]

  # 別のスケールを設定
  version :thumb do
    process :resize_to_fit => [50, 50]
  end

  ...
end
```
