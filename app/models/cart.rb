# == Schema Information
#
# Table name: carts
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  has_many :order_items, dependent: :destroy
end
