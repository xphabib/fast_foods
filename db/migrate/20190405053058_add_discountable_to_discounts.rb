class AddDiscountableToDiscounts < ActiveRecord::Migration[5.2]
  def change
    add_column :discounts, :discountable_id, :integer
    add_column :discounts, :discountable_type, :string
  end
end
