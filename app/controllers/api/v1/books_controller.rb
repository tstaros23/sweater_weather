class Api::V1::BooksController < ApplicationController
  def index
    current_forecast = ForecastFacade.create_current_weather(params[:location])
    books = BookFacade.book_search(params[:location])[0,params[:quantity].to_i]
    json = render json: BookSerializer.format_json(current_forecast, params[:location], params[:quantity], books)
  end
end
