# == Schema Information
#
# Table name: set_menus
#
#  id          :bigint(8)        not null, primary key
#  cost_price  :integer
#  image       :string
#  name        :string
#  sales_price :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SetMenu < ApplicationRecord
  has_many :food_menu_set_menus
  has_many :food_menus, through: :food_menu_set_menus, dependent: :destroy
  has_many :order_items, as: :orderable, dependent: :destroy
  has_one :discount, as: :discountable, dependent: :destroy

  accepts_nested_attributes_for :food_menus
  mount_uploader :image, AvatarUploader

  validates :name, :cost_price, :sales_price, presence: true

end

