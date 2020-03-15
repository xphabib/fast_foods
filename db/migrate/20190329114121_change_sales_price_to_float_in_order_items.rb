class ChangeSalesPriceToFloatInOrderItems < ActiveRecord::Migration[5.2]
  def change
    # change_column :order_items, :sales_price, :float
    remove_column :order_items, :sales_price, :integer
    add_column :order_items, :sales_price, :float
  end
end
