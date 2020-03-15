class ChangeColumnNameExpense < ActiveRecord::Migration[5.2]
  def change
    rename_column :expenses, :expense_categories_id, :expense_category_id
  end
end
