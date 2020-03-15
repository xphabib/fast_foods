# == Schema Information
#
# Table name: order_types
#
#  id              :bigint(8)        not null, primary key
#  order_type_name :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class OrderTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
