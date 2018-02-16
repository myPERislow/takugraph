Rails.application.routes.draw do

  root to: 'albums#index'

  get 'home/flow', to: 'home#flow'

  devise_for :users

  resources :users, only[:index, :show]

  resources :albums

  namespace :admin do
    resources :orders
  end

end
