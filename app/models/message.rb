class Message < DwellingItem
	# Accessible Attributes
  attr_accessible :body

	# Validations
  validates :body, :presence => true

	# Scopes
	scope :newest, order('created_at DESC')

end
