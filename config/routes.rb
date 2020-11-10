Rails.application.routes.draw do
  resources :items
  resources :carts
  resources :cart_items
  resources :users
  post '/bulk_create', controller: :cart_items, action: :bulk_create
  post '/login', controller: :access, action: :login
end
