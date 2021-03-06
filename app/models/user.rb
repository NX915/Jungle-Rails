class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }, confirmation: true

  def self.authenticate_with_credentials (email, password)
    user = User.find_by('LOWER(email)= ?', email.strip.downcase)
    if user
      user.authenticate(password)
    else
      user
    end
  end
end
