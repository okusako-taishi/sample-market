Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users do
  resources :items, only: [:show, :new]

  collection do
  get 'card'
  get 'logout'
  end
  end
end
