class AddDiscountCategoriesIdToDiscounts < ActiveRecord::Migration[5.2]
  def change
    add_column :discounts, :discount_categories_id, :integer
  end
end
