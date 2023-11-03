class Recipe
  attr_reader :name, :img_src
  def initialize(data)
    @name = data[:attributes][:name]
    @img_src = data[:attributes][:img_src]
  end
end
