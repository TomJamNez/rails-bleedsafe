class FirstAidMapsController < ApplicationController
  def index
    @first_aid_maps = FirstAidMap.all
  end

  def create
    @first_aid_map = FirstAidMap.new(first_aid_map_params)
    if @first_aid_map.save
      redirect_to first_aid_maps_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @first_aid_map = FirstAidMap.find(params[:id])
  end

  def update
    @first_aid_map = FirstAidMap.find(params[:id])
    if @first_aid_map.update(first_aid_map_params)
      redirect_to first_aid_maps_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @first_aid_map = FirstAidMap.find(params[:id])
    @first_aid_map.destroy
    redirect_to first_aid_maps_path, status: :see_other
  end

  private

  def first_aid_map_params
    params.require(:first_aid_map).permit(:name, :address, :latitude, :longitude, :category, :description)
  end
end
