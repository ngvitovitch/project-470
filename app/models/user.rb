class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  validates :email, :uniqueness => true
  has_secure_password

  def name
    return "#{first_name} #{last_name}"
  end
end
