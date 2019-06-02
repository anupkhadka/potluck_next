require 'pry'
class SessionsController < ApplicationController

  def create
    normal_login = true;

    if auth_hash
      # OmniAuth Login
      user = User.find_or_create_by_omniauth(auth_hash)
      normal_login = false;
    else
      # Normal Login
      user = User.find_by(email: params[:email])
    end

    if !user
      # User doesn't exist.
      redirect_to root_path
    elsif normal_login && !user.authenticate(params[:password])
      # Normal login. User exists but password is incorrect.
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

  private

  def auth_hash
    request.env['omniauth.auth']
  end

end
