class ForecastFacade
  def self.forecast_search(location)
    map_data = MapQuestService.get_geocode(location)
    latitude = map_data[:results][0][:locations][0][:latLng][:lat]
    longitude = map_data[:results][0][:locations][0][:latLng][:lng]

    payload = ForecastService.get_forecast(latitude,longitude)
    forecast = payload.map do |data|
      Forecast.new(data)
    end
  end
end
