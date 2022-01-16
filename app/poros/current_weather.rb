require 'date'

class CurrentWeather
  attr_reader :temperature, :feels_like, :datetime, :sunrise, :sunset, :humidity, :visibility, :conditions, :icon, :uvi, :id

  def initialize(attr)
    @datetime = Time.at(attr[:dt]).to_s
    @sunrise = Time.at(attr[:sunrise]).to_s
    @sunset = Time.at(attr[:sunset]).to_s
    @humidity = attr[:humidity].to_f
    @visibility = attr[:visibility]
    @temperature = attr[:temp]
    @feels_like = attr[:feels_like]
    @conditions = attr[:weather][0][:description]
    @icon = attr[:weather][0][:icon]
    @uvi = attr[:uvi]
  end
end
