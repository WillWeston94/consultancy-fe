class RecipeFacade
  attr_reader :search
  def initialize(search)
    @search = search
  end

  def recipes
    data = RecipeDatabaseService.new.recipes_by_keyword(@search)

    data[:data].map do |recipe_data|
      Recipe.new(recipe_data)
    end
  end

  def show_recipe
    data = RecipeDatabaseService.new.find_recipe(@search)
    Recipe.new(data[:data])
  end
end