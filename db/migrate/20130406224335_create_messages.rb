class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.date :date
      t.references :dwelling
      t.references :user
      t.timestamps
    end
  end
end
