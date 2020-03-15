ActiveAdmin.register Expense do
permit_params :employee_id, :expense_category_id, :title, :amount, :date
end
