class CurrentWeather
  attr_reader :temperature, :feels_like, :datetime

  def initialize(attr)
    
    @datetime = attr[:dt]
    @temperature = attr[:temp]
    @feels_like = attr[:feels_like]
  end
end
