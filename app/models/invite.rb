class Invite < ActiveRecord::Base
  belongs_to :dwelling

  validates_presence_of :dwelling, :email
  validates_uniqueness_of :email

  before_create :generate_token

  attr_accessible :email, :token, :dwelling_id

  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
end
