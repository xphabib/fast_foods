# == Schema Information
#
# Table name: food_menus
#
#  id          :bigint(8)        not null, primary key
#  cost_price  :integer
#  description :text
#  image       :string
#  name        :string
#  sales_price :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class FoodMenuTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
