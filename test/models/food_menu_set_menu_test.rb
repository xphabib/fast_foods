# == Schema Information
#
# Table name: food_menu_set_menus
#
#  id           :bigint(8)        not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  food_menu_id :integer
#  set_menu_id  :integer
#

require 'test_helper'

class FoodMenuSetMenuTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
