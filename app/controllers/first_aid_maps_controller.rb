class FirstAidMapsController < ApplicationController
  before_action :set_map, only: [:edit, :update, :destroy]

  def index
    @first_aid_maps = FirstAidMap.all
    @markers = @first_aid_maps.map do |map|
      {
        lat: map.latitude,
        lng: map.longitude,
        info_window: render_to_string(partial: "info_window", locals: { map: map }),
      }
    end
  end

  def new
    @first_aid_map = FirstAidMap.new
  end

  def create
    @first_aid_map = FirstAidMap.new(map_params)
    if @first_aid_map.save
      redirect_to first_aid_maps_path, notice: 'Location added successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @first_aid_map.update(map_params)
      redirect_to first_aid_maps_path, notice: 'Location updated'
    else
      render :edit
    end
  end

  def destroy
    @first_aid_map.destroy
    redirect_to first_aid_maps_path, notice: 'Location removed'
  end

  private

  def set_map
    @first_aid_map = FirstAidMap.find(params[:id])
  end

  def map_params
    params.require(:first_aid_map).permit(:name, :address, :category, :description, :latitude, :longitude)
  end
end
