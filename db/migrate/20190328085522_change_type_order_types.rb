class ChangeTypeOrderTypes < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_types, :type, :order_type_name
  end
end
