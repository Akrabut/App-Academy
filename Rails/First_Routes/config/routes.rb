Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users
  get 'users', to: 'users#index', as: 'all_users'
  get 'users/new', to: 'users#new', as: 'new_user'
  get 'users/:id', to: 'users#show', as: 'show_user'
  post 'users', to: 'users#create', as: 'create_user'
  patch 'users/:id', to: 'users#update', as: 'patch_user'
  put 'users/:id', to: 'users#update', as: 'put_user'
  delete 'users/:id', to: 'users#destroy', as: 'delete_user'
end
