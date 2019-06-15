class UsersController < ApplicationController

  skip_before_action :require_user, only: [:new, :create]

  def index
    @users = User.all

    @users = User.includes(:role)


    # query = "SELECT * FROM USERS"
    # @users = User.connection.execute(query, :skip_logging)

    # @users = User.find_by_sql "SELECT * FROM USERS"

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
