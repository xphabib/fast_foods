# == Schema Information
#
# Table name: customers
#
#  id         :bigint(8)        not null, primary key
#  address    :text
#  email      :string
#  name       :string
#  phone_no   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
