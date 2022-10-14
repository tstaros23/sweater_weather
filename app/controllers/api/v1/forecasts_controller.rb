class Api::V1::ForecastsController < ApplicationController
  def index
    current_weather = ForecastFacade.create_current_weather(params[:location])
    daily_weather = ForecastFacade.create_daily_weather(params[:location])
    hourly_weather = ForecastFacade.create_hourly_weather(params[:location])
    #work on calling only one service
    render json: ForecastSerializer.format_json(current_weather, daily_weather, hourly_weather)
  end
end
