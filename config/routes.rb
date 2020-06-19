Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }

  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
  end

  # resources :items do
  #   item 'add' => 'favorites#create'
  #   delete '/add' => 'favorites#destroy'
  # end

  root 'items#index'
  resources :users, only: :show do
    collection do
      get 'logout'
    end
  end

  resources :items, only: [:show, :new, :create, :edit, :update, :destroy] do
    post 'add' => 'favorites#create'
    delete '/add' => 'favorites#destroy'
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :purchases, only: :index do
      member do
        get 'buy'
        post 'pay'
      end
    end
  end
  
  resources :cards, only: [:new, :create, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end
  resources :categories ,only: [:show, :index]
end
