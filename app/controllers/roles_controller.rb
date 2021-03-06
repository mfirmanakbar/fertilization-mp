class RolesController < ApplicationController

  before_action :set_role_by_id, only: [:edit, :update, :show, :destroy]

  def index
    @roles = Role.all
    respond_to do |format|
      datenow = Time.now.strftime("%Y%d%m%H%M%S")
      filenaming = ("roles-" + datenow + ".csv")
      format.html
      format.csv { send_data @roles.to_csv, :filename => filenaming }
    end
  end

  def new
    @role = Role.new
    require_admin_users_page
  end

  def edit
    require_admin_users_page
  end

  def create
    require_admin_users_page
    @role = Role.new(role_params)
    if @role.save
      flash[:success] = "Role was successfully created"
      redirect_to roles_path
    else
      render 'new'
    end
  end

  def update
    require_admin_users_page
    if @role.update(role_params)
      flash[:success] = "Role was successfully updated"
      redirect_to roles_path
    else
      render 'edit'
    end
  end

  def destroy
    if get_role_id != 1
      flash[:danger] = "You have no permission to perform that action "
      redirect_to roles_path
    else
      @role.destroy
      flash[:success] = "Role was successfully deleted"
      redirect_to roles_path
    end
  end

  private
    def set_role_by_id
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:role_name)
    end

    def flash_clear
      flash.clear
    end
  # end-of-private

  def require_admin_users_page
    if get_role_id != 1
      flash[:danger] = "You have no permission to perform that action "
      redirect_to roles_path
    end
  end

end
