# == Schema Information
#
# Table name: discount_categories
#
#  id         :bigint(8)        not null, primary key
#  amount     :float
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DiscountCategory < ApplicationRecord
  has_many :discounts
end
