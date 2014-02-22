# encoding: utf-8
class LocationsController < ApplicationController
  before_action :set_location, only: :show_map
  
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
