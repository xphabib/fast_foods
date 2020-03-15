ActiveAdmin.register FoodMenu do
  permit_params :name, :sales_price, :cost_price, :description, :image

  index do
    selectable_column
    id_column
    column :name
    column :sales_price
    column :cost_price
    column :description
    column :image
    column :food_menu_category_id
    actions
  end

  show do
    attributes_table do
      row :name
      row :sales_price
      row :cost_price
      row :country
      row :description
      # row :image do
      #   image_tag('equipe.image.url')
      # end
    end
  end

  form title: 'Food Menu Create' do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Details of food menu' do
      f.input :name
      f.input :sales_price
      f.input :cost_price
      f.input :description
      f.input :image, :as => :file
    end
    # f.has_many :discounts do |item|
    #   item.input :discount_amount
    #   item.input :discount_type, as: :select, collection: DiscountCategory.all.map{|c| ["#{c.name}", c.id]}
    # end
    para "Press cancel to return to the list without saving."
    actions
  end

end
