class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all  # Fetch all recipes for the main page
  end

  def show
    @recipe = Recipe.find(params[:id])  # Find recipe by ID
  end
end
