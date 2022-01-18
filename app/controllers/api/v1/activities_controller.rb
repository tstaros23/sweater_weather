class Api::V1::ActivitiesController < ApplicationController
  def index
    if params[:destination]
      forecast = ForecastFacade.forecast_search(params[:destination])
      current_forecast = ForecastFacade.create_current_weather(params[:destination])
      activities = ActivityFacade.activity_search(current_forecast.temperature)
      json = render json: ActivitySerializer.format_json(params[:destination], current_forecast, activities)
    else
      render json: { error: { details: "bad request"}}, status: :bad_request
    end
  end
end
