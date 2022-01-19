class Api::V1::RoadtripsController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if !params[:api_key].present? || user.nil?
      render json: {errors: {details: "Unauthorized"}}, status: :unauthorized
    elsif
      road_trip = RoadTripFacade.road_trip_info(params[:origin],params[:destination])
      render json: RoadtripSerializer.new(road_trip)
    end
  end
end
