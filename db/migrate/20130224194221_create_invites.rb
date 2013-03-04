class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :token
      t.string :email
      t.references :dwelling

      t.timestamps
    end
    add_index :invites, :dwelling_id
  end
end
