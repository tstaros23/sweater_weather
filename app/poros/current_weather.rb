class CurrentWeather
  attr_reader :temperature, :feels_like, :datetime

  def initialize(attr)
    @datetime = attr[:dt]
    @sunrise = attr[:sunrise]
    @humidity = attr[:humidity]
    @visibility = attr[:visibility]
    @temperature = attr[:temp]
    @feels_like = attr[:feels_like]
  end
end
