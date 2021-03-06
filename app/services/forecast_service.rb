class ForecastService < BaseService
  def self.get_forecast(latitude,longitude, hourly = 8)
     response = conn('https://api.openweathermap.org/data/2.5/onecall').get do |f|
       f.params['lat'] = latitude
       f.params['lon'] = longitude
       f.params['daily'] = 5
       f.params['hourly'] = hourly
       f.params['units'] = 'imperial'
       f.params['lan'] = 'english'
       f.params['exclude'] = 'minutely, alerts'
       f.params['appid'] = ENV["weather_api_key"]
     end
     get_json(response)
   end
end
