class Invite < ActiveRecord::Base
  attr_accessible :invitee_email, :dwelling_id, :invitee_id
  belongs_to :dwelling
  belongs_to :invitee, :class_name => 'User', :foreign_key => 'invitee_id'
end
