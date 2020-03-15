# == Schema Information
#
# Table name: food_menus
#
#  id          :bigint(8)        not null, primary key
#  cost_price  :integer
#  description :text
#  image       :string
#  name        :string
#  sales_price :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class FoodMenu < ApplicationRecord
  has_many :food_menu_set_menus
  has_many :set_menus, through: :food_menu_set_menus
  has_many :order_items, as: :orderable, dependent: :destroy
  has_one :discount, as: :discountable, dependent: :destroy
  mount_uploader :image, AvatarUploader

  validates :name, :cost_price, :sales_price, presence: true
end
