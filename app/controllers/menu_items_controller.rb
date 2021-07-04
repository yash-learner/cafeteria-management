class MenuItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    menu_category_id = params[:menu_category_id]
    menu_item_name = params[:name]
    menu_item_description = params[:description]
    menu_item_price = params[:price]
    new_menu_item = MenuItem.new(
      menu_category_id: menu_category_id,
      name: menu_item_name,
      description: menu_item_description,
      price: menu_item_price
    )
    if new_menu_item.save
      render plain:"New item is added to this menu category!"
    end
   end

   def update
   end
end
