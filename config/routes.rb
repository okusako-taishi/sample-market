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
      get 'card'
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
    member do
      get 'buy'
    end
    member do
      get 'buy'
    end
  end
end
