class BillPayment < ActiveRecord::Base
  belongs_to :user
  belongs_to :bill
  attr_accessible :amount, :method
end
