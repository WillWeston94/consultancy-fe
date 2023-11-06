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
end
