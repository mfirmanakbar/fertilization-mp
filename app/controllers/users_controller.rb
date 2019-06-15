class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :show, :destroy]
  skip_before_action :require_user, only: [:signup, :create]

  def index
    sql = "select u.id, u.name, u.username, u.email, r.id as role_id, r.role_name " +
          "from users u " +
          "left join roles r on r.id = u.role_id "
    @userJobPosition = ApplicationRecord.connection.execute(sql) # return hashmap
    # @userJobPosition = JSON.pretty_generate(@userJobPosition)
  end

  def new
    @user = User.new
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if !logged_in?
        flash[:success] = "Hi #{@user.email} your account was registered successfully. Please Log In."
        redirect_to login_path
      else
        flash[:success] = "#{@user.email} was created successfully."
        redirect_to users_path
      end
    else
      if !logged_in?
        flash[:danger] = "Register was failed."
        redirect_to new_user_path(@user)
      else
        flash[:danger] = "Failed to create user."
        redirect_to new_user_path(@user)
      end
    end
  end

  def edit
  end

  def show
  end

  def update
    if @user.update(user_params)
      flash[:success] = "#{@user.email} was updated successfully."
      redirect_to users_path
    else
      flash[:danger] = "Failed to update user."
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User have been deleted"
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :name, :role_id)
    end

    def set_user
      @user = User.find(params[:id])
    end

  def require_admin

  end

end
