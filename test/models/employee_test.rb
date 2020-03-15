# == Schema Information
#
# Table name: employees
#
#  id                     :bigint(8)        not null, primary key
#  address                :text
#  designation            :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  job_start_date         :date
#  mobile                 :string
#  name                   :string
#  picture                :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  salary                 :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_employees_on_email                 (email) UNIQUE
#  index_employees_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
