class RemovePaymentTypeIdFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :payment_type_id, :integer
  end
end
