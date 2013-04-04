class ShoppingList < ActiveRecord::Base
  belongs_to :dwelling
  belongs_to :user
  has_many :shopping_list_items

  attr_accessible :dwelling_id, :title
end
