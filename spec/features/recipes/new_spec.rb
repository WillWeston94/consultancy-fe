require "rails_helper"

RSpec.describe "New Recipe Page", type: :feature do
    xit "can create a new recipe" do
    visit "/recipes/new"
    fill_in :title, with: "Chicken Parmesan"
    fill_in :servings, with: 4
    fill_in :prep_time, with: 20
    fill_in :ingredients, with: "Chicken, Mozzarella, Sauce"
    fill_in :instructions, with: "Step 1: Cook Chicken, Step 2: Add Sauce, Step 3: Add Cheese, Step 4: Bake, Step 5: Forget about it in the oven, Step 6: Order Pizza"

    attach_file('Image', Rails.root.join('spec', 'support', 'chicken.jpg'))

    click_button "Create Recipe"

    save_and_open_page
    expect(page).to have_content("Recipe Created Successfully")
    expect(page).to have_css('img.recipe-image')
    expect(page).to have_content("Chicken Parmesan")
  end
end