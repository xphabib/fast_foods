class AddImageColumnToSetMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :set_menus, :image, :string
  end
end
