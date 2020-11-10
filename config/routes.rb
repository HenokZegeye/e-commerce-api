Rails.application.routes.draw do
  resources :items
  resources :carts
  resources :cart_items
end
