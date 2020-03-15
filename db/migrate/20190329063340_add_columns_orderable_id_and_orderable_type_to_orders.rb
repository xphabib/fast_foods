class AddColumnsOrderableIdAndOrderableTypeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :orderable_id, :integer
    add_column :orders, :orderable_type, :string
  end
end
