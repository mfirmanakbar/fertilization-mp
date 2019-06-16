class SessionsController < ApplicationController

  skip_before_action :require_user, only: [:login, :create]

  def login
    # @user = User.new
    if logged_in?
      redirect_to dashboard_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      session[:name] = user.name
      session[:username] = user.username
      session[:email] = user.email
      # flash[:success] = "You have successfully logged in"
      redirect_to dashboard_path
    else
      flash[:danger] = "Incorrect email address and / or password."
      render 'login'
    end
  end

  def destroy
    session[:user_id] = nil
    # flash[:success] = "You have logged out"
    redirect_to login_path
  end

end
