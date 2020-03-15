# == Schema Information
#
# Table name: expenses
#
#  id                  :bigint(8)        not null, primary key
#  amount              :float
#  date                :date
#  title               :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  employee_id         :integer
#  expense_category_id :integer
#

class Expense < ApplicationRecord
  belongs_to :employee
  belongs_to :expense_category
end
