class DwellingItem < ActiveRecord::Base
	# This class defines a protocol, and cannot be instantiated.
	self.abstract_class = true

	# Relations
  belongs_to :dwelling
  belongs_to :owner, :class_name => 'User'

	# Validations
  validates :dwelling, :presence => true
  validates :owner, :presence => true

	# Filter
	after_create :notify

	def notify
		message = self.dwelling.notifications.build(
			body: "#{self.owner.name} created a new #{self.class}"
		)
		message.owner = self.owner
		message.save
	end
end
