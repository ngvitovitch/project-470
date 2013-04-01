class Dwelling < ActiveRecord::Base
  attr_accessible :name, :owner, :time_zone
  belongs_to :owner, :class_name => 'User'
  has_many :users
  has_many :invites
  has_many :bills

  validates_presence_of :name, :owner

  after_save :ensure_owner_has_this_dwelling

  def ensure_owner_has_this_dwelling
    self.owner.dwelling = self
    self.owner.save
  end
end
