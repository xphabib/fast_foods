# == Schema Information
#
# Table name: order_items
#
#  id             :bigint(8)        not null, primary key
#  cost_price     :float
#  discount       :float
#  discount_type  :string
#  orderable_type :string
#  qty            :integer
#  sales_price    :float
#  total          :float
#  vat            :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  cart_id        :integer
#  order_id       :integer
#  orderable_id   :integer
#

require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
