class Dwelling < ActiveRecord::Base
  attr_accessible :name, :owner
  has_many :users
  belongs_to :owner, :class_name => 'User'

  validates :name, :presence => true
end
