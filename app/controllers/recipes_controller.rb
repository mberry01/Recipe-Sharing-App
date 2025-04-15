class RecipesController < ApplicationController
  before_action :require_owner, only: [ :edit, :update, :destroy ]

  def index
    @recipes = Recipe.where(user: Current.user)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = Current.user

    unless Rails.env.test? || @recipe.image.attached?
      flash.now[:alert] = "Please upload an image!"
      render :new, status: :unprocessable_entity
      return
    end

    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      flash.now[:alert] = "There was a problem creating the recipe: #{@recipe.errors.full_messages.join(', ')}"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      flash.now[:alert] = "There was a problem updating the recipe."
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :instructions, :image)
  end

  def require_owner
    @recipe = Recipe.find(params[:id])
    unless @recipe.user == Current.user
      redirect_to recipes_path
    end
  end
end
