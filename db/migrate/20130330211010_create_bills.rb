class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :name
      t.string :owed_to
      t.float :amount
      t.date :date_due
      t.string :status
      t.integer :dwelling_id

      t.timestamps
    end
  end
end
