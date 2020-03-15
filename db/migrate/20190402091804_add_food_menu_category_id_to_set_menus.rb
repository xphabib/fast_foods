class AddFoodMenuCategoryIdToSetMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :set_menus, :food_menu_category_id, :integer
  end
end
