class RenameCustomerTypeToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :customer_type, :customer_name
  end
end
