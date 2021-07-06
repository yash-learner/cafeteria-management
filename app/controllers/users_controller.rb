class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    user_role = "user"
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_no: params[:phone_no],
      password: params[:password],
      role: user_role,
    )

    if user.save
      render plain: "Account with email #{user.email} is created!"
    end
  end
end
