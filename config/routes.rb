Rails.application.routes.draw do
  resources :items
  resources :carts
  resources :cart_items
  post '/bulk_create', controller: :cart_items, action: :bulk_create
end
