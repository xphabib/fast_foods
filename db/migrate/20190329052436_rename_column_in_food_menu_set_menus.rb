class RenameColumnInFoodMenuSetMenus < ActiveRecord::Migration[5.2]
  def change
    rename_column :food_menu_set_menus, :food_menus_id, :food_menu_id
    rename_column :food_menu_set_menus, :set_menus_id, :set_menu_id
  end
end
