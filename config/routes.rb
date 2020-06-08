Rails.application.routes.draw do
  devise_for :users
  root 'items#buy'
  resources :users, only: :show
  resources :items, only: [:show, :new] do
    member do
      get 'buy'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items, only: [:new]
end
