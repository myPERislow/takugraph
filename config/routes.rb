Rails.application.routes.draw do

  root to: 'albums#index'

  get 'home/flow', to: 'home#flow'

  resources :albums

  namespace :admin do
    resources :orders
  end

end
