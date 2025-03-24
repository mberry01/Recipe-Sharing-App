Rails.application.routes.draw do
  # Set the login page as the root path
  root "login#index"

  # Define the routes for the other pages
  get "/main", to: "main#index"
  get "/profile", to: "profile#index"
  get "/post", to: "post#index"
  get "/settings", to: "settings#index"

  # Navigation links
  get "/logout", to: "login#index"  # Go back to login from any page
end
