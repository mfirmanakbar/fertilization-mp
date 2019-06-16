class SessionsController < ApplicationController

  skip_before_action :require_user, only: [:login, :create]

  def login
    clear_all_msg
    # @user = User.new
    if logged_in?
      redirect_to dashboard_path
    end
  end

  def create
    clear_all_msg
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      # flash[:success] = "You have successfully logged in"
      redirect_to dashboard_path
    else
      flash[:danger] = "Incorrect email address and / or password."
      render 'login'
    end
  end

  def destroy
    clear_all_msg
    session[:user_id] = nil
    # flash[:success] = "You have logged out"
    redirect_to login_path
  end

end
