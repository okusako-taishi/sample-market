Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
  end

  
  root 'items#index'
  resources :users, only: :show do
    collection do
      get 'card'
      get 'logout'
    end
  end
  resources :items, only: [:show, :new, :create] do
    member do
      get 'buy'
      get 'pay'
    end
  end
  resources :cards, only: [:new, :create, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end
end
