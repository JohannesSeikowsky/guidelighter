class Advisor < ActiveRecord::Base

  # associations
  has_one :profile
  has_many :listings

  # password security
  attr_accessor :provided_password
  before_save :set_passwords

  def set_passwords
    self.password_salt = BCrypt::Engine.generate_salt
    self.password = BCrypt::Engine.hash_secret(provided_password, password_salt)
  end

end
