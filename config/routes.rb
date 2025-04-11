Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [ :new, :create ]
  resources :passwords, param: :token
  resources :recipes, only: [ :index, :show ]

  # Set the main page as root
  root "main#index"

  get "/main", to: "main#index"
  get "/profile", to: "profile#index"
  get "/post", to: "post#index"
  get "/settings", to: "settings#index"
end
