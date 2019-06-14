class MaterialsController < ApplicationController

  # before_action :set_material_by_id, only: [:edit, :update, :show, :destroy]

  def index
    @material_list = Material.all
  end

  def new

  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end

  private
    def set_material_by_id
      # @material = Material.find(params[:id])
    end

  # edit/delete only for their own records
  def require_same_user

  end

end
