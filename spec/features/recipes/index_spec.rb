require "rails_helper"

RSpec.describe "Recipes Index Page" do
  it "displays a recipe seach bar on every page", :vcr do
    visit "/"
    expect(page).to have_button("Search")

    visit("/recipes")
    expect(page).to have_button("Search")
  end

  it 'displays recipes after using the search bar', :vcr do
    visit "/"

    fill_in :search, with: "Potato"
    click_button "Search"

    expect(page.status_code).to eq 200
    expect(current_path).to eq(recipes_path)
    expect(page).to have_content("Potato Leek Soup")
    expect(page).to have_content("Potato Chip Brownies")
  end

  it "displays recipes, even when the user doesn't enter any ingredients into the search bar", :vcr do
    visit "/"

    click_button "Search"

    expect(page.status_code).to eq 200
    expect(current_path).to eq(recipes_path)
    expect(page).to have_content("Cannellini Bean and Asparagus Salad with Mushrooms")
  end

  it "displays a search bar specific to the recipe results page", :vcr do
    visit "/recipes"

    within(".default-search-form") do
      expect(page).to have_button("Search")
    end

    within(".header-search-form") do
      expect(page).to have_button("Search")
    end

  end

  it "sends the user to the recipe advanced search page after clicking the advanced search button", :vcr do
    visit "/recipes"
    click_button("Advanced Search")

    expect(current_path).to eq(recipes_advanced_search_index_path)
  end


  it "sends the user to the show page when clicking on the text", :vcr do
    visit "/"

    fill_in :search, with: "Nigerian Snail Stew"
    click_button "Search"

    within(".card-title") do
      click_link "Nigerian Snail Stew"
    end
  
    expect(current_path).to eq("/recipes/716381")
  end
end