class ShoppingList < ActiveRecord::Base
  belongs_to :dwelling
  belongs_to :user
  has_many :shopping_list_items
  validates :name, :presence => true
  attr_accessible :dwelling_id, :name
end
