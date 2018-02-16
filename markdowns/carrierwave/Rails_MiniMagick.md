- Railsで画像処理したいときは、MiniMagickが使える。
- MiniMagickはImageMagickのラッパー。
#### 準備 - ImageMagick
OS Xなら
`$brew install imagemagick`
終わったらバージョンを確認
```ruby
$ convert --version
Version: ImageMagick 6.7.7-10 2016-06-01 Q16 http://www.imagemagick.org
Copyright: Copyright (C) 1999-2012 ImageMagick Studio LLC
Features: OpenMP
```

#### 準備 - MiniMagick
MiniMagickのインストールはGemfileにgemを追加してインストール。
`gem 'mini_magick'`
`$ bundle install`
