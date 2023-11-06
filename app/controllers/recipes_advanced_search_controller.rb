class RecipesAdvancedSearchController < ApplicationController
  def index
    all_filters = filtering_params(params)
    @recipe_advanced_search_facade = RecipeAdvancedSearchFacade.new(params[:advanced_search], all_filters)
  end

  def show
  end

  private

  def filtering_params(params)
    params.slice(:breakfast, :main_course, :side_dish, :dessert, :appetizer, :salad, :soup, :beverage, :sauce, :marinade, :snack, :ketogenic, :vegetarian, :vegan, :pescetarian, :paleo, :primal, :low_fodmap, :whole30, :dairy_free, :egg_free, :gluten_free, :grain_free, :peanut_free, :seafood_free, :sesame_free, :shellfish_free, :soy_free, :sulfite_free, :tree_nut_free )
  end
  
end