require 'rails_helper'

RSpec.describe RecipeShowFacade do
  before(:each) do
    @search = 663931
    @facade = RecipeShowFacade.new(@search)
  end

  it "exists", :vcr do
    expect(@facade).to be_a RecipeShowFacade

    expect(@facade.search).to eq(@search)
    expect(@facade.recipe).to be_a Recipe

    recipe = @facade.recipe

    expect(recipe.id).to eq("#{@search}")
    expect(recipe.name).to eq("Tuna Mexi Melts")
  end
end