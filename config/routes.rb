Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [ :new, :create ]
  resources :passwords, param: :token
  resources :recipes


  # Set the main page as root
  root "main#index"

  get "/main", to: "main#index"
  get "/profile", to: "users#show", as: :profile
  get "/post", to: "recipes#new"
  get "/settings", to: "settings#index"
end
