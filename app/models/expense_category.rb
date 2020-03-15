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

class ExpenseCategory < ApplicationRecord
  has_many :expenses
end
