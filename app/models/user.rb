class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  validates :password, confirmation: { case_sensitive: true }
  validates :api_key, uniqueness: true
  
  has_secure_password
  has_secure_token :api_key
end
