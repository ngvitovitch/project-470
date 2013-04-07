class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :name
      t.text :description
      t.number :assigned_user_id
      t.number :dwelling_id

      t.timestamps
    end
  end
end
