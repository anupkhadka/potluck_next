class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to potlucks_path
    else
      flash[:error] = "Error creating account."
      redirect_to new_user_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
