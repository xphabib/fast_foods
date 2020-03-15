ActiveAdmin.register Employee do

  permit_params :name, :designation, :email, :password, :address, :mobile, :picture, :job_start_date, :salary

  index do
    selectable_column
    id_column
    column :name
    column :designation
    column :email
    column :password
    column :address
    column :mobile
    column :picture
    column :job_start_date
    column :salary
    actions
  end

  form title: 'Employee Create' do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Details' do
      input :name
      input :designation
      input :email
      input :password
      input :address
      input :mobile
      input :picture, :as => :file
      input :job_start_date
      input :salary
    end
    para "Press cancel to return to the list without saving."
    actions
  end

end
