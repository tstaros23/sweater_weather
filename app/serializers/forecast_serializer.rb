class ForecastSerializer

  def self.format_json(current, daily, hourly)
    {
      data: {
        id: nil,
        type: 'forecast',
        attributes: {
          current_weather: format_current(current),
          daily_weather: format_daily(daily),
          hourly_weather: format_hourly(hourly)
        }
      }
    }
  end

  def self.format_current(current)

       {
        datetime: current.datetime,
        temperature: current.temperature,
        feels_like: current.feels_like,
        sunrise: current.sunrise,
        humidity: current.humidity,
        visibility: current.visibility,
        conditions: current.conditions,
        icon: current.icon,
        uvi: current.uvi,
        sunset: current.sunset
      }
  end

  def self.format_daily(daily)
    daily.map do |obj|
      {
        date: obj.date,
        sunrise: obj.sunrise,
        sunset: obj.sunset,
        max_temp: obj.max_temp,
        min_temp: obj.min_temp,
        conditions: obj.conditions,
        icon: obj.icon
      }
    end
  end

  def self.format_hourly(hourly)
    hourly.map do |obj|
      {
        time: obj.time,
        temperature: obj.temperature,
        conditions: obj.conditions,
        icon: obj.icon
      }
    end
  end
end
