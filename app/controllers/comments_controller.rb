class CommentsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(content: params[:comment]) # Adjust this line based on your param name and model

    if @comment.save
      redirect_to recipe_path(@recipe), notice: 'Comment posted!'
    else
      redirect_to recipe_path(@recipe), alert: 'Something went wrong.'
    end
  end
end
