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

  it 'allows the user to search with the breakfast filter', :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      fill_in :advanced_search, with: "Cake"
      find(:css, "#breakfast").set(true)
      click_button "Search"
    end

    expect(page.status_code).to eq 200

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Coffee Cake")
  end

  it "allows the user to use the main course checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#main_course").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Grilled Romaine Salad")
  end

  it "allows the user to use the side dish checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#side_dish").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Tennessee Onions Side Dish")
    expect(page).to have_content("Broiled Tofu")
  end

  it "allows the user to use the dessert checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#dessert").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Dirt Dessert")
    expect(page).to have_content("Cherry Clafouti")
  end

  it "allows the user to use the appetizer checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#appetizer").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Easy Ham & Pineapple Appetizer")
    expect(page).to have_content("Fresh Mex Salsa")
  end


  it "allows the user to use the salad checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#salad").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Larb Salad")
    expect(page).to have_content("Fresh Lentil Salad")
  end

  it "allows the user to use the soup checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#soup").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Miso Soup With Thin Noodles")
    expect(page).to have_content("Spring Vegetables Soup")
  end
  it "allows the user to use the beverage checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#beverage").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Roja Sangria")
    expect(page).to have_content("Watermelon Lemonade with Rosemary")
  end

  it "allows the user to use the sauce checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#sauce").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Mop Sauce")
    expect(page).to have_content("Cod Fillet In Lemon Grass Shallot Sauce")
  end

  it "allows the user to use the marinade checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#marinade").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Jamaican Jerk Rub And Seasoning")
  end

  it "allows the user to use the snack checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#snack").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Peanut Butter Yogurt Snack Dip")
    expect(page).to have_content("Cilantro Hummus")
  end

  it "allows the user to use the ketogenic checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#ketogenic").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Beef Tataki")
    expect(page).to have_content("Tuna Stuffed Cherry Tomatoes")
  end

  it "allows the user to use the vegetarian checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#vegetarian").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Vegetarian Haggis")
    expect(page).to have_content("Spiced Lassi")
  end

  it "allows the user to use the vegan checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#vegan").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Vegan Eggnog")
    expect(page).to have_content("Basic Hummus")
  end

  it "allows the user to use the pescetarian checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#pescetarian").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Thai Shrimp")
    expect(page).to have_content("Summertime Seafood Pie")
  end

  it "allows the user to use the paleo checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#paleo").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Paleo Butternut Squash Soup")
    expect(page).to have_content("Poppy Zucchini Salad")
  end

  it "allows the user to use the primal checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#primal").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Tzadziki")
    expect(page).to have_content("Baked Jalapeno Dip")
  end

  it "allows the user to use the low FODMAP checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#low_fodmap").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Slow Cooker BBQ Shredded Chicken Sliders")
    expect(page).to have_content("Almond Joy Protein Shake")
  end

  it "allows the user to use the whole30 checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#whole30").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Sweet Potato Toast")
    expect(page).to have_content("Korean Perilla Pesto")
  end

  xit "allows the user to use the dairy free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#dairy_free").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Placeholder")
  end

  xit "allows the user to use the egg free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#egg_free").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Placeholder")
  end

  xit "allows the user to use the gluten free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#gluten_free").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Placeholder")
  end

  xit "allows the user to use the grain free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#grain_free").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Placeholder")
  end

  xit "allows the user to use the peanut free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#peanut_free").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Placeholder")
  end

  xit "allows the user to use the seafood free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#seafood_free").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Placeholder")
  end

  xit "allows the user to use the sesame free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#sesame_free").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Placeholder")
  end

  xit "allows the user to use the shellfish free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#shellfish_free").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Placeholder")
  end

  xit "allows the user to use the soy free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#soy_free").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Placeholder")
  end

  xit "allows the user to use the sulfite free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#sulfite_free").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Placeholder")
  end

  xit "allows the user to use the tree nut free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#tree_nut_free").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Placeholder")
  end

  xit "allows the user to use the wheat free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#wheat_free").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Placeholder")
  end

  xit "allows the user to search when using many filters", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      fill_in :advanced_search, with: "Cheese"
      find(:css, "#breakfast").set(true)
      find(:css, "#vegetarian").set(true)
      find(:css, "#soy_free").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Placeholder")
  end
end