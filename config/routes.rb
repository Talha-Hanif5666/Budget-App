Rails.application.routes.draw do
  devise_for :users
  resources :transactions
  resources :categories
  resources :users
  
  root "splash#index"
end
