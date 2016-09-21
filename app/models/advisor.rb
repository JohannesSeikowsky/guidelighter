class Advisor < ActiveRecord::Base

  # associations
  has_one :profile
  has_many :listings

  # validations
  validates_presence_of :first_name, :second_name
  validates_length_of :email, minimum: 6
  # making sure email is unique and JSeiko@ is treated just like jseiko...case sensitivity
  validates :email, uniqueness: { case_sensitive: false }
  validates :password_provided, length: { minimum: 6 }

  # password security implementation
  attr_accessor :password_provided
  before_save :set_passwords

  def set_passwords
    self.password_salt = BCrypt::Engine.generate_salt
    self.password = BCrypt::Engine.hash_secret(password_provided, password_salt)
  end

end
