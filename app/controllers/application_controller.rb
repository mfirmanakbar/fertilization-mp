class ApplicationController < ActionController::Base

  # before_action :require_user
  before_action :require_user #, :clear_all_msg
  helper_method :current_user, :logged_in?

  # get who user from DB if session user_id is exist
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # did someone login ? boolean
  def logged_in?
    !!current_user
  end

  # if someone not login then go to login page and show message below
  def require_user
    if !logged_in?
    # unless logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

  def get_role_id
    @role_id = User.find(session[:user_id]).role_id
  end


end
