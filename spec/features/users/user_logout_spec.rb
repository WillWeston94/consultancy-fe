require 'rails_helper'

RSpec.describe "User Logout", type: :feature do
  it "can log a user out" do
    user = User.create!(email: "kiwibird@gmail.com", password: "123456")
    sign_in(user)

    visit root_path
    expect(page).to have_button("Log Out")
    click_button "Log Out"

    expect(page).to have_current_path(new_user_session_path)
  end
end