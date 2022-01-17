class BackgroundFacade
  def self.image_search(location)
    background_data = BackgroundService.get_image(location)
  end
end
