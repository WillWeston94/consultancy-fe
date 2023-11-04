class RecipesAdvancedSearchController < ApplicationController
  def index
    @recipe_facade = RecipeFacade.new(params[:advanced_search])
  end

  def show
  end
end