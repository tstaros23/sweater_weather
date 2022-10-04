class BackgroundFacade
  def self.image_search(location)
    background_data = BackgroundService.get_image(location)
    bacground_objects = background_data[:results].map do |data|
      Background.new(data, location)
    end
  end
end
