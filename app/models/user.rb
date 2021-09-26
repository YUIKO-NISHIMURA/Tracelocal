class User < ApplicationRecord
  has_secure_password
  validates :name,  :birthday, :city, :password_digest, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end
