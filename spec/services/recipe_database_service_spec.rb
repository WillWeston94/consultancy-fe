require 'rails_helper'

describe RecipeDatabaseService do
  context "class methods" do
    context "#recipes_by_keyword" do
      it "returns recipes related to the keyword", :vcr do
        search = RecipeDatabaseService.new.recipes_by_keyword("potato")

        expect(search).to be_a Hash
        expect(search[:data]).to be_an Array

        recipe_data = search[:data].first

        expect(recipe_data[:attributes]).to have_key :name
        expect(recipe_data[:attributes][:name]).to be_a(String)

        expect(recipe_data[:attributes]).to have_key :img_src
        expect(recipe_data[:attributes][:img_src]).to be_a(String)
      end
    end

    context "#recipes_by_keyword_with_intolerances" do
      it "returns recipes related to the keyword", :vcr do
        search = RecipeDatabaseService.new.recipes_by_keyword_with_intolerances("potato", "dairy")

        expect(search).to be_a Hash
        expect(search[:data]).to be_an Array

        recipe_data = search[:data].first

        expect(recipe_data[:attributes]).to have_key :name
        expect(recipe_data[:attributes][:name]).to be_a(String)

        expect(recipe_data[:attributes]).to have_key :img_src
        expect(recipe_data[:attributes][:img_src]).to be_a(String)
      end
    end
  end
end