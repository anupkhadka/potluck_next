require 'pry'
class SessionsController < ApplicationController

  def create
    if auth_hash
      # OmniAuth Login
      user = User.find_or_create_by_omniauth(auth_hash)
    else
      # Normal Login
      user = User.find_by(email: params[:email])
      if !user
        # User doesn't exist.
        redirect_to root_path
      elsif !user.authenticate(params[:password])
        # User exists but password is incorrect.
        redirect_to root_path
      end
    end

    session[:user_id] = user.id
    # User creation successful.
    redirect_to potlucks_path
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
