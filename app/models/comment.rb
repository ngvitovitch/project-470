class Comment < DwellingItem
	# Accessible Attributes
  attr_accessible :body

	# Relations
	belongs_to :dwelling_item, :polymorphic => true

	# Validations
	validates :body, :presence => true

	# Callbacks
	skip_callback :create, :after, :notify

	# Scopes
	scope :newest, order('created_at DESC')
end
