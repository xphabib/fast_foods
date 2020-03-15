class AddTotalAmountPaidAmountTotalDueToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :total_amount, :float
    add_column :orders, :paid_amount, :float
    add_column :orders, :total_due, :float
  end
end
