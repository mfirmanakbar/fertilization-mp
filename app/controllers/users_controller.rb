class UsersController < ApplicationController

  require 'securerandom'
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  skip_before_action :require_user, only: [:signup, :create, :forget_password, :send_reset_password]

  def index
    sql = "select u.id, u.name, u.username, u.email, r.id as role_id, r.role_name " +
          "from users u " +
          "left join roles r on r.id = u.role_id "
    @userJobPosition = ApplicationRecord.connection.execute(sql) # return hashmap
  end

  def forget_password
    @model = User.new
  end

  def send_reset_password
    @user = User.new(user_params)
    if User.find_by_email(@user.email)
      # update random password
      reset_new_password = SecureRandom.urlsafe_base64(5)
      user_update = User.find_by_email(@user.email)
      user_update.update_attribute(:password, reset_new_password)
      # send email
      NotificationMailer.notification_email(@user.email, reset_new_password).deliver_now
      # msg
      flash[:success] = "Please check your inbox or spam in your email #{@user.email}"
      redirect_to login_path
    else
      flash[:danger] = "#{@user.email} not registered in our system"
      redirect_to forget_path
    end
  end

  def new
    require_admin_users_page
    @user = User.new
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if logged_in?
      # create user from dashboard
      require_admin_users_page
      if @user.save
        flash[:success] = "#{@user.email} was created successfully."
        redirect_to users_path
      else
        flash[:danger] = "Failed to create user."
        redirect_to new_user_path(@user)
      end
    else
      # signup
      @user.role_id = 3 # hard code for GUEST
      if @user.save
        flash[:success] = "Hi #{@user.email} your account was registered successfully. Please Log In."
        redirect_to login_path
      else
        flash[:danger] = "Register was failed."
        redirect_to signup_path(@user)
      end
    end
  end

  def edit
    require_admin_users_page
  end

  def show
    require_admin_users_page
  end

  def update
    require_admin_users_page
    if @user.update(user_params)
      flash[:success] = "#{@user.email} was updated successfully."
      redirect_to users_path
    else
      flash[:danger] = "Failed to update user."
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    if get_role_id != 1
      flash[:danger] = "You have no permission to perform that action "
      redirect_to users_path
    else
      @user.destroy
      flash[:success] = "User have been deleted"
      redirect_to users_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :name, :role_id)
    end

    def set_user
      @user = User.find(params[:id])
    end

  def require_admin_users_page
    if get_role_id != 1
      flash[:danger] = "You have no permission to perform that action "
      redirect_to users_path
    end
  end

end
