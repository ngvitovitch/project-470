class AddTimeZoneToDwelling < ActiveRecord::Migration
  def change
    add_column :dwellings, :time_zone, :string, :default => 'UTC'
  end
end
