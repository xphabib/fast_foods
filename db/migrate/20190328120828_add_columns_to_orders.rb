class AddColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_type_id, :integer
  end
end
