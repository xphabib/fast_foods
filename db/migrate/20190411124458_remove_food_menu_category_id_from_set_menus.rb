class RemoveFoodMenuCategoryIdFromSetMenus < ActiveRecord::Migration[5.2]
  def change
    remove_column :set_menus, :food_menu_category_id, :integer
  end
end
