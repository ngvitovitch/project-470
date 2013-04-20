class User < ActiveRecord::Base
	# Accessible Attributes
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :dwelling_id

	# Relations
  has_one :owned_dwelling, :class_name => 'Dwelling', :foreign_key => 'owner_id'
  belongs_to :dwelling

  has_many :bill_payments, :foreign_key => 'owner_id'
  has_many :bills, :foreign_key => 'owner_id'
  has_many :events, :foreign_key => 'owner_id'
  has_many :chores, :foreign_key => 'owner_id'
  has_many :shopping_lists, :foreign_key => 'owner_id'
  has_many :comments, :foreign_key => 'owner_id'

	# message has the subtype post and notification
	# there might be a way to simplify these lines
  has_many :messages, :foreign_key => 'owner_id'
  has_many :posts, :foreign_key => 'owner_id'
  has_many :notifications, :foreign_key => 'owner_id'

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true

  validates :email, :uniqueness => true
  has_secure_password

	# Callbacks
	before_save :update_subscriptions

  def name
    return "#{first_name} #{last_name}"
  end

	private

	# Subscripe user to dwellings topic when they join the dwelling
	#
	# This doesn't delete old subscriptions because at this time users can't
	# switch dwellings.
	def update_subscriptions
		if dwelling_id_changed?

			# Create new subscription
			dwelling.topic.subscribe(email)
		end
	end

end
