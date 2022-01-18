class ActivitySerializer
  def self.format_json(location)
    {
      data: {
        id: nil,
        type: 'activities',
        attributes: {
          destination: location

        }
      }
    }
  end

  def self.format_current_weather(location)
    current = ForecastFacade.forecast_search(location)[:current]
    require "pry"; binding.pry
  end
end
