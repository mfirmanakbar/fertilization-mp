class MaterialsController < ApplicationController

  # before_action :clear_all_msg
  before_action :set_material_by_id, only: [:edit, :update, :show, :destroy]

  def index
    @material_list = Material.all
    respond_to do |format|
      datenow = Time.now.strftime("%Y%d%m%H%M%S")
      filenaming = ("materials-" + datenow + ".csv")
      format.html
      format.csv { send_data @material_list.to_csv, :filename => filenaming }
      # format.json { render json: @material_list }
    end
  end

  def new
    @material = Material.new
  end

  def edit
    # already set at before_action
  end

  def import_csv

  end

  def create
    @material = Material.new(material_params)
    if @material.save
      flash[:success] = "Material was successfully created"
      redirect_to materials_path
    else
      render 'new'
    end
  end

  def update
    # the function already define in before_action
    if @material.update(material_params)
      flash[:success] = "Material was successfully updated"
      redirect_to material_path(@material)
    else
      render 'edit'
    end
  end

  def destroy
    # already set at before_action
    @material.destroy
    flash[:success] = "Material was successfully deleted"
    redirect_to materials_path
  end

  def import
    if get_file_params != nil
      Material.to_import(get_file_params)
      flash[:success] = "Material was successfully Imported"
      redirect_to materials_path
    else
      flash[:danger] = "Failed to import Material from CSV"
      redirect_to materials_path
    end
  end

  def download_template
    send_file("#{Rails.root}/app/assets/template-material-import.csv",
      :type=> "application/csv",
      :disposition=> "attachment; filename=template-material-import.csv")
  end

  # begin-private
  private
    def set_material_by_id
      @material = Material.find(params[:id])
    end

    def get_file_params
      params[:file]
    end

    def material_params
      params.require(:material).permit(:material_name, :stock_qty)
    end
  # end-of-private

  # def require_same_user
  #   # edit/delete only for their own records
  # end



end
