class CreateFoodMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :food_menus do |t|
      t.string :name
      t.integer :cost_price
      t.integer :sales_price
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
