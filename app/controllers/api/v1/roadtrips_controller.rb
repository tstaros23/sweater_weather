class Api::V1::RoadtripsController < ApplicationController
  def create
    road_trip = RoadTripFacade.road_trip_info(params[:origin],params[:destination])
    render json: RoadtripSerializer.new(road_trip)
  end
end
