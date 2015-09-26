class SessionsController < ApplicationController

  skip_before_filter :require_user, :only => [:new, :create]

  def new
  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
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
    redirect_to root_url, :notice => "Logged out"
  end

end
