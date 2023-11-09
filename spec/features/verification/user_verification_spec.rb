require "rails_helper"

RSpec.describe "Two-Factor Authentication", type: :feature do
  let(:user) { create(:user) }

  before do
    allow_any_instance_of(TwilioVerifyService).to receive(:send_verification_code).and_return(double('Response', status: 'pending'))
    allow_any_instance_of(TwilioVerifyService).to receive(:check_verification_code).and_return(double('Response', status: 'approved'))
  end


  describe "2FA Authentication" do
    xit "User signs in with Google and is prompted to verify with SMS phone number" do
      visit new_user_session_path

      mock_auth_hash(:google_oauth2)
      click_link "Sign in with Google"

      expect(page).to have_current_path(verify_send_code_path)

      expect(page).to have_content("Please verify your phone number")
      expect(page).to have_content("We sent a verification code to #{user.phone_number}")

      fill_in "code", with: "123456"
      click_button "Verify"

      expect(page).to have_current_path(root_path)
      expect(page).to have_content("Phone number verified successfully")

      expect(user.reload.two_factor_verified?).to eq(true)
    end
  end
end