class Recipe
  attr_reader :name, :img_src
  def initialize(data)
    @name = data[:attributes][:name]
  end
end
