# == Schema Information
#
# Table name: expense_categories
#
#  id          :bigint(8)        not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ExpenseCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
