# == Schema Information
#
# Table name: payments
#
#  id                  :bigint(8)        not null, primary key
#  bank_name           :string
#  last_four_digit     :string
#  pay_type            :string
#  payment_description :text
#  payment_title       :string
#  transaction_no      :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  order_id            :integer
#

class Payment < ApplicationRecord
  has_one :order

  attr_accessor :employee, :order_type, :paid_amount, :cart_id, :total_discount, :customer_id, :order_table_no, :order_address

  after_create :order_complete

  def order_complete
    order = Order.new(date: Date.today, payment_id: self.id, employee_id: self.employee.id, order_type: self.order_type, order_table_no: self.order_table_no, paid_amount: self.paid_amount, order_address: self.order_address)
    cart = Cart.find(self.cart_id)
    order.total_amount = cart.order_items.sum(:total)
    order.total_discount = self.total_discount
    order.customer_id = self.customer_id
    if order.total_discount.present?
      order.total_due = order.total_amount - order.total_discount - order.paid_amount
    else
      order.total_due = order.total_amount - order.paid_amount
    end
    if order.save!
      cart.order_items.each do |item|
        item.order_id = order.id
        item.cart_id = nil
        item.save
      end
    end
  end
end
