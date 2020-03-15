# == Schema Information
#
# Table name: customers
#
#  id         :bigint(8)        not null, primary key
#  address    :text
#  email      :string
#  name       :string
#  phone_no   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ApplicationRecord
  validates :name, presence: true
  has_many :orders
end
