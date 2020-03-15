class AddFoodMenuCategoryIdToFoodMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :food_menus, :food_menu_category_id, :integer
  end
end
