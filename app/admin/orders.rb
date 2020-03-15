ActiveAdmin.register Order do
  form title: 'Create an order' do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :customer_id, as: :select, collection: Customer.all.map{|c| [c.name, c.id]}
      f.input :order_address
      f.input :order_quantity
      f.input :order_status, as: :select, collection: (["Accept","Pending"])
    end
    f.actions
  end
  permit_params :customer_type, :delivery_date, :order_address, :order_quantity, :order_status
end
