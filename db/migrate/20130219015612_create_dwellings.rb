class CreateDwellings < ActiveRecord::Migration
  def change
    create_table :dwellings do |t|
      t.string :name

      t.timestamps
    end

    change_table  :users do |t|
      t.references :dwelling
    end
  end
end
