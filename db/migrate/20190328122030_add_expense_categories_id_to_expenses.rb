class AddExpenseCategoriesIdToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :expense_categories_id, :integer
  end
end
