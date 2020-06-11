Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:show, :new] 
  resources :users do

    member do
    get 'card'
    get 'logout'
    end
  end
end
