# == Schema Information
#
# Table name: set_menus
#
#  id          :bigint(8)        not null, primary key
#  cost_price  :integer
#  image       :string
#  name        :string
#  sales_price :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SetMenuTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
