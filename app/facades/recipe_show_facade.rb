class RecipeShowFacade
  attr_reader :recipe, :search
  def initialize(search)
    @search = search
    @recipe = get_recipe
  end

  def get_recipe
    data = RecipeDatabaseService.new.find_recipe(@search)
    Recipe.new(data[:data])
  end
end