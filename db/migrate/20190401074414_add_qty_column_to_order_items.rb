class AddQtyColumnToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :qty, :integer
  end
end
