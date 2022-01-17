class BackgroundFacade
  def self.image_search(location)
    background_data = BackgroundService.get_image(location)
    stuff = background_data[:results].map do |data|
      Background.new(data, location)
    end
  end
end
