class RemoveFoodMenuCategoryIdFromFoodMenus < ActiveRecord::Migration[5.2]
  def change
    remove_column :food_menus, :food_menu_category_id, :integer
  end
end
