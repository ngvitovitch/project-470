class Bill < ActiveRecord::Base
  attr_accessible :amount, :date_due, :name, :owed_to, :status, :dwelling_id

  belongs_to :dwelling

  validates :amount, :numericality => {:greater_than_or_equal_to => 0}
  validates :date_due, :presence => true
  validates :name, :length => {:minimum => 1, :maximum => 20}
  validates :owed_to, :length => {:minimum => 1, :maximum => 20}

  after_initialize :init

  def init
    self.status ||= :unpaid
  end
end
