class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.integer :employee_id
      t.string :title
      t.float :amount

      t.timestamps
    end
  end
end
