Rails.application.routes.draw do
  resources :shopping_cart_items
  resources :purchases
  resources :items
  resources :buyers
  resources :shopping_carts do
    resources :purchases
  end

   #should be create on sc-item?
  get '/home', to: 'home#welcome', as: 'home'
  post 'items/:id/add_to_cart', to: 'items#add_to_cart'

  get '/sessions/new', to: 'sessions#new', as: 'new_login'
  post '/sessions', to: 'sessions#create', as: 'login'
  delete '/session', to: 'sessions#destroy', as: 'logout'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
