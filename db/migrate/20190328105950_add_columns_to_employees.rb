class AddColumnsToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :address, :text
    add_column :employees, :mobile, :string
    add_column :employees, :picture, :string
    add_column :employees, :job_start_date, :date
    add_column :employees, :salary, :integer
  end
end
