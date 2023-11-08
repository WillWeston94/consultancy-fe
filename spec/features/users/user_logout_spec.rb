require 'rails_helper'

RSpec.describe "User Logout", type: :feature do
  xit "can log a user out" do
    visit register_path
    fill_in :user_email, with: "kiwibird@gmail.com"
    fill_in :user_password, with: "123pass"
    fill_in :user_password_confirmation, with: "123pass"
    click_button "Create Account"

    expect(page).to have_link("Log Out")
    click_link "Log Out"

    expect(page).to have_current_path(root_path)
    expect(page).to have_link("Log In")
  end
end