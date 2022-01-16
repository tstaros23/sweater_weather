require 'date'

class DailyWeather
  attr_reader :datetime, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon

  def initialize(attr)
    @datetime = Time.at(attr[:dt]).to_s
    @sunrise = Time.at(attr[:sunrise]).to_s
    @sunset = Time.at(attr[:sunset]).to_s
    @max_temp = attr[:temp][:max]
    @min_temp = attr[:temp][:min]
    @conditions = attr[:weather][0][:description]
    @icon = attr[:weather][0][:icon]
  end
end
