class Recipe
  attr_reader :id, :name, :img_src
  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @img_src = data[:attributes][:img_src]
  end
end
