class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :dwelling_id

  has_one :owned_dwelling, :class_name => 'Dwelling', :foreign_key => 'owner_id'
  has_many :bill_payments
  has_many :messages
  has_many :chores
  has_many :shopping_lists
  belongs_to :dwelling

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true

  validates :email, :uniqueness => true
  has_secure_password

  def name
    return "#{first_name} #{last_name}"
  end

end
