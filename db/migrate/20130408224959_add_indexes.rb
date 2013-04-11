class AddIndexes < ActiveRecord::Migration
	def change
		add_index :invites, :token

		add_index :users, :dwelling_id
		add_index :users, :email

		add_index :events, :date

		add_index :bills, :date_due
		add_index :bills, :dwelling_id

		add_index :dwellings, :owner_id
	end
end
