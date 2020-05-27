Rails.application.routes.draw do
  resources :shopping_cart_items
  resources :purchases
  resources :shopping_carts
  resources :items
  resources :buyers
  
   #should be create on sc-item?
  get '/home', to: 'home#welcome', as: 'home'
  post 'items/:id/add_to_cart', to: 'items#add_to_cart'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
