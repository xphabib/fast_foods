class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.float :cost_price
      t.float :sales_price
      t.integer :stock_quantity
      t.text :description

      t.timestamps
    end
  end
end
