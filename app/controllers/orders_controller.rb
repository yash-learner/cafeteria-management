class OrdersController < ApplicationController
  def index
    cart = current_user.cart
    @cart_items = CartItem.where("cart_id = ?", cart)
    render "index"
  end
end
