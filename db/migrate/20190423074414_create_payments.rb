class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :bank_name
      t.string :last_four_digit
      t.string :pay_type
      t.text :payment_description
      t.string :payment_title
      t.string :transaction_no
      t.integer :order_id

      t.timestamps
    end
  end
end
