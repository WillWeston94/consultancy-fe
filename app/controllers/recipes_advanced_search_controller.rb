class RecipesAdvancedSearchController < ApplicationController
  def index
    all_filters = filtering_params(params)
    all_intolerances = filtering_intolerances(params)
    @recipe_advanced_search_facade = RecipeAdvancedSearchFacade.new(params[:advanced_search], all_filters, all_intolerances)
  end

  def show
  end

  private

  def filtering_params(params)
    params.slice(:breakfast, :main_course, :side_dish, :dessert, :appetizer, :salad, :soup, :beverage, :sauce, :marinade, :snack, :ketogenic, :vegetarian, :vegan, :pescetarian, :paleo, :primal, :low_fodmap, :whole30)
  end

  def filtering_intolerances(params)
    params.slice(:dairy, :egg, :gluten, :grain, :peanut, :seafood, :sesame, :shellfish, :soy, :sulfite, :tree_nut)
  end
  
end