Rails.application.routes.draw do
  resources :shopping_cart_items
  resources :purchases
  resources :shopping_carts
  resources :items
  resources :buyers

  get '/home', to: 'home#welcome', as: 'home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
