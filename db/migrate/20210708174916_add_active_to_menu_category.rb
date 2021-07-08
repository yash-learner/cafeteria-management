class AddActiveToMenuCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :menu_categories, :active, :boolean
  end
end
