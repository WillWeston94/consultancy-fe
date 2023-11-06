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
    #Interesting, it defaults to 10 results.  This will need to be refactored to properly display all recipes
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

  it "sends the user to the recipe advancaed search page after clicking the button", :vcr do
    visit "/recipes"
    click_button("Advanced Search")

    expect(current_path).to eq(recipes_advanced_search_index_path)
  end

  #Will need to include tests about images
  #Will need to include search bar on search results page 
  #Will need to include advanced search button on search results page
end