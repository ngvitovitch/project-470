class ShoppingListItem < ActiveRecord::Base
  belongs_to :shopping_list
  attr_accessible :name, :obligate_id, :obligates, :quantity, :shopping_list_id, :status

  validates :name, :presence => true
end
