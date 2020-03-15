class AddSalesPriceColumnToSetMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :set_menus, :sales_price, :float
  end
end
