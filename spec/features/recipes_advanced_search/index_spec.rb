require "rails_helper"

RSpec.describe "Recipes Advanced Search Index Page" do
  
  it 'displays recipes after using the search bar', :vcr do
    visit "/recipes_advanced_search"

    within(".default-search-form") do
      fill_in :search, with: "Potato"
      click_button "Search"
    end

    expect(page.status_code).to eq 200

    expect(current_path).to eq(recipes_path)
    expect(page).to have_content("Potato Leek Soup")
    expect(page).to have_content("Potato Chip Brownies")
  end
end