class RemoveMenuItemPriceFromOrderItems < ActiveRecord::Migration[6.1]
  def change
    change_table(:order_items) do |t|
      t.remove :menu_item_price
    end
  end
end
