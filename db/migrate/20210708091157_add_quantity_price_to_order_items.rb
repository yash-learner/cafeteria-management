class AddQuantityPriceToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :quantity, :bigint
    add_column :order_items, :price, :bigint
  end
end
