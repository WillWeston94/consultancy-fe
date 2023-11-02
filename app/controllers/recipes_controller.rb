class RecipesController < ApplicationController
  def index
    @recipe_facade = RecipeFacade.new(params[:search])
  end
end