Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users
  # get 'users', to: 'users#index', as: 'all_users'
  # get 'users/:id', to: 'users#show', as: 'show_user'
  # post 'users', to: 'users#create', as: 'create_user'
  # patch 'users/:id', to: 'users#update', as: 'patch_user'
  # put 'users/:id', to: 'users#update', as: 'put_user'
  # delete 'users/:id', to: 'users#destroy', as: 'delete_user'

  resources :users, only: %i[index show create update destroy] do
    resources :artworks, only: %i[index]
  end

  resources :artworks, only: %i[index show create update destroy]

  resources :artwork_shares, only: %i[create destroy]

  resources :comments, only: %i[create destroy index]
end
