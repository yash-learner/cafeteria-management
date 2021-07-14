class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :ensure_user_logged_in

  def index
    cart = current_user.cart
    @cart_items = CartItem.where("cart_id = ?", cart)
    render "index"
  end

  def create
    order = Order.new(
      date: Date.today,
      user_id: current_user.id,
      delivered_at: nil,
    )
    if order.save
      # session[:current_order_id] = order.id

      redirect_to "/order_items/#{order.id}/order"
    end
  end
end
