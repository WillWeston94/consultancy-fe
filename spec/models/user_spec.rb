require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email).case_insensitive}
    it {should validate_presence_of(:password)}
  end

  describe "class methods" do
    describe "#from_omniauth" do
      it "returns a user based on auth and uid" do
        uid = 100974177833685581970
        provider = "google_oauth2"
        
        auth = double("auth")
        allow(auth).to receive(:uid).and_return(uid)
        allow(auth).to receive(:provider).and_return(provider)

        user = User.create!(email: "kiwibird@gmail.com", password: "123456", uid: "#{uid}", provider: "#{provider}")

        expect(User.from_omniauth(auth)).to eq(user)
      end
    end
  end
end