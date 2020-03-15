class AddPhoneNoToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :phone_no, :string
  end
end
