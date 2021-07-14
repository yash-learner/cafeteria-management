class AdminController < ApplicationController
  before_action :ensure_owner_logged_in

  def index
    render "index"
  end
end
