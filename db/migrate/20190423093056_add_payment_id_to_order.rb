class AddPaymentIdToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :payment_id, :integer
  end
end
