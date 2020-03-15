class AddTotalDiscountToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :total_discount, :float
  end
end
