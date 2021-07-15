class AdminsController < ApplicationController
  before_action :ensure_user_logged_in

  def index
    render "index"
  end

  def all_orders
    @orders = Order.all.order(:id)
  end
end
