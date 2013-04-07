class Message < ActiveRecord::Base
  attr_accessible :body, :date
  belongs_to :dwelling
  belongs_to :user
end
