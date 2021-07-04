class RemovePriceFromMenuItems < ActiveRecord::Migration[6.1]
  def change
    change_table(:menu_items) do |t|
      t.remove :price
    end
  end
end
