class Api::V1::BackgroundsController < ApplicationController
  def index
    image = BackgroundFacade.image_search(params[:location])
    render json: BackgroundSerializer.format_json(image)
  end
end
