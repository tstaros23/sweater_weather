require 'time'
require 'date'

class HourlyWeather
  attr_reader :time, :temperature, :conditions, :icon, :id

  def initialize(attr)
    @time = Time.at(attr[:dt]).strftime("%k:%M:%S")
    @temperature = attr[:temp]
    @conditions = attr[:weather][0][:description]
    @icon = attr[:weather][0][:icon]
  end
end
