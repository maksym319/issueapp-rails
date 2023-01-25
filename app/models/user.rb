class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { message: "Same username exists. Please use another name." }
end
