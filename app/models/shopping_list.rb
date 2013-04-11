class ShoppingList < ActiveRecord::Base
  belongs_to :dwelling
  belongs_to :user
  has_many :shopping_list_items
  validates :title, :presence => true
  attr_accessible :dwelling_id, :title
end
