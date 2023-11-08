require  "rails_helper"

RSpec.describe Recipe do
  it "exists" do
    attrs = { attributes: {
      name: "Mom's Spaghetti",
      img_src: "https://image.url/knees_weak_arms_heavy",
      servings: 1,
      readyInMinutes: 2,
      instructions: ["vomit on your sweater"],
      ingredients: ["pasta", "sauce"]
      }
    }

    recipe = Recipe.new(attrs)

    expect(recipe).to be_a Recipe
    expect(recipe.name).to eq("Mom's Spaghetti")
    expect(recipe.img_src).to eq("https://image.url/knees_weak_arms_heavy")
    expect(recipe.servings).to eq(1)
    expect(recipe.cooking_time).to eq(2)
    expect(recipe.instructions).to eq(["vomit on your sweater"])
    expect(recipe.ingredients).to eq(["pasta", "sauce"])
  end
end