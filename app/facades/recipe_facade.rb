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
end