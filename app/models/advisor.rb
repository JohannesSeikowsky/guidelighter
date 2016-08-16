class Advisor < ActiveRecord::Base

  # associations
  has_one :profile
  has_many :listings

  # validations
  validates_presence_of :first_name, :second_name
  validates_length_of :email, minimum: 6
  validates_uniqueness_of :email
  validates :password_provided, length: { minimum: 6 }

  # password security implementation
  attr_accessor :password_provided
  before_save :set_passwords

  def set_passwords
    self.password_salt = BCrypt::Engine.generate_salt
    self.password = BCrypt::Engine.hash_secret(password_provided, password_salt)
  end

end
