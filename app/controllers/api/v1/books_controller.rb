class Api::V1::BooksController < ApplicationController
  def index
    current_forecast = ForecastFacade.create_current_weather(params[:location])
    books = BookFacade.book_search(params[:location])
    json = render json: BookSerializer.format_json(current_forecast, params[:location], params[:quantity], books)
  end
end
