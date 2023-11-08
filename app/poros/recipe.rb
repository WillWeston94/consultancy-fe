class Recipe
  attr_reader :id, :name, :img_src, :servings, :cooking_time, :serving_size, :instructions, :ingredients
  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @img_src = data[:attributes][:img_src]
    @servings = data[:attributes][:servings]
    @cooking_time = data[:attributes][:readyInMinutes]
    @instructions = data[:attributes][:instructions]
    @ingredients = data[:attributes][:ingredients]
  end
end
