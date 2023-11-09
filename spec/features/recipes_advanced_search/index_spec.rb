#Warning: The individual check box tests suck.  They are dependent on the API, and can fail if the API is altered
#Also, after getting adding the intolerance parameter, the searches aren't 100% perfect.  Since we still get a ton of results, I'm ignoring this for now

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
    expect(page).to have_content("Trinidadian Chicken Potato Curry")
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
    expect(page).to have_content("Easy 7 Layer Salad Side Dish")
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
    expect(page).to have_content("Pork Chops With Blackberry Port Sauce")
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
    expect(page).to have_content("Vegan Potato Salad")
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

  it "allows the user to use the dairy free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#dairy").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Slow Cooker Beef Stew")
    expect(page).to have_content("Chicken Liver Salad")
  end

  it "allows the user to use the egg free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#egg").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Turkey Tomato Cheese Pizza")
    expect(page).to have_content("Peanut Butter and Jelly Smoothie")
  end

  it "allows the user to use the gluten free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#gluten").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Garlicky Kale")
    expect(page).to have_content("Salmon Caesar Salad")
  end

  it "allows the user to use the grain free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#grain").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Red Lentil Soup with Chicken and Turnips")
    expect(page).to have_content("Delightful Kale and Cabbage Slaw")
  end

  it "allows the user to use the peanut free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#peanut").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).not_to have_content("Chocolate Peanut Butter Cinnamon Smoothie")
    expect(page).to have_content("Berry Banana Breakfast Smoothie")
    expect(page).to have_content("Salmon Quinoa Risotto")
  end

  it "allows the user to use the seafood free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#seafood").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Chicken Fajita Stuffed Bell Pepper")
    expect(page).to have_content("Nigerian Snail Stew")
  end

  it "allows the user to use the sesame free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#sesame").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Berry Banana Breakfast Smoothie")
    expect(page).to have_content("Lebanese Tabouleh")
  end

  it "allows the user to use the shellfish free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#shellfish").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Butternut Squash Frittata")
    expect(page).to have_content("Salmon Quinoa Risotto")
  end

  it "allows the user to use the soy free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#soy").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Turkey Tomato Cheese Pizza")
    expect(page).to have_content("Ground Turkey Stuffed Peppers")
  end

  it "allows the user to use the sulfite free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#sulfite").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Slow Cooker Beef Stew")
    expect(page).to have_content("Detox slaw")
  end

  it "allows the user to use the tree nut free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#tree_nut").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Berry Banana Breakfast Smoothie")
    expect(page).to have_content("Brown Butter Twice Baked Sweet Potatoes")
  end

  it "allows the user to use the wheat free checkbox", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      find(:css, "#wheat").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Chicken Fajita Stuffed Bell Pepper")
    expect(page).to have_content("My Favorite Navy Bean Soup")
  end

  it "allows the user to search when using many filters, as well as an intolerance", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      fill_in :advanced_search, with: "Cheese"
      find(:css, "#breakfast").set(true)
      find(:css, "#vegetarian").set(true)
      find(:css, "#soy").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Breakfast Pretzels")
    expect(page).to have_content("Miniature Vegetable Quiches")
  end

  it "allows ths user to search when selecting multiple intolerances", :vcr do
    visit "/recipes_advanced_search"

    within(".advanced-search-form") do
      fill_in :advanced_search, with: "Egg"
      find(:css, "#dairy").set(true)
      find(:css, "#soy").set(true)
      click_button "Search"
    end

    expect(current_path).to eq(recipes_advanced_search_index_path)
    expect(page).to have_content("Egg Salad Wrap")
    expect(page).to have_content("Bing's Banana Cake")
  end
end