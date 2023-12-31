require 'rails_helper'

RSpec.describe "User Registration", type: :feature do
  it "can create a new user" do
    visit root_path
    expect(page).to_not have_content("Log Out")

    click_link "Create Account"

    expect(page).to have_current_path(new_user_registration_path)

    fill_in :user_email, with: "kiwibird@gmail.com"
    fill_in :user_password, with: "123pass"
    fill_in :user_password_confirmation, with: "123pass"
    click_button "Sign up"

    expect(page).to have_content("Log Out")
  end

  it "throws an error if the user doesn't fill out the form entirely or passwords don't match" do
    visit new_user_registration_path

    fill_in :user_email, with: "kiwibird@gmail.com"
    click_button "Sign up"

    expect(page).to have_content("Password can't be blank")

    fill_in :user_email, with: "kiwibird@gmail.com"
    fill_in :user_password, with: "123pass"
    click_button "Sign up"

    expect(page).to have_content("Password confirmation doesn't match")
    
    fill_in :user_email, with: ""
    fill_in :user_password, with: "123pass"
    fill_in :user_password_confirmation, with: "123pass"
    click_button "Sign up"
  
    expect(page).to have_content("Email can't be blank")
  end
end