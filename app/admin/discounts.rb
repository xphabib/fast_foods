ActiveAdmin.register Discount do

  form partial: 'form'

  # form title: 'Create a Discount' do |f|
  #   f.inputs do
  #     f.input :select_menu, as: :select, collection: (["Food Menu","Set Menu"])
  #     f.input :discount_amount
  #     f.input :discount_type, as: :select, collection: DiscountCategory.all.map{|c| ["#{c.name}", c.id]}
  #   end
  #   f.actions
  # end
  permit_params :discountable_type, :discountable_id, :discount_amount, :discount_type, :discount_category_id
end
