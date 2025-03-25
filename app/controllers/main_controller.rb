class MainController < ApplicationController
  def index
    @recipes = Recipe.all  # Fetch all recipes
  end
end
