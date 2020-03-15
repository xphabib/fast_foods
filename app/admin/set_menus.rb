ActiveAdmin.register SetMenu do

  form partial: 'select_food'

  # form title: 'Set Menus Create' do |f|
  #   f.semantic_errors *f.object.errors.keys
  #   f.inputs do
  #     f.input :name
  #     f.input :cost_price
  #     f.input :sales_price
  #     f.input :image, :as => :file
  #     f.input :food_menus, as: :check_boxes, collection: FoodMenu.all.map{ |food|  [food.name, food.id] }
  #   end
  #   f.actions
  # end
  #
  permit_params :name, :image, :price, :sales_price, :cost_price, food_menu_ids: []

end
