require 'rails_helper'

RSpec.describe "Dashboard", type: :feature do
  before(:each) do
    @recipe_id = 663931
    @user = User.create!(email: "kiwibird@gmail.com", password: "testaa")
  end

  it "users can add a recipe to their dashboard" do
    VCR.use_cassette('dashboard/add_recipe', match_requests_on: [:method, VCR.request_matchers.uri_without_params('user_id')]) do
      sign_in(@user)

      visit "/recipes/#{@recipe_id}"
      expect(page).to have_button "Save Recipe"

      click_button "Save Recipe"

      visit "/dashboard"

      expect(page).to have_content("Tuna Mexi Melts")
    end
  end

  it "users can remove a recipe from their dashboard" do
    VCR.use_cassette('dashboard/delete_recipe', match_requests_on: [:method, VCR.request_matchers.uri_without_params('user_id')]) do
      sign_in(@user)

      visit "/recipes/#{@recipe_id}"
      expect(page).to have_button "Save Recipe"

      click_button "Save Recipe"

      visit "/dashboard"

      expect(page).to have_content("Tuna Mexi Melts")
      expect(page).to have_button("Delete Saved Recipe")
      click_button "Delete Saved Recipe"
      expect(page).to_not have_content("Tuna Mexi Melts")
    end
  end
end