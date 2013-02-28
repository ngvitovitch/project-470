class Dwelling < ActiveRecord::Base
  attr_accessible :name, :owner
  belongs_to :owner, :class_name => 'User'
  has_many :users
  has_many :invites

  validates_presence_of :name, :owner
end
