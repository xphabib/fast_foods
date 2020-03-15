# == Schema Information
#
# Table name: orders
#
#  id             :bigint(8)        not null, primary key
#  customer_name  :string
#  date           :date
#  order_address  :text
#  order_quantity :integer
#  order_status   :string
#  order_table_no :string
#  order_type     :string
#  orderable_type :string
#  paid_amount    :float
#  token_no       :string
#  total_amount   :float
#  total_discount :float
#  total_due      :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  customer_id    :integer
#  employee_id    :integer
#  order_type_id  :integer
#  orderable_id   :integer
#  payment_id     :integer
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
