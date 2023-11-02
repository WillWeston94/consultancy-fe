require "rails_helper"

RSpec.describe "Recipes Index Page" do
  it 'displays a list of recipes', :vcr do
    visit "/"

    fill_in :search, with: "Potato"
    click_button "Search"

    expect(page.status_code).to eq 200

    expect(page).to have_content("Potato")
  end
end