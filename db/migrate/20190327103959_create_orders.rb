class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :payment_type_id
      t.integer :employee_id
      t.integer :order_quantity
      t.date :delivery_date
      t.string :order_status
      t.string :order_table_no
      t.string :token_no
      t.text :order_address
      t.string :customer_type

      t.timestamps
    end
  end
end
