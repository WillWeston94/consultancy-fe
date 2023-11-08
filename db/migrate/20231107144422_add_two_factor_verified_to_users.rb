class AddTwoFactorVerifiedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :two_factor_verified, :boolean, default: false
  end
end
