class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth) # needs to be passed in an auth object that includes the provider and uid of the user
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user| # if the user doesn't exist, create one
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20] # generate a password since this was routed through oauth
      user.full_name = auth.info.name
      user.avatar_url = auth.info.image
      # user.skip_confirmation! uncomment this if we trust google's verification, 2fa??
    end
  end
end