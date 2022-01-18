class Api::V1::BooksController < ApplicationController
  def index
  if params[:quantitiy].to_i >= 0 && params[:location]
    current_forecast = ForecastFacade.create_current_weather(params[:location])
    books = BookFacade.book_search(params[:location])[0,params[:quantity].to_i]
    count = BookFacade.count_books(params[:location])
    json = render json: BookSerializer.format_json(current_forecast, params[:location],  params[:quantity], books, count)
  else
    render json: { error: {details: "bad request"}}, status: :bad_request
    end
  end
end
