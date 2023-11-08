class RecipesController < ApplicationController
  def index
    @recipe_facade = RecipeFacade.new(params[:search])
  end

  def show
    recipe_id = params[:id]
    @recipe_facade = RecipeShowFacade.new(recipe_id)
  end
end