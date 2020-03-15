# == Schema Information
#
# Table name: payments
#
#  id                  :bigint(8)        not null, primary key
#  bank_name           :string
#  last_four_digit     :string
#  pay_type            :string
#  payment_description :text
#  payment_title       :string
#  transaction_no      :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  order_id            :integer
#

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
