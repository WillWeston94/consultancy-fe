class RecipesController < ApplicationController
  def index
    @recipe_facade = RecipeFacade.new(params[:search])
  end

  def show
    recipe_id = params[:id]
    @recipe_facade = RecipeShowFacade.new(recipe_id)
  end

  def new
  end

  def create
    params_hash = {
      "title" => params[:title],
      "servings" => params[:servings],
      "prep_time" => params[:prep_time],
      "ingredients" => params[:ingredients],
      "instructions" => params[:instructions]
    }
    RecipeDatabaseService.new.create_recipe(params_hash)
  end
end