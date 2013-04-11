class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :name
      t.text :description
      t.integer :assigned_user_id
      t.integer :dwelling_id

      t.timestamps
    end
  end
end
