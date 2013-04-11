class Event < ActiveRecord::Base
	scope :upcoming, order(:date).where(['date >= ?', Date.today]).limit(4)
  belongs_to :dwelling
  belongs_to :user
  attr_accessible :date, :description, :title

  validates :user, :presence => true
  validates :dwelling, :presence => true

  validates :title, :presence => true
  validates :date, :presence => true
  validates :description, :presence => true

end
