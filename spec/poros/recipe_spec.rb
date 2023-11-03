require  "rails_helper"

RSpec.describe Recipe do
  it "exists" do
    attrs = { attributes: {
      name: "Mom's Spaghetti",
      img_src: "https://image.url/knees_weak_arms_heavy"
      }
    }

    recipe = Recipe.new(attrs)

    expect(recipe).to be_a Recipe
    expect(recipe.name).to eq("Mom's Spaghetti")
    expect(recipe.img_src).to eq("https://image.url/knees_weak_arms_heavy")
  end
end