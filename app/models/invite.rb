class Invite < ActiveRecord::Base
  belongs_to :dwelling

  validates_presence_of :dwelling, :email
  validates_uniqueness_of :email, :scope => :dwelling_id,
    :message => 'An invite has already been seent to this email'

  before_create :generate_token, :send_email

  attr_accessible :email, :token, :dwelling_id

  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end

  def send_email
    InviteMailer.invite_email(self)
  end
end
