require 'rails_helper'

RSpec.describe RecipeFacade do
  describe '#recipes' do
    it 'returns an array of Recipe objects', :vcr do
        recipe_facade = RecipeFacade.new("apple")

        recipes = recipe_facade.recipes

        expect(recipes).to be_an(Array)
        expect(recipes.first).to be_a(Recipe)
    end
  end

  describe "#combine filters" do
    it "returns a string to be inputted into the search query" do
      recipe_facade = RecipeAdvancedSearchFacade.new("apple", { "dairy_free" => "1", "vegetarian" => "1"}, {})
      
      no_underscores = recipe_facade.send(:combine_filters)

      expect(no_underscores).to eq("apple dairy free vegetarian")
    end
  end
end
