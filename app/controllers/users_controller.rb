class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :ensure_user_logged_in, only: [:new, :create]
  before_action :ensure_owner_logged_in, only: [:index, :removeAsClerk, :makeAsClerk, :createClerk, :newClerk]

  def index
    @users = User
    render "index"
  end

  def new
    render "users/new"
  end

  def create
    user_role = "customer"
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_no: params[:phone_no],
      password: params[:password],
      role: user_role,
    )

    if user.save
      session[:current_user_id] = user.id
      repost("/carts")
    else
      flash[:error] = user.errors.full_messages.join("<br/>")
      redirect_to "/users/new"
    end
  end

  def removeAsClerk
    id = params[:id]
    user = User.find(id)
    user.role = "customer"
    if user.save(:validate => false)
      flash[:error] = "Role Changed"
      redirect_to "/users"
    else
      flash[:error] = "Role not Changed"
      redirect_to "/users"
    end
  end

  def makeAsClerk
    id = params[:id]
    user = User.find(id)
    user.role = "clerk"
    if user.save(:validate => false)
      flash[:error] = "Role Changed"
      redirect_to "/users"
    else
      flash[:error] = "Role not Changed"
      redirect_to "/users"
    end
  end

  def newClerk
    render "/users/new_clerk"
  end

  def createClerk
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_no: params[:phone_no],
      password: params[:password],
      role: params[:user_role],
    )

    if user.save
      flash[:error] = "#{params[:user_role]} account with name #{params[:first_name] + " " + params[:last_name]} is created! "
      cart = Cart.new(
        date: Date.today,
        user_id: user.id,
      )
      if cart.save
        flash[:error] = "cart with id #{cart.id} is created"
        redirect_to "/menu_categories" and return
      end
    end
  end
end
