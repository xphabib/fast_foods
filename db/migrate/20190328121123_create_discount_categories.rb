class CreateDiscountCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :discount_categories do |t|
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
