class RenameColumnInDiscounts < ActiveRecord::Migration[5.2]
  def change
    rename_column :discounts, :discount_categories_id, :discount_category_id
  end
end
