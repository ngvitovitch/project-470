class User < ActiveRecord::Base

	# Accessible Attributes
  attr_accessible :email, :first_name, :cellphone, :last_name, :password, :old_password, :password_confirmation, :dwelling_id

	# Relations
  has_one :owned_dwelling, :class_name => 'Dwelling', :foreign_key => 'owner_id'
  belongs_to :dwelling

  has_many :bill_payments, :foreign_key => 'owner_id'
  has_many :bills, :foreign_key => 'owner_id'
  has_many :events, :foreign_key => 'owner_id'
  has_many :chores, :foreign_key => 'owner_id'
  has_many :shopping_lists, :foreign_key => 'owner_id'
  has_many :comments, :foreign_key => 'owner_id'

	# message has the subtypes post and notification
	# there might be a way to imply those relations, but I don't know how
  has_many :messages, :foreign_key => 'owner_id'
  has_many :posts, :foreign_key => 'owner_id'
  has_many :notifications, :foreign_key => 'owner_id'

	# Validations
  validates :email, :presence => true
  validates :email, :uniqueness => true

	# phone numbers can only have numbers and hiphens
	# This is the format amazon SNS wants
	validates :cellphone,
	 	:format => {:with => /^\d-\d{3}-\d{3}-\d{4}$/, :message => 'must match the format X-XXX-XXX-XXXX' },
		:allow_nil => true

	# Users have a password, it is checked for blank?, and confrimation
  has_secure_password

	# Callbacks
	before_save :update_subscriptions

	# return the first and last name, of the email if neither exists
  def name
		if first_name && last_name
			return "#{first_name} #{last_name}"
		else
			return email
		end
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
			if cellphone
				dwelling.topic.subscribe(cellphone)
			end
		end

		if email_changed? && dwelling_id
			dwelling.topic.subscribe(email)
		end

		if cellphone_changed? && dwelling_id
			dwelling.topic.subscribe(cellphone)
		end
	end

end
