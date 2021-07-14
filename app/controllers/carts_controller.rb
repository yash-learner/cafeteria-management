class CartsController < ApplicationController

  # def index
  #   redirect_to action: create
  # end

  def create
    user_id = current_user.id
    # total_price = Cart.where("user_id = ?", user_id).pluck(:total_price)
    # total_price = total_price[0].to_i
    # # total_price = params[:total_price]
    # cart_id = current_user.carts.find(current_user_id)
    # cart_items = CartItem.where("cart_id = ?", cart_id.id)
    cart = Cart.new(
      date: Date.today,
      user_id: user_id,
      # total_price: total_price,
    )
    # cart.save
    if cart.save
      redirect_to "/menu_categories" and return
    end
  end
end
