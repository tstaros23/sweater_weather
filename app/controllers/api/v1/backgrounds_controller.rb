class Api::V1::BackgroundsController < ApplicationController
  def index
    location = "denver,co"
    image = BackgroundFacade.image_search(location)
    render json: BackgroundSerializer.format_json(image)
  end
end
