class Api::V1::ForecastsController < ApplicationController
  def index
    location = "denver,co"
    forecast = ForecastFacade.forecast_search(location)
    current_weather = ForecastFacade.create_current_weather(location)
    daily_weather = ForecastFacade.create_daily_weather(location)
    hourly_weather = ForecastFacade.create_hourly_weather(location)
    render json: ForecastSerializer.format_json(current_weather, daily_weather, hourly_weather)
  end
end
