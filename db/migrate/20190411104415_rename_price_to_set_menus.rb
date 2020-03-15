class RenamePriceToSetMenus < ActiveRecord::Migration[5.2]
  def change
    rename_column :set_menus, :price, :cost_price
  end
end
