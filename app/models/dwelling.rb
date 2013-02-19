class Dwelling < ActiveRecord::Base
  attr_accessible :name, :owner
  has_many :users

  validates :name, :presence => true
end
