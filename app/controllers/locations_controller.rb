# encoding: utf-8
class LocationsController < ApplicationController
  before_action :set_location, only: :show_map

  # GET /events/1
  # GET /events/1.json
  def show_map
    @location = Location.find(params[:location_id])
    
    @hash = Gmaps4rails.build_markers(@location) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
    end
    
    @gmaps_options = {
      "map_options" => { "auto_zoom" => false, "zoom" => 12, "center_latitude" => @location.latitude, "center_longitude" => @location.longitude },
      "markers" => { "data" => @hash }
    }
  end
  
  def create
    @location = Location.new(location_params)
    @location.save
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(
      :street,
      :number,
      :zip,
      :city,
      :country,
      :latitude,
      :longitude
      )
    end
    
end
