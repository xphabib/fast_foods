class AddDiscountTypeToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :discount_type, :string
  end
end
