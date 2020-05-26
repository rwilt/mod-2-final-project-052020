Rails.application.routes.draw do
  resources :sellers_carts
  resources :buyers_carts
  resources :sellers
  resources :items
  resources :buyers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
