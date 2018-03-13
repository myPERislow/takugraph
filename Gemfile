source 'https://rubygems.org' 

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# base
gem 'rails', '~> 5.1.4'

# database
gem 'mysql2', '>= 0.3.18', '< 0.5'

# server
gem 'puma', '~> 3.7'

# view
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

# 納品周りのgem
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'

# Haml
gem 'haml-rails'

# devise
gem 'devise'


# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'dotenv-rails'

# javascriptへのリンクを統括するため
gem 'webpacker', github: 'rails/webpacker'

# seedsデータを作るためのgem
gem 'seed-fu'

# パンくずリスト作るため
gem 'gretel'

# 出力結果を表として出力するgem
gem 'hirb'

# マルチバイト文字の表示を補正するgem
gem 'hirb-unicode'

#1. Be sure to restart your server when you modify this file.
#2. ↓この行をコメントアウト
#3. Rails.applicaion.config.session_store :cookie_store, key: '_redistest_session'
gem 'redis'
gem 'redis-rails'

# Sidekiqをインストール
# Sidekiqは、resqueやdelayed_jobなどのような非同期処理を行いたい時に使うライブラリです
# 複数のジョブを同時に実行することにより、メモリを節約する事が可能です
gem 'sidekiq'
gem 'sinatra', require: false # ダッシュボードを利用するため

# railからslackにメッセージを送るslack-notifier
gem "slack-notifier"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # デバッグ用のgemを追加
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-byebug'
  gem 'pry-rails'
  # erbをhamlに変換
  gem 'erb2haml'
end

group :test do
  # Capybara本体
  gem 'capybara'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
