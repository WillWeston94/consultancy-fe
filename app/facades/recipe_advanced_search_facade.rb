class RecipeAdvancedSearchFacade
  attr_reader :search
  def initialize(search, filtered_params)
    @search = search
    @filtered_params = filtered_params

  end

  def recipes
    advanced_search = combine_filters
    data = RecipeDatabaseService.new.recipes_by_keyword(advanced_search)

    data[:data].map do |recipe_data|
      Recipe.new(recipe_data)
    end
  end

  private

  def combine_filters
    search = [@search]

    @filtered_params.each do |k,v|
      search << k if v == "1"
    end

    search.join(" ")
  end
end