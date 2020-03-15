class RemoveColumFromOrderItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_items, :float, :string
  end
end
