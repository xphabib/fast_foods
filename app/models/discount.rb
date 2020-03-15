# == Schema Information
#
# Table name: discounts
#
#  id                   :bigint(8)        not null, primary key
#  discount_amount      :float
#  discount_type        :string
#  discountable_type    :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  discount_category_id :integer
#  discountable_id      :integer
#  product_id           :integer
#

class Discount < ApplicationRecord
  # belongs_to :product
  belongs_to :discount_category
  belongs_to :discountable, polymorphic: true

  DISCOUNT_TYPE = [
      'Flat', 'Percentage'
  ]

end
