class User < ApplicationRecord
  validates_presence_of :email, :api_key, :password, :password_confirmation
  validates_confirmation_of :password
  validates_uniqueness_of :email, :api_key

end
