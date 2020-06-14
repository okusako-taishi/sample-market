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
<<<<<<< HEAD
  resources :items, only: [:show, :new] do
=======
  resources :items, only: [:show, :new, :create, :edit, :update, :destroy] do
>>>>>>> サーバーサイド商品出品-奥迫
    collection do
      get 'buy'
    end
  end
end
