class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.float :cost_price
      t.float :discount
      t.float :vat
      t.string :sales_price
      t.string :float
      t.float :total
      t.string :orderable_type
      t.integer :orderable_id
      t.integer :order_id

      t.timestamps
    end
  end
end
