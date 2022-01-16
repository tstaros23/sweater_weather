class ForecastFacade
  def self.forecast_search(location)
    map_data = MapQuestService.get_geocode(location)
    latitude = map_data[:results][0][:locations][0][:latLng][:lat]
    longitude = map_data[:results][0][:locations][0][:latLng][:lng]

    payload = ForecastService.get_forecast(latitude,longitude)

    current_weather = payload[:current].map do |data|
      CurrentWeather.new(data)
      require "pry"; binding.pry
    end

    hourly_weather = payload[:hourly].map do |data|
      HourlyWeather.new(data)
    end

    daily_weather = payload[:daily].map do |data|
      DailyWeather.new(data)
    end

    forecast_hash = Hash.new({})
    forecast_hash[:current_weather] = current_weather
    forecast_hash[:hourly_weather] = hourly_weather
    forecast_hash[:daily_weather] = daily_weather
    forecast_hash
  end
end
