class CreateFoodMenuSetMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :food_menu_set_menus do |t|
      t.integer :food_menus_id
      t.integer :set_menus_id

      t.timestamps
    end
  end
end
