class DwellingItem < ActiveRecord::Base
	# This class defines a protocol, and cannot be instantiated.
	self.abstract_class = true

	# Relations
  belongs_to :dwelling
  belongs_to :owner, :class_name => 'User'

	# Validations
  validates :dwelling, :presence => true
  validates :owner, :presence => true
end
