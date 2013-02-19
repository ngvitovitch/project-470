class AddOwnerIdToDwelling < ActiveRecord::Migration
  def change
    change_table :dwellings do |t|
      t.integer :owner_id
    end
  end
end
