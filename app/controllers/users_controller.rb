class UsersController < ApplicationController

  skip_before_action :require_user, only: [:new, :create]

  def index
    # @userList = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Hi #{@user.email}, your account was registered successfully. Please Log In."
      redirect_to login_path
    else
    end
  end

  def edit

  end

  def show

  end

  def update

  end

  def destroy

  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user

    end
  # end-of-private

  def require_admin

  end

end
