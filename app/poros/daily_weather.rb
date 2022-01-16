require 'date'
require 'time'

class DailyWeather
  attr_reader :date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon, :id

  def initialize(attr)
    @date = Time.at(attr[:dt]).strftime("%Y-%m-%d")
    @sunrise = Time.at(attr[:sunrise]).to_s
    @sunset = Time.at(attr[:sunset]).to_s
    @max_temp = attr[:temp][:max]
    @min_temp = attr[:temp][:min]
    @conditions = attr[:weather][0][:description]
    @icon = attr[:weather][0][:icon]
  end
end
