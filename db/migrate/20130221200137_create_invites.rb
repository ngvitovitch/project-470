class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.references :dwelling
      t.references :invitee
      t.string :invitee_email

      t.timestamps
    end
    add_index :invites, :dwelling_id
    add_index :invites, :invitee_id
  end
end
