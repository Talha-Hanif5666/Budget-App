Rails.application.routes.draw do
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  devise_for :users
  resources :transactions
  resources :categories
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "splash#index"
end