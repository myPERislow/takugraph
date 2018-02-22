Rails.application.routes.draw do

  root to: 'albums#index'

  get 'home/flow', to: 'home#flow'

  # :controllersオプションで使用するコントローラを指定しています。
  # ちなみに'users/sessions'のusersはapp/controllers/usersディレクトリのことを表し、sessionsはsessions_controller.rbファイルの先頭を表しています。
  # そのため、実際のディレクトリ構造とファイル名とがこの設定と一致していないとうまく動きません。
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :albums

  namespace :admin do
    resources :orders
  end

  # ユーザー一覧ページ
  get '/users', to: 'users#index'
  # ユーザーのマイページ
  get '/users/:id', to: 'users#show'
  get '/users/:id/schedule', to:'users#add_schedule', as: 'users_add_schedule'
  patch '/users/:id/update', to:'users#update', as: 'users_update_shcedule'
  get '/users/:id/schedule/index', to:'users#show_schedule', as: 'users_schedule'
end

# After signing in a user, confirming the account or updating the password,
# Devise will look for a scoped root path to redirect to.
# For instance, when using a :user resource, the user_root_path will be used if it exists
# ; otherwise, the default root_path will be used. T
# his means that you need to set the root inside your routes:

# root to: 'home#index'
# You can also override after_sign_in_path_for and after_sign_out_path_for to customize your redirect hooks.
