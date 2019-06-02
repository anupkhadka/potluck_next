require 'pry'
class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if !user
      # User doesn't exist.
      redirect_to root_path
    elsif !user.authenticate(params[:password])
      # User exists but password is incorrect.
      redirect_to root_path
    else
      session[:user_id] = user.id
      # User creation successful.
      redirect_to potlucks_path
    end
  end

  def destroy
    if session[:user_id]
      session.delete :user_id
    end
    redirect_to root_path
  end

end
