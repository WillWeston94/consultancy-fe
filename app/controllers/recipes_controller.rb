class RecipesController < ApplicationController
  def index
    @recipe_facade = RecipeFacade.new(params[:search])
  end

  def show
    recipe_id = params[:id]
    @recipe = RecipeFacade.new(recipe_id)
  end
end