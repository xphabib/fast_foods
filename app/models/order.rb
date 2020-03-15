# == Schema Information
#
# Table name: orders
#
#  id             :bigint(8)        not null, primary key
#  customer_name  :string
#  date           :date
#  order_address  :text
#  order_quantity :integer
#  order_status   :string
#  order_table_no :string
#  order_type     :string
#  orderable_type :string
#  paid_amount    :float
#  token_no       :string
#  total_amount   :float
#  total_discount :float
#  total_due      :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  customer_id    :integer
#  employee_id    :integer
#  order_type_id  :integer
#  orderable_id   :integer
#  payment_id     :integer
#

class Order < ApplicationRecord
  validates :order_type, :paid_amount, presence: true

  has_many :order_items
  belongs_to :payment
  belongs_to :employee
  belongs_to :customer, optional: true
  accepts_nested_attributes_for :order_items

  ORDER_TYPE = [
      'Eaten', 'Parcel', 'Home Delivery'
  ]

  ORDER_STATUS = [
      'Pending', 'On the way', 'Complete'
  ]

end
