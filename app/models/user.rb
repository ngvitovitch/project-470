class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :dwelling_id
  belongs_to :dwelling

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true

  validates :email, :uniqueness => true
  has_secure_password

  def name
    return "#{first_name} #{last_name}"
  end

  def join_dwelling dwelling
    self.dwelling = dwelling
    self.save
  end
end
