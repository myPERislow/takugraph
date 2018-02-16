#### 機能
- アセットファイルにアクセスするためのパスを管理する(アセットパス)
- アセットのコンパイル(Asset Pipeline)
- アセットファイル同士の依存性を管理する

### development環境の場合
#### 1. アセットパスを登録
- アセットファイルを配置するパスを管理して１つのディレクトリにあるかのようにアクセスする機能

- (Ruby)

```ruby
 # config.rb

require 'sprockets'

#/assetsにアクセスした際に呼び出すアセットの設定
map '/assets' do
  environment = Sprockets::Environment.new
  #assets/javascript以下のファイルを/assetsから呼び出せる
  environment.append_path 'assets/javascript'
  #assets/stylesheets以下のファイルを/assetsから呼び出せる
  environment.append_path 'assets/stylesheets'
  run environment
end

map '/' do
  run Proc.new {|env| [200, { "Content-type" => "text/html"},["Hello World"]] }
```

- (Rails)

- アセットパス(デフォルト)

```ruby
app/assets < アプリケーションのメイン機能に関わるアセットファイル
lib/assets < 共通で利用するライブラリやサブ機能などに関わるアセットファイル
vender/assets < オープンソースのJavaScriptライブラリやCSSなどの外部から取得して利用するアセットファイル
```
- アセットパスの追加
```ruby
 # config/application.rb
class Application < Rails::Application
  # 省略

  config.assets.path << Rails.root.join("conponents")
end
```

#### 2. アセットファイルの読み込み(マニフェストファイル)
- 用語
```
マニフェスト < 読み込むアセットのリスト
マニフェストファイル < マニフェストが書かれたファイル
ディレクティブ < ファイル同士の依存性を管理するための独自の構文
```
- (1)ディレクティブによりファイル読み込み順を管理
- 例： //= require jquery
- (2)アセットパスによりファイルを呼び出し
- (3)呼び出したファイルをコンパイル(コンパイルが必要な場合)
- (4)マニフェストファイルに呼び出したファイルを結合
- (5)(2)〜(4)を繰り返す

```ruby
 # app/assets/javascript/application.js
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
```

```ruby
 # app/assets/stylesheets/application.css
/*
 * This is a manifest file that'll be compiled into application.css, which will include all the files
 * listed below.
 *
 * Any CSS and SCSS file within this directory, lib/assets/stylesheets, vendor/assets/stylesheets,
 * or vendor/assets/stylesheets of plugins, if any, can be referenced here using a relative path.
 *
 * You're free to add application-wide styles to this file and they'll appear at the bottom of the
 * compiled file so the styles you add here take precedence over styles defined in any styles
 * defined in the other CSS/SCSS files in this directory. It is generally better to create a new
 * file per style scope.
 *
 *= require_tree .
 *= require_self
 */
```

### Priduction環境の場合
- 1. 事前にファイルをコンパイルする
- ターミナル
`$ rake assets:precompile`
- 上記コマンドを入力することにより
- (1)マニフェストファイルからアセットパスによりファイルを呼び出し
- (2)呼び出したファイルをコンパイル(コンパイルが必要な場合)
- (3)マニフェストファイルに呼び出したファイルを結合
- (4)(1)〜(3)を繰り返す
- (5)マニフェストファイル単位で一つのファイルにまとめる
- (6)JavaScriptとCSSは圧縮を行う(minify)
- (7)ダイジェスト付与
- (8k)public/assetsパスに(5)を書き出しの処理を行う

### 2. public/assetsパスからファイルを読み込む
- JavaScriptやCSSを読み込むためのヘルパーメソッドは、Production環境ではpublic/assetsディレクトリから読み込む

- 補足
- プリコンパイル対象は、デフォルトではapplication.jsとapplication.cssとJavaScriptでもCSSでもないフォルダのみ

- (プリコンパイル対象にマニフェストファイルを追加する場合)

- 例：search.jsを追加

```ruby
config/environment/production.rb
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added
config.assets.precompile += %w( search.js )
```
