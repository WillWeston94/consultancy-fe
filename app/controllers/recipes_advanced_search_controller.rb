class RecipesAdvancedSearchController < ApplicationController
  def index
    @recipe_facade = RecipeFacade.new(params[:search])
  end

  def show
  end
end