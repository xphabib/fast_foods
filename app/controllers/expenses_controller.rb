class ExpensesController < ApplicationController

  def index
    @expenses = current_employee.expenses
  end

  def show
    @expense = current_employee.expenses.find(params[:id])
  end

  def new
    @expense = current_employee.expenses.new
  end

  def create
    expense = current_employee.expenses.build(expense_params)
    expense.date = Date.today
    expense.save
    redirect_to expenses_path
  end

  def edit
    @expense = current_employee.expenses.find(params[:id])
  end

  def update
    expense = current_employee.expenses.find(params[:id])
    expense.update(expense_params)
    redirect_to expenses_path
  end

  def delete
    expense = current_employee.expenses.find(params[:id])
    expense.destroy
    redirect_to expenses_path
  end

  private
  def expense_params
    params.require(:expense).permit(:title, :amount, :expense_category_id)
  end

end
