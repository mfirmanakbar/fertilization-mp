class SessionsController < ApplicationController

  skip_before_action :require_user, only: [:new, :create]

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      # flash[:success] = "You have successfully logged in"
      redirect_to dashboard_path
    else
      flash[:danger] = "Failed to log in"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    # flash[:success] = "You have logged out"
    redirect_to login_path
  end

end
