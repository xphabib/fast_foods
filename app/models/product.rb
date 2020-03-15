# == Schema Information
#
# Table name: products
#
#  id             :bigint(8)        not null, primary key
#  cost_price     :float
#  description    :text
#  name           :string
#  sales_price    :float
#  stock_quantity :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Product < ApplicationRecord
  has_one :discount
end
