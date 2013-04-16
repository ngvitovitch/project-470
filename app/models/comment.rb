class Comment < DwellingItem
	# Accessible Attributes
  attr_accessible :body

	# Relations
	belongs_to :dwelling_item, :polymorphic => true

	# Validations
	validates :body, :presence => true
end
