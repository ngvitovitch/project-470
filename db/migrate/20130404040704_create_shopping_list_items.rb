class CreateShoppingListItems < ActiveRecord::Migration
  def change
    create_table :shopping_list_items do |t|
      t.string :name
      t.integer :quantity
      t.integer :obligate_id
      t.integer :obligates
      t.boolean :status
      t.integer :shopping_list_id

      t.timestamps
    end
  end
end
