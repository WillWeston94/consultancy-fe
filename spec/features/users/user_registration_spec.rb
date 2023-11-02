require 'rails_helper'

RSpec.describe "User Registration", type: :feature do
  it "can create a new user" do
    visit root_path
    expect(page).to_not have_content("Log Out")
    
    click_link "Log In"
    click_link "Create an Account"

    expect(page).to have_current_path(register_path)

    fill_in :email, with: "kiwibird@gmail.com"
    fill_in :password, with: "123pass"
    fill_in :password_confirmation, with: "123pass"
    click_button "Create Account"

    expect(page).to have_content("Log Out")
  end
end