require "rails_helper"

RSpec.describe "Recipes Show Page" do
  it "displays all attributes of a recipe when on the show page", :vcr do

    visit "/recipes/715497"

    expect(page).to have_content("Berry Banana Breakfast Smoothie")
    
    img_element = find("img")
    expect(img_element).to be_visible 

    expect(page).to have_content("Servings: 1")
    expect(page).to have_content("Prep Time: 5 Minutes")
    expect(page).to have_content("1 cup soy milk")
    expect(page).to have_content("Add in the berries")
  end

  it "displays all attributes of another recipe when on the show page", :vcr do
    visit "/recipes/716381"

    expect(page).to have_content("Nigerian Snail Stew")
    
    img_element = find("img")
    expect(img_element).to be_visible 

    expect(page).to have_content("Servings: 1")
    expect(page).to have_content("Prep Time: 45 Minutes")
    expect(page).to have_content("3 Limes")
    expect(page).to have_content("wash the snails")
  end
end