class Message < ActiveRecord::Base
	scope :newest, order('date DESC')

  attr_accessible :body, :date
  belongs_to :dwelling
  belongs_to :user

  validates :user, :presence => true
  validates :dwelling, :presence => true

  validates :body, :presence => true
  validates :date, :presence => true

end
