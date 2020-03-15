class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.integer :product_id
      t.string :discount_type
      t.float :discount_amount

      t.timestamps
    end
  end
end
