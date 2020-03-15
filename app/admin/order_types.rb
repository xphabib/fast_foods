ActiveAdmin.register OrderType do
  permit_params do
    permitted = [:order_type_name]
    permitted
  end
end
