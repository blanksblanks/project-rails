class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user
      # session store wraps data cached from request to request
      session[:user_id] = user.id
      redirect_to users_path
    else
      redirect_to new_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
