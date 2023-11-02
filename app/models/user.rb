class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password

  has_secure_password
end