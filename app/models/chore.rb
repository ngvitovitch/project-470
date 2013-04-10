class Chore < ActiveRecord::Base
  attr_accessible :assigned_user_id, :description, :dwelling_id, :name

  belongs_to :dwelling
  has_one :user

  #validates :assigned_user_id, :presence => true
  validates :dwelling_id, :presence => true
  validates :name, :length => {:minimum => 1}
end
