class CartsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :ensure_user_logged_in

  def create
    user_id = current_user_id
    total_price = Cart.where("user_id = ?", user_id).pluck(:total_price)
    total_price = total_price[0].to_i
    # total_price = params[:total_price]
    cart_id = current_user.carts.find(current_user_id)
    cart_items = CartItem.where("cart_id = ?", cart_id.id)
    if !cart_id
      cart = Cart.new(
        date: Date.today,
        user_id: user_id,
        total_price: total_price,
      )
    end
    if cart.save
      render plain: "Cart is empty"
    else
      render plain: "Not saved"
    end
  end
end
