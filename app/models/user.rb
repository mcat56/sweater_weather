class User < ApplicationRecord
  validates_presence_of :email, :password, :password_confirmation
  validates_confirmation_of :password
  validates_uniqueness_of :email, :api_key
  has_secure_password
  before_create :get_key

  def get_key
    self.api_key = SecureRandom.base64(27)
  end
end
