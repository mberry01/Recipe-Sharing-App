Rails.application.routes.draw do
  # RESTful routes for recipes
  resources :recipes, only: [:index, :show]  

  # Set the login page as the root path
  root "login#index"

  # Add the main page route
  get "/main", to: "main#index"

  # Other routes
  get "/profile", to: "profile#index"
  get "/post", to: "post#index"
  get "/settings", to: "settings#index"
  get "/logout", to: "login#index"  # Go back to login from any page
end
