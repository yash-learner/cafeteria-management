class MenuCategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :ensure_user_logged_in
  before_action :ensure_owner_logged_in, only: [:new, :update, :create, :toggleMenuStatus, :allMenu, :edit]

  def index
    @category = MenuCategory.get_menu_names
    cart = current_user.cart
    # @cart = current_user.cart.total_price
    @count = cart.cart_items.count
    @cart_items = CartItem.where("cart_id = ?", cart)
    @check = CartItem.where("cart_id = ?", cart)
    # @cart_items = cart.cart_items.pluck(:menu_item_name, :quantity, :price)
    render "index"
  end

  def new
  end

  def show
  end

  def create
    category_name = params[:category_name]
    new_category = MenuCategory.new(
      name: category_name,
      active: params[:active],
    )
    if new_category.save
      flash[:error] = "Menu Category #{new_category.name} has been created!"
      redirect_to menu_categories_path
    else
      flash[:error] = new_category.errors.full_messages.join("<br/>")
      redirect_to "/menu_categories/new"
    end
  end

  def update
    id = params[:id]
    category_name = params[:category_name]
    category = MenuCategory.find(id)
    category.name = category_name
    category.active = params[:active]
    if category.save
      flash[:error] = "Menu Category name has been updated!"
      redirect_to "/menu_categories"
    else
      flash[:error] = category.errors.full_messages.join("<br/>")
      redirect_to "/menu_categories/#{category.id}/edit"
    end
  end

  def toggleMenuStatus
    menu_id = params[:id]
    menu = MenuCategory.find(menu_id)
    if menu.active
      active = false
    else
      active = true
    end
    menu.active = active
    if menu.save
      redirect_to "/menu_categories"
    else
      flash[:error] = "#{menu.active}"
      redirect_to "/menu_categories/change_menu_category_status"
    end
  end

  def allMenu
    @category = MenuCategory
    render "disable_menu"
  end

  def edit
    menu_category_id = params[:id]
    @menu_category = MenuCategory.find(menu_category_id)
    render "edit", locals: { menu_category: @menu_category }
  end

  def destroy
    id = params[:id]
    menu_item = MenuCategory.find(id)
    menu_item.destroy
    flash[:error] = "Menu Item Category is Deleted!"
    redirect_to "/menu_categories"
  end
end
