class ForecastFacade
  def self.forecast_search(location)
    map_data = MapQuestService.get_geocode(location)
    latitude = map_data[:results][0][:locations][0][:latLng][:lat]
    longitude = map_data[:results][0][:locations][0][:latLng][:lng]

    ForecastService.get_forecast(latitude,longitude)
  end

  def self.create_current_weather(location)
    CurrentWeather.new(forecast_search(location)[:current])
  end

  def self.create_hourly_weather(location)
    forecast_search(location)[:hourly].map do |data|
      HourlyWeather.new(data)
    end
  end

  def self.create_daily_weather(location)
    forecast_search(location)[:daily].map do |data|
      DailyWeather.new(data)
    end

    # forecast_hash = Hash.new({})
    # forecast_hash[:current_weather] = current_weather
    # forecast_hash[:hourly_weather] = hourly_weather
    # forecast_hash[:daily_weather] = daily_weather
    # forecast_hash
  end
end
