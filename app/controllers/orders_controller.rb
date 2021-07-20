class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :ensure_user_logged_in

  def index
    cart = current_user.cart
    @cart_items = CartItem.where("cart_id = ?", cart)
    render "index"
  end

  def create
    if current_user.role != "customer"
      delivered_at = DateTime.now
    else
      delivered_at = nil
    end
    order = Order.new(
      date: Date.today,
      user_id: current_user.id,
      delivered_at: delivered_at,
    )
    if current_user.cart.cart_items.sum(:price) > 0
      # session[:current_order_id] = order.id
      order.save
      redirect_to "/order_items/#{order.id}/order"
    else
      flash[:error] = "Your cart is empty please add items to place an order!"
      redirect_to "/menu_categories"
    end
  end

  def update
    id = params[:id]
    order = Order.find(id)
    order.delivered_at = DateTime.now
    order.save
    flash[:error] = "order has been updated"
    redirect_to "/order_items"
  end
end
