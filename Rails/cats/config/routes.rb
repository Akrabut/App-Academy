Rails.application.routes.draw do
  get 'cat_rental_requests/new'
  get 'cat_rental_requests/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cats, only: %i[create new update edit show index]
  resources :cat_rental_requests, only: %i[create new index approve! deny!]
end
