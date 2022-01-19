class RoadTrip
  attr_reader :start_city, :end_city, :travel_time, :weather_at_data

  def initialize(attr)
    @start_city = attr[:start_city]
    @end_city = attr[:end_city]
    @travel_time = attr[:travel_time]
    @weather_at_data = attr[:weather_at_data]
  end
end
