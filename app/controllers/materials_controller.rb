class MaterialsController < ApplicationController

  # before_action :set_material_by_id, only: [:edit, :update, :show, :destroy]

  def index
    @material_list = Material.all
  end

  def new
    @material = Material.new
  end

  def edit

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

  end

  def destroy

  end

  private
    def set_material_by_id
      # @material = Material.find(params[:id])
    end

  def material_params
    params.require(:material).permit(:material_name, :stock_qty)
  end

  # edit/delete only for their own records
  def require_same_user

  end


end
