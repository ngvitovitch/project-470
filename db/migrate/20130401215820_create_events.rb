class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :dwelling
      t.references :user
      t.string :title
      t.text :description
      t.datetime :date

      t.timestamps
    end
    add_index :events, :dwelling_id
    add_index :events, :user_id
  end
end
