class Event < ActiveRecord::Base
  belongs_to :dwelling
  belongs_to :user
  attr_accessible :date, :description, :title

  validates :user, :presence => true
  validates :dwelling, :presence => true

  validates :title, :presence => true
  validates :date, :presence => true
  validates :description, :presence => true

end
