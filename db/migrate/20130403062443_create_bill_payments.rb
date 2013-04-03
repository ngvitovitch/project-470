class CreateBillPayments < ActiveRecord::Migration
  def change
    create_table :bill_payments do |t|
      t.references :user
      t.references :bill
      t.float :amount
      t.string :method

      t.timestamps
    end
    add_index :bill_payments, :user_id
    add_index :bill_payments, :bill_id
  end
end
