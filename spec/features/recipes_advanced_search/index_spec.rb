require "rails_helper"

RSpec.describe "Recipes Advanced Search Index Page" do
  
  it 'displays recipes after using the search bar', :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      fill_in :advanced_search, with: "Potato"
      click_button "Search"
    end

    expect(page.status_code).to eq 200

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Potato Leek Soup")
    expect(page).to have_content("Potato Chip Brownies")
  end

  xit "displays a form which contains all possible options for advanced search type", :vcr do
    visit "/recipes_advanced_search"

    expect(page).to have_content("Placeholder")
  end
end