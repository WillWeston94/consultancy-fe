class RecipesAdvancedSearchController < ApplicationController
  def index
    all_filters = filtering_params(params)
    @recipe_advanced_search_facade = RecipeAdvancedSearchFacade.new(params[:advanced_search], all_filters)
  end

  def show
  end

  private

  def filtering_params(params)
    params.slice(:breakfast, :vegetarian, :main_course)
  end
  
end