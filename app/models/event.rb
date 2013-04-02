class Event < ActiveRecord::Base
  belongs_to :dwelling
  belongs_to :user
  attr_accessible :date, :description, :title

  validates :title, :presence => true
  validates :user, :presence => true
  validates :dwelling, :presence => true

end
