class MenuItemsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :ensure_owner_logged_in, only: [:new, :editMenu, :create, :update, :destroy, :updateEach]

  def index
    @menu_list = MenuCategory.all
    @menu_items = MenuItem
    render "index"
  end

  def new
    @menu_list = MenuCategory.get_name
  end

  def editMenu
    @menu_list = MenuCategory.get_name
    menu_category_id = params[:menu_category_id]
    @menu_items = MenuItem.get_item_names(menu_category_id)
    item_id = params[:id]
    @item_values = MenuItem.get_item_values(item_id)
    # if params[:id]
    #   render plain: "show"
    # end
  end

  def create
    if params[:item_image] == ""
      puts "ok pic"
      flash[:error] = "Please attach item image"
    else
      new_menu_item = MenuItem.new(
        params.permit(:menu_category_id, :name, :description, :price, :item_image)
      )
      if new_menu_item.save
        flash[:error] = "Menu Item #{new_menu_item.name} has been created in #{new_menu_item.menu_category.name}!"
        redirect_to "/"
      else
        flash[:error] = new_menu_item.errors.full_messages.join("<br/>")
        redirect_to "/menu_items/new"
      end
    end
  end


  def update
    menu_item_id = params[:id]
    menu_item_name = params[:name]
    menu_item_description = params[:description]
    menu_item_price = (params[:price].to_i) * 100
    item = MenuItem.find(menu_item_id)
    item.name = menu_item_name
    item.description = menu_item_description
    item.price = menu_item_price
    if item.save
      flash[:error] = "Menu Item has been updated!"
      redirect_to "/menu_categories"
    else
      flash[:error] = "Please! fill all the fields"
      redirect_to "/menu_items/#{item.id}/update_each"
    end
  end

  def destroy
    id = params[:id]
    menu_item = MenuItem.find(id)
    menu_item.destroy
    flash[:error] = "Menu Item #{menu_item.name} in #{menu_item.menu_category.name} is Deleted!"
    redirect_to "/menu_categories"
  end

  def updateEach
    item_id = params[:id]
    @item_values = MenuItem.get_item_values(item_id)
    render "/menu_items/update"
  end
end
