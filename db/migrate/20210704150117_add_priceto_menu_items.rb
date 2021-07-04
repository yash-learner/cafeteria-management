class AddPricetoMenuItems < ActiveRecord::Migration[6.1]
  def change
    add_column :menu_items, :price, :bigint
  end
end
