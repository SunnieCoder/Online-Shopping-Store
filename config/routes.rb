Rails.application.routes.draw do
  devise_for :users, sign_out_via: [:get]
  resources :orders
  resources :lineitems
  resources :carts
  get 'shopper/index'
  root "shopper#index", as: "shopper"
  # resources :products
  resources :products do
    collection do
      get 'search', to: 'products#search'
    end
  end

  # Define a custom route for shopper's view of the product
  get 'shopper/products/:id', to: 'shopper#show_product', as: :shopper_product
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
