Rails.application.routes.draw do

  root to: 'albums#index'

  get 'home/flow', to: 'home#flow'

  devise_for :users

  resources :albums

  namespace :admin do
    resources :orders
  end

end

# After signing in a user, confirming the account or updating the password,
# Devise will look for a scoped root path to redirect to.
# For instance, when using a :user resource, the user_root_path will be used if it exists
# ; otherwise, the default root_path will be used. T
# his means that you need to set the root inside your routes:

# root to: 'home#index'
# You can also override after_sign_in_path_for and after_sign_out_path_for to customize your redirect hooks.
