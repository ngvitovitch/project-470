class CreateShoppingLists < ActiveRecord::Migration
  def change
    create_table :shopping_lists do |t|
      t.string :title
      t.integer :dwelling_id

      t.timestamps
    end
  end
end
